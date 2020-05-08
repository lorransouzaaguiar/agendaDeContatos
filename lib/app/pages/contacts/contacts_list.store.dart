import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:app_contatos_1/app/models/contact.model.dart';

part 'contacts_list.store.g.dart';

class ContactStore = _ContactStoreBase with _$ContactStore;

abstract class _ContactStoreBase with Store {

  @observable
  ObservableList<Contact> contacts = ObservableList<Contact>();
  
  @observable
  File image;

  @observable
  int listIndex;

  @action
  void setListIndex(int index){
    listIndex = index;
  }

  @action 
  setImage({File savedImage}) async {
    if(savedImage == null)
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    else image = savedImage;
  }

  @action
  setImageToNull(){
    image = null;
  }

  @action
  void add(Contact contactModel){
    contacts.add(contactModel);
  }

  @action
  void edit(Contact contact){
    contacts.removeAt(listIndex);
    contacts.insert(listIndex, contact);
  }

  @action
  void remove(){
    contacts.removeAt(listIndex);
  }
}