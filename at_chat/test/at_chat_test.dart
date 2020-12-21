import 'package:at_client/at_client.dart';
import 'package:at_chat/at_chat.dart';
import 'package:at_chat/src/model/at_chat.dart';
import 'package:test/test.dart';
import 'test_util.dart';

Future<void> main() async {
  AtChatsImpl atChat;
  AtChat chat;
  var atSign = '@vinod';
  try {
    await AtClientImpl.createClient(
        '@colin', '', TestUtil.getPreferenceRemote());

    atChat = await AtChatsImpl.getInstance('@colin');
    // set chat details
    chat = AtChat(
      atSign: atSign,
    );
  } on Exception catch (e, trace) {
    print(e.toString());
    print(trace);
  }
  group('A group of at_chat  tests', () {
    //test create chat
    test(' test create a chat ', () async {
      var result = await atChat.add(chat);
      print('create result : $result');
      expect(result, true);
    });

    //test update chat
    test(' test update chat', () async {
      // update the chat type
      chat.type = ChatType.Individual;
      var result = await atChat.update(chat);
      print('update result : $result');
      expect(result, true);
    });

    // test get chat
    test(' test get chat by atSign', () async {
      var result = await atChat.get('$atSign');
      print('get result : $result');
      expect(result is AtChat, true);
      expect(result.atSign, atSign);
    });

    // test active chat
    test(' test check active chat ', () async {
      // update the chat type
      chat.type = ChatType.Individual;
      chat.blocked = false;
      var updateResult = await atChat.update(chat);
      print('update result : $updateResult');
      expect(updateResult, true);

      var result = await atChat.get(atSign);
      expect(result is AtChat, true);
      expect(result.blocked, false);
    });

    // test get all active chats
    test(' test get all active chats', () async {
      var result = await atChat.listActiveChats();
      print('result : $result');
      expect(result.length, greaterThan(0));
    });

    // test blocked chat
    test(' test check blocked  chat', () async {
      // update the chat type
      chat.type = ChatType.Individual;
      chat.blocked = true;
      var updateResult = await atChat.update(chat);
      print('update result : $updateResult');
      expect(updateResult, true);

      var result = await atChat.get(atSign);
      print(result);
      expect(result is AtChat, true);
      expect(result.blocked, true);
    });

    //test get all blocked chats
    test(' test get all blocked chats', () async {
      var result = await atChat.listBlockedChats();
      print('result : $result');
      expect(result.length, greaterThan(0));
    });

    // test favorite chat
    test('test check favorite  chat', () async {
      // update the chat type
      chat.type = ChatType.Individual;
      chat.favourite = true;
      var updateResult = await atChat.update(chat);
      print('update result : $updateResult');
      expect(updateResult, true);

      var result = await atChat.get(atSign);
      print(result);
      expect(result is AtChat, true);
      expect(result.favourite, true);
    });

    // test get all favorite chats
    test(' test get all favorite chats', () async {
      var result = await atChat.listFavoriteChats();
      print('result : $result');
      expect(result.length, greaterThan(0));
    });

    // test get all chats
    test(' test get all chats', () async {
      var result = await atChat.listChats();
      print('getAll result : $result');
      expect(result.length, greaterThan(0));
    });

    //delete chat
    test(' test delete chat by atSign', () async {
      var result = await atChat.delete('$atSign');
      print('delete result : $result');
      expect(result, true);
    });
  });
}
