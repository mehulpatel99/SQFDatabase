import 'package:flutter/material.dart';
import 'package:my_sunday_sqf/Sqf_Database/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class MyRepo{
  MyDatabase? _myDatabase;
  Database? _database;

  MyRepo(){
    _myDatabase = MyDatabase();
  }

  Future<Database?> myFun()async{
    if(_database != null){
      return _database;
    }else{
      _database = await _myDatabase?.mySet();
      return _database;
    }
  }

  getData(table)async{
    var con = await myFun();
    return await con?.query(table);
  }

  insertData(table,data)async{
    var con = await myFun();
    return await con?.insert(table,data);
  }

  updateData(table,data)async{
    var con = await myFun();
    return await con?.update(table,data,where: 'id=?',whereArgs: [data['id']]);
  }

  deleteData(table,data)async{
    var con = await myFun();
    return await con?.delete(table,where: 'id=?',whereArgs: [data['id']]);
  }

  authLogin({String? email,String? pass})async{
    var con = await myFun();
    return await  con!.rawQuery('SELECT * FROM sunday WHERE email = "$email" AND pass = "$pass"');
  }
}