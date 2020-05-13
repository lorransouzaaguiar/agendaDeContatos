import 'package:app_contatos_1/app/models/contact.model.dart';
import 'package:app_contatos_1/app/repository/sqflite_interface.repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import './sqflite_interface.repository.dart';

final String contactTable = 'contactTable';
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String numberColumn = "numberColumn";
final String imageColumn = "imageColumn";

class Repository implements IRepository{

  Database _db;

  get _database async{
    if(_db != null)
      return _db;
    else {
      _db = await _initDb();
      return _db;
    }
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'contacts.db');

    return await openDatabase(
      path, version: 1, 
      onCreate: (db, newVersion) async{
        await db.execute(
          "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT,"
            "$emailColumn TEXT, $numberColumn TEXT, $imageColumn TEXT)"
        );
      }
    );
  }

  @override
  Future<Contact> saveContacts(Contact contact) async{
    Database dbContact = await _database;
    contact.id = await dbContact.insert(contactTable, contact.toMap());
    return contact;
  }

  @override
  Future<List<Contact>> getAllContacts() async {
    Database dbContact = await _database;
    var data = await dbContact.rawQuery("SELECT * FROM $contactTable");
    List<Contact> contacts = data.map<Contact>(
      (map){
        return Contact.fromMap(map);
      }).toList();

    return contacts;
  }

  Future<Contact> getContact(int id) async {
    Database dbContact = await _database;
    List<Map> maps = await dbContact.query(contactTable,
      columns: [idColumn, nameColumn, emailColumn, numberColumn, imageColumn],
      where: "$idColumn = ?",
      whereArgs: [id]);
    if(maps.length > 0){
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }

  @override
  Future<int> deleteContact(int id) async {
    Database dbContact = await _database;
    return await dbContact.delete(contactTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  @override
  Future<int> updateContact(Contact contact) async {
    Database dbContact = await _database;
    return await dbContact.update(contactTable,
        contact.toMap(),
        where: "$idColumn = ?",
        whereArgs: [contact.id]);
  }

}