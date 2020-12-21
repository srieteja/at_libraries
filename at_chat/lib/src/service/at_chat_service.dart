import 'package:at_chat/src/model/at_chat.dart';

abstract class AtChatService {
  // Create a new chat in secondary
  Future<bool> add(AtChat chat);

// Updates chat
  Future<bool> update(AtChat chat);

  // delete chat
  Future<bool> deleteChat(AtChat chat);

  // delete chat by atSign
  Future<bool> delete(String atSign);

  //fetch all chats
  Future<List<AtChat>> listChats();

  //get chat by atSign
  Future<AtChat> get(String atSign);

  // fetch all active chats
  Future<List<AtChat>> listActiveChats();

  // fetch all blocked chats
  Future<List<AtChat>> listBlockedChats();

  // fetch favorite chats
  Future<List<AtChat>> listFavoriteChats();
}
