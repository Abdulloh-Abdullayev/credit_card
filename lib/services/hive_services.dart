

import 'package:contact/models/card_model.dart';
import 'package:hive/hive.dart';

class HiveDB {
  var box = Hive.box('Hive');

  void storeUser(Welcome value)async{
    box.put('value', value.toJson());
  }

  Welcome loadUser(){
    var value = Welcome.fromJson(box.get('value'));
    return value;
  }

  void removeUser(){
    box.delete('value');
  }
}