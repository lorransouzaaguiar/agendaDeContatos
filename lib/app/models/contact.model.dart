
import 'dart:io';

class Contact{
  int id;
  String name;
  String email;
  String number;
  String imagePath;

  Contact({this.name, this.email, this.number, this.imagePath});

  factory Contact.setContact({String name, email, number, imagePath}){
    return Contact(
      name: name,
      email: email,
      number: number,
      imagePath: imagePath
    );
  }

  Contact.fromMap(Map map){
    this.id = map["idColumn"];
    this.name = map["nameColumn"];
    this.email = map["emailColumn"];
    this.number = map["numberColumn"];
    this.imagePath = map["imageColumn"];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      "nameColumn": name,
      "emailColumn": email,
      "numberColumn": number,
      "imageColumn": imagePath,
    };
    if(id != null) 
      map["idColumn"] = id;
    
    return map;
  }

}