import 'package:app_contatos_1/app/models/contact.model.dart';
import 'package:app_contatos_1/app/repository/sqflite_interface.repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'contact.page.controller.g.dart';

class ContactPageController = _ContactPageControllerBase with _$ContactPageController;

abstract class _ContactPageControllerBase with Store {
  
  IRepository _repository;
  var nameController = TextEditingController(); 
  var emailController = TextEditingController(); 
  var numberController = TextEditingController(); 
  var formKey = GlobalKey<FormState>();

  _ContactPageControllerBase(IRepository this._repository);

  @observable
  ObservableList<Contact> contacts = ObservableList<Contact>();

  @observable
  String imagePath;

  @observable
  int elementId;

  @action
  setImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    imagePath = image.path;
  }

  @action
  setElementId(int index){
    elementId = index;
  }

  @action
  getContactImagePath(){
    _repository.getContact(elementId).then(
     (contact){
       imagePath = contact.imagePath;
     }
   );
  }

  getContactNumber(){
    Contact contact = contacts.singleWhere((contact) => contact.id == elementId);
    return contact.number;
  }

  saveContact(){
    _repository.saveContacts(Contact.setContact(
        name: nameController.text,
        email: emailController.text,
        number: numberController.text,
        imagePath: imagePath == null ? 'images/person.png': imagePath
      ));
    clearFields();
  }

  deleteContact(){
    _repository.deleteContact(elementId);
    getAllContacts();
  }

  upadateContact(){
    Contact contact = contacts.singleWhere((contact) => contact.id == elementId);
    contact.name = nameController.text;
    contact.email = emailController.text;
    contact.number = numberController.text;
    contact.imagePath = imagePath == null ? 'images/person.png': imagePath;
    _repository.updateContact(contact);
    getAllContacts();
  }

  @action
  getAllContacts() {
     _repository.getAllContacts().then((contactList) {
       contacts = contactList.asObservable();
     });
  }

  @action
  clearFields(){
    nameController.text = '';
    emailController.text = '';
    numberController.text = '';
    imagePath = null;
  }

  setFields(){
    Contact contact = contacts.singleWhere((contact) => contact.id == elementId);;
    nameController.text = contact.name;
    emailController.text = contact.email;
    numberController.text = contact.number;
  }

   String validatorField(String value){
    if(value == null || value.isEmpty)
      return 'O campo do contato não pode ser vazio';
    else null;
  }

  saveFieldName(String value){
    nameController.text = value;
  }
  saveFieldEmail(String value){
    emailController.text = value;
  }
  saveFieldNumber(String value){
    numberController.text = value;
  }

  bool saveForm(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      saveContact();
      return true;
    } else return false;
  }

}