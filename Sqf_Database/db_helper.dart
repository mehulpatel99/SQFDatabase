import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase{
  Future<Database> mySet()async{
    var dir = await  getApplicationCacheDirectory();
    var path = join(dir.path,'db');
    var database = openDatabase(path,onCreate:myTable,version: 1);
    return database;
  }

  Future<void> myTable(Database myDb,int version)async{
    String sql = 'CREATE TABLE sunday(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,email TEXT,pass TEXT)';
    return await myDb.execute(sql);
  }

}