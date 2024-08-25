import 'package:flutter/material.dart';

class MyModel{
  int? id;
  String? name;
  String? email;
  String? pass;

  userMap(){
    var mapping = Map<String,dynamic>();
    mapping['id'] = id??null;
    mapping['name'] = name;
    mapping['email'] = email;
    mapping['pass'] = pass;
    return mapping;
  }

}