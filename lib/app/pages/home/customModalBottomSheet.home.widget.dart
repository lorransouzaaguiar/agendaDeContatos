import 'package:app_contatos_1/app/controller/contact.page.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomModalBottomSheet extends StatelessWidget {
  
  var _controllerPage = Modular.get<ContactPageController>();
  
  @override
  Widget build(BuildContext context) {

    double _heightScreen = MediaQuery.of(context).size.height;

    return Container(
      height: _heightScreen * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.all(20),
            child: Text('Ligar',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              launch("tel:${_controllerPage.getContactNumber()}");
              Modular.to.pop();
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(20),
            child: Text('Editar',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),),
            onPressed: () {
              _controllerPage.setFields();
              Modular.to.popAndPushNamed('/contact_edit_form');
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(20),
            child: Text('Remover',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),),
            onPressed: () {
              Modular.to.showDialog(
                builder: (context){
                  return AlertDialog(
                    title: Text("Deseja remover esse contato?"),
                    content: Text("Ao remover esse contato as infromações serão removidas permanentemente"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Cancelar"), 
                        onPressed: Modular.to.pop,
                      ),
                      FlatButton(
                        child: Text("Sim"), 
                        onPressed: () {
                          _controllerPage.deleteContact();
                          Modular.to.popAndPushNamed('/');
                        }
                      ),
                    ]
                  );
                },
              );
            }
          )
      ]),
    );
  }
}
