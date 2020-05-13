import 'package:app_contatos_1/app/controller/contact.page.controller.dart';
import 'package:app_contatos_1/app/pages/home/customModalBottomSheet.home.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var _controllerPage = Modular.get<ContactPageController>();

  @override
  void initState() {
    super.initState();
    _controllerPage.getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: Observer(
        builder: (_){
          return _controllerPage.contacts.isNotEmpty ? ListView.builder(
          itemCount: _controllerPage.contacts.length,
          itemBuilder: (context, index){
            return GestureDetector(
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        backgroundImage: _controllerPage.contacts[index].imagePath != null ? 
                          AssetImage(_controllerPage.contacts[index].imagePath) : null,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(_controllerPage.contacts[index].name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(_controllerPage.contacts[index].email),
                            SizedBox(height: 5),
                            Text(_controllerPage.contacts[index].number),
                          ],
                        ),
                      ) 
                    ],
                  ),
                ),
              ),
              onTap: (){
                _controllerPage.setElementId(_controllerPage.contacts[index].id);
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return CustomModalBottomSheet();
                  });
              },
            );
          } 
          ) : Container();
        }       
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _controllerPage.clearFields();
          Modular.to.pushNamed('/contact_add_form');
        }
      ),
    );
  }
}