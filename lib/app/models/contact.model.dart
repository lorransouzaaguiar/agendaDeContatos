
import 'dart:io';

class Contact{

  String name;
  String email;
  String number;
  File image;

  Contact({this.name, this.email, this.number, this.image});

  factory Contact.setContact({String name, email, number, File image}){
    return Contact(
      name: name,
      email: email,
      number: number,
      image: image
    );
  }

}