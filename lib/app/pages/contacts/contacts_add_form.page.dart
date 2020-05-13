import 'package:app_contatos_1/app/controller/contact.page.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddContactForm extends StatefulWidget {
  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {

  var _controllerPage = Modular.get<ContactPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Contatos"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _controllerPage.formKey,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Observer(
                      builder: (_){
                        return CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          backgroundImage: _controllerPage.imagePath != null ? 
                            AssetImage(_controllerPage.imagePath) : 
                              AssetImage('images/person.png')
                        );
                      },
                    ),
                    onTap: _controllerPage.setImage,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      labelText: 'Nome'
                    ),
                    validator: _controllerPage.validatorField,
                    onSaved: _controllerPage.saveFieldName,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email'
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Numero',
                      labelText: 'Numero'
                    ),
                    keyboardType: TextInputType.number,
                    validator: _controllerPage.validatorField,
                    onSaved: _controllerPage.saveFieldNumber,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: (){
           if(_controllerPage.saveForm() == true)
            Modular.to.pushReplacementNamed('/');         
        },
      ),
    );
  }
}