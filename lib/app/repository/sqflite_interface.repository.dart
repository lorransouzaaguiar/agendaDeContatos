import 'package:app_contatos_1/app/models/contact.model.dart';

abstract class IRepository{

  Future<Contact> saveContacts(Contact contact);
  Future<List<Contact>> getAllContacts();
  Future<Contact> getContact(int id);
  Future<int> deleteContact(int id);
  Future<int> updateContact(Contact contact);
  
}