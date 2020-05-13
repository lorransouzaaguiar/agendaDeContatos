import 'package:app_contatos_1/app/controller/contact.page.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditContactPage extends StatefulWidget {

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  var _controllerPage = Modular.get<ContactPageController>();

  @override
  void initState() {
    super.initState();
    _controllerPage.getContactImagePath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Contatos"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: (){
            Modular.to.showDialog(
              builder: (context){
                return AlertDialog(
                  title: Text("Descartar alterações?"),
                  content: Text("Se sair as alterações serão descartadas"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Cancelar"), 
                      onPressed: Modular.to.pop,
                    ),
                    FlatButton(
                      child: Text("Sair"), 
                      onPressed: () {
                        Modular.to.pop();
                        Modular.to.pushReplacementNamed("/");
                      }
                    ),
                  ],
                );
              }
            );
          }),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
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
                      }
                    ),
                    onTap: _controllerPage.setImage,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      labelText: 'Nome'
                    ),
                    keyboardType: TextInputType.text,
                    controller: _controllerPage.nameController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email'
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _controllerPage.emailController, 
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Numero',
                      labelText: 'Numero'
                    ),
                    keyboardType: TextInputType.number,
                    controller: _controllerPage.numberController,
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
          _controllerPage.upadateContact();
          Modular.to.pop();
        },
      ),
    );
  }
}