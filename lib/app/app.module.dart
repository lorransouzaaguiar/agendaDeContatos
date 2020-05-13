
import 'package:app_contatos_1/app/app.widget.dart';
import 'package:app_contatos_1/app/controller/contact.page.controller.dart';
import 'package:app_contatos_1/app/pages/contacts/contacts_add_form.page.dart';
import 'package:app_contatos_1/app/pages/contacts/contacts_edit_form.page.dart';
import 'package:app_contatos_1/app/pages/home/home.page.dart';
import 'package:app_contatos_1/app/repository/sqflite.repository.dart';
import 'package:app_contatos_1/app/repository/sqflite_interface.repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule{
  @override
  List<Bind> get binds => [
    Bind((i) => ContactPageController(i.get())),
    Bind<IRepository>((i) => Repository())
  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => HomePage()),
    Router('/contact_add_form', child: (_, args) => AddContactForm()),
    Router('/contact_edit_form', child: (_, args) => EditContactPage()),
  ];


}