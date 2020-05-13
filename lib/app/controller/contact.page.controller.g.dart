// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.page.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactPageController on _ContactPageControllerBase, Store {
  final _$contactsAtom = Atom(name: '_ContactPageControllerBase.contacts');

  @override
  ObservableList<Contact> get contacts {
    _$contactsAtom.context.enforceReadPolicy(_$contactsAtom);
    _$contactsAtom.reportObserved();
    return super.contacts;
  }

  @override
  set contacts(ObservableList<Contact> value) {
    _$contactsAtom.context.conditionallyRunInAction(() {
      super.contacts = value;
      _$contactsAtom.reportChanged();
    }, _$contactsAtom, name: '${_$contactsAtom.name}_set');
  }

  final _$imagePathAtom = Atom(name: '_ContactPageControllerBase.imagePath');

  @override
  String get imagePath {
    _$imagePathAtom.context.enforceReadPolicy(_$imagePathAtom);
    _$imagePathAtom.reportObserved();
    return super.imagePath;
  }

  @override
  set imagePath(String value) {
    _$imagePathAtom.context.conditionallyRunInAction(() {
      super.imagePath = value;
      _$imagePathAtom.reportChanged();
    }, _$imagePathAtom, name: '${_$imagePathAtom.name}_set');
  }

  final _$elementIdAtom = Atom(name: '_ContactPageControllerBase.elementId');

  @override
  int get elementId {
    _$elementIdAtom.context.enforceReadPolicy(_$elementIdAtom);
    _$elementIdAtom.reportObserved();
    return super.elementId;
  }

  @override
  set elementId(int value) {
    _$elementIdAtom.context.conditionallyRunInAction(() {
      super.elementId = value;
      _$elementIdAtom.reportChanged();
    }, _$elementIdAtom, name: '${_$elementIdAtom.name}_set');
  }

  final _$setImageAsyncAction = AsyncAction('setImage');

  @override
  Future setImage() {
    return _$setImageAsyncAction.run(() => super.setImage());
  }

  final _$_ContactPageControllerBaseActionController =
      ActionController(name: '_ContactPageControllerBase');

  @override
  dynamic setElementId(int index) {
    final _$actionInfo =
        _$_ContactPageControllerBaseActionController.startAction();
    try {
      return super.setElementId(index);
    } finally {
      _$_ContactPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getContactImagePath() {
    final _$actionInfo =
        _$_ContactPageControllerBaseActionController.startAction();
    try {
      return super.getContactImagePath();
    } finally {
      _$_ContactPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getAllContacts() {
    final _$actionInfo =
        _$_ContactPageControllerBaseActionController.startAction();
    try {
      return super.getAllContacts();
    } finally {
      _$_ContactPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFields() {
    final _$actionInfo =
        _$_ContactPageControllerBaseActionController.startAction();
    try {
      return super.clearFields();
    } finally {
      _$_ContactPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'contacts: ${contacts.toString()},imagePath: ${imagePath.toString()},elementId: ${elementId.toString()}';
    return '{$string}';
  }
}
