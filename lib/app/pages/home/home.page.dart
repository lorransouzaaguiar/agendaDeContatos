import 'package:app_contatos_1/app/pages/contacts/contacts_form.controller.dart';
import 'package:app_contatos_1/app/pages/contacts/contacts_list.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {

  var store = Modular.get<ContactStore>();
  var controller = Modular.get<ContactFormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: Observer(
        builder: (_){
          return ListView.builder(
          itemCount: store.contacts.length,
          itemBuilder: (context, index){
            return GestureDetector(
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: store.contacts[index].image != null ? 
                          FileImage(store.contacts[index].image) : null,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(store.contacts[index].name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(store.contacts[index].email),
                            SizedBox(height: 5),
                            Text(store.contacts[index].number),
                          ],
                        ),
                      ) 
                    ],
                  ),
                ),
              ),
              onTap: (){
                store.setListIndex(index);
                _bootoomSheet(context);
              },
            );
          } 
          );
        }       
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          controller.clearFields();
          Modular.to.pushNamed('/contact_add_form');
        }
      ),
    );
  }
  
  _bootoomSheet(BuildContext context){
    return showBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: 200,
          child: Column(children: <Widget>[
            ListTile(
              title: Text('Editar'),
              onTap: () {
                controller.setFields();
                Modular.to.pushNamed('/contact_edit_form');
              },
             ),
            ListTile(
              title: Text('remover'),
              onTap: () {
                store.remove();
              },
            ),
            ListTile(
              title: Text('Ligar'),
              onTap: () {
                launch("tel:${store.contacts[store.listIndex].number}");
              },
            )
          ]),
        );
      });
  }

}