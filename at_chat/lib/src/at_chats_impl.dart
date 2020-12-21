import 'dart:convert';
import 'package:at_client/at_client.dart';
import 'package:at_chat/src/model/at_chat.dart';
import 'package:at_chat/src/service/at_chat_service.dart';
import 'package:at_chat/src/config/AppConstants.dart';
import 'package:at_commons/at_commons.dart';

class AtChatsImpl implements AtChatService {
  AtClientImpl _atClient;
  String _atSign;

  String get atSign => _atSign;

  set atSign(String value) {
    _atSign = value;
  }

  AtChatsImpl(AtClient atClient, String atSign) {
    _atSign = atSign;
    _atClient = atClient;
  }

  AtClientImpl get atClient => _atClient;

  set atClient(AtClient value) {
    _atClient = value;
  }

  static Future<AtChatsImpl> getInstance(String atSign) async {
    var atClient = await AtClientImpl.getClient(atSign);
    return AtChatsImpl(atClient, atSign);
  }

  // TODO add more dart documentation

  /// returns  true on success otherwise false.
  /// has to pass the [AtChat] to add new chat into the chat_list
  /// if atSign value is 'null' then returns false
  @override
  Future<bool> add(AtChat chat) async {
    var atSign = '${chat.atSign}';
    //check if atSign is 'null'
    if (atSign == null) return false;
    var modifiedKey = formKey(atSign);
    var json = chat.toJson();
    var value = jsonEncode(json);
    // set metadata
    var metadata = Metadata()
      ..isPublic = false
      ..namespaceAware = false;
    var atKey = AtKey()
      ..key = modifiedKey
      ..metadata = metadata;
    return await atClient.put(atKey, value);
  }

  ///update the existing chat
  @override
  Future<bool> update(AtChat chat) async {
    chat.updatedOn = DateTime.now();
    return await add(chat);
  }

  ///returns the [AtChat].has to pass the 'atSign'
  @override
  Future<AtChat> get(String atSign) async {
    var chat;
    var modifiedKey = formKey(atSign);
    var metadata = Metadata()
      ..isPublic = false
      ..namespaceAware = false;
    var atKey = AtKey()
      ..key = modifiedKey
      ..metadata = metadata;
    await atClient.get(atKey).then((atValue) {
      if (atValue != null) {
        var value = atValue.value;
        value = value?.replaceAll('data:', '');
        if (value != null && value != 'null') {
          var json = jsonDecode(value);
          if (json != null) {
            chat = AtChat.fromJson(json);
          }
        }
      }
    });

    return chat;
  }

  /// takes atSign of the chat as an input and
  /// delete the chats from the chat_list
  /// on success return true otherwise false
  @override
  Future<bool> delete(String atSign) async {
    var modifiedKey = formKey(atSign);
    var metadata = Metadata()
      ..isPublic = false
      ..namespaceAware = false;
    var atKey = AtKey()
      ..key = modifiedKey
      ..metadata = metadata;
    return atClient.delete(atKey);
  }

  /// takes   [AtChat]  as an input and
  /// delete the chats from the chat_list
  /// on success return true otherwise false
  @override
  Future<bool> deleteChat(AtChat chat) async {
    var atSign = '${chat.atSign}';
    //check if atSign is 'null'
    if (atSign == null) return false;
    return await delete(atSign);
  }

  /// fetch all chats in the list
  ///returns the list of [AtChat]
  @override
  Future<List<AtChat>> listChats() async {
    var chatList = <AtChat>[];
    var atSign = _atSign.replaceFirst('@', '');
    var regex =
    '${AppConstants.CONTACT_KEY_PREFIX}.*.${AppConstants.CONTACT_KEY_SUFFIX}.$atSign@$atSign'
        .toLowerCase();
    var scanList = await atClient.getKeys(regex: '$regex');
    if (scanList != null && scanList.isNotEmpty && scanList[0] == '') {
      return chatList;
    }
    for (var key in scanList) {
      key = reduceKey(key);
      var chat = await get(key);
      if (chat != null) chatList.add(chat);
    }
    return chatList;
  }

  /// fetch all active chats in the list
  ///returns the list of [AtChat]
  @override
  Future<List<AtChat>> listActiveChats() async {
    var chatList = await listChats();
    return chatList.where((element) => !element.blocked).toList();
  }

  /// fetch all blocked chats in the list
  ///returns the list of [AtChat]
  @override
  Future<List<AtChat>> listBlockedChats() async {
    var chatList = await listChats();
    return chatList.where((element) => element.blocked).toList();
  }

  /// fetch all Favorite chats in the list
  ///returns the list of [AtChat]
  @override
  Future<List<AtChat>> listFavoriteChats() async {
    var chatList = await listChats();
    return chatList.where((element) => element.favourite).toList();
  }

  String formKey(String key) {
    key = key.replaceFirst('@', '');
    var modifiedKey =
        '${AppConstants.CONTACT_KEY_PREFIX}.$key.${AppConstants.CONTACT_KEY_SUFFIX}.${atSign.replaceFirst('@', '')}';
    return modifiedKey;
  }

  String reduceKey(String key) {
    var modifiedKey = key
        .split('.')
        .where((element) =>
    element != AppConstants.CONTACT_KEY_PREFIX.toLowerCase() &&
        element != AppConstants.CONTACT_KEY_SUFFIX.toLowerCase() &&
        !element.contains(atSign))
        .join('');
    return modifiedKey;
  }
}
