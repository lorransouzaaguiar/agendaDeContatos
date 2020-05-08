import 'package:app_contatos_1/app/models/contact.model.dart';
import 'package:app_contatos_1/app/pages/contacts/contacts_list.store.dart';
import 'package:flutter/cupertino.dart';

class ContactFormController{

  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  
  ContactStore store;

  ContactFormController(this.store);

  addContact(){
    store.add(Contact.setContact(
      name: nameController.text,
      email: emailController.text,
      number: numberController.text,
      image: store.image
    ));
    clearFields();
  }

  setFields(){
    var contact = store.contacts.elementAt(store.listIndex);
    nameController.text = contact.name;
    emailController.text = contact.email;
    numberController.text = contact.number;
    store.setImage(savedImage: contact.image);
  }

  editContact(){
    store.edit(Contact.setContact(
      name: nameController.text,
      email: emailController.text,
      number: numberController.text,
      image: store.image,
    ));
  }

  clearFields(){
    nameController.text = '';
    emailController.text = '';
    numberController.text = '';
    store.setImageToNull();
  }
}