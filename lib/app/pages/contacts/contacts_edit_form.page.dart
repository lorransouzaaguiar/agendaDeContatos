import 'package:app_contatos_1/app/pages/contacts/contacts_form.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditContactPage extends StatelessWidget {

  var controller = Modular.get<ContactFormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Contatos"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                key: controller.formKey,
                children: <Widget>[
                  GestureDetector(
                    child: Observer(
                      builder: (_){ 
                        return CircleAvatar(
                          radius: 80,
                          backgroundImage: controller.store.image != null ? FileImage(controller.store.image) : null,
                        );
                      }
                    ),
                    onTap: controller.store.setImage,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      labelText: 'Nome'
                    ),
                    keyboardType: TextInputType.text,
                    controller: controller.nameController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email'
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController, 
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Numero',
                      labelText: 'Numero'
                    ),
                    keyboardType: TextInputType.number,
                    controller: controller.numberController,
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
          controller.editContact();
          Modular.to.pop();
        },
      ),
    );
  }
  
}