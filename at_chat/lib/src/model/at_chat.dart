import 'package:at_chat/src/service/util_service.dart';

class AtChat {
  String atSign;

  //ChatType.Individual
  ChatType type;

  // [ChatCategory.Other];
  List<ChatCategory> categories;

  //default false
  bool favourite;

  //default false
  bool blocked;

  //
  Map<dynamic, dynamic> tags;

  // Ex:: com.atSign.AtChat
  String clazz;

  // version default '1'
  int version;

  DateTime createdOn;

  DateTime updatedOn;

  AtChat(
      {this.type,
      this.atSign,
      this.categories,
      this.favourite,
      this.blocked,
      this.tags,
      this.clazz,
      this.version,
      this.createdOn,
      this.updatedOn}) {
    // atSign ??='@atSign';
    type ??= ChatType.Individual;
    categories ??= [ChatCategory.Other];
    favourite ??= false;
    blocked ??= false;
    clazz ??= 'org.atSign.AtChat';
    version ??= 1;
    createdOn ??= DateTime.now();
    updatedOn ??= DateTime.now();
  }

  Map<String, dynamic> toJson() {
    return {
      'atSign': atSign,
      'type': type.toString(),
      'categories': categories.map((e) => e.toString()).toList(),
      'favourite': favourite,
      'blocked': blocked,
      'tags': tags,
      'clazz': clazz,
      'version': version,
      'createdOn': UtilServices.dateToString(createdOn),
      'updatedOn': UtilServices.dateToString(updatedOn),
    };
  }

  AtChat.fromJson(Map json) {
    atSign = json['atSign'];
    type = ChatType.values
        .firstWhere((element) => element.toString() == json['type']);
    categories = (json['categories'] as List<dynamic>)
        ?.cast<String>()
        ?.map((value) => ChatCategory.values
            .firstWhere((element) => element.toString() == value))
        ?.toList();
    favourite = json['favourite'];
    blocked = json['blocked'];
    tags = json['tags'];
    clazz = json['clazz'];
    version = json['version'];
    createdOn = UtilServices.stringToDate(json['createdOn']);
    updatedOn = UtilServices.stringToDate(json['updatedOn']);
  }

  @override
  String toString() {
    return 'AtChat{atSign: $atSign, type: $type, categories: $categories, favourite: $favourite, blocked: $blocked, tags: $tags, clazz: $clazz, version: $version}';
  }
}

enum ChatType { Individual, Group, Other }

enum ChatCategory { Family, Friend, Coworker, Other }
