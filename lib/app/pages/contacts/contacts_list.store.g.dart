// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_list.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactStore on _ContactStoreBase, Store {
  final _$contactsAtom = Atom(name: '_ContactStoreBase.contacts');

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

  final _$imageAtom = Atom(name: '_ContactStoreBase.image');

  @override
  File get image {
    _$imageAtom.context.enforceReadPolicy(_$imageAtom);
    _$imageAtom.reportObserved();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.context.conditionallyRunInAction(() {
      super.image = value;
      _$imageAtom.reportChanged();
    }, _$imageAtom, name: '${_$imageAtom.name}_set');
  }

  final _$listIndexAtom = Atom(name: '_ContactStoreBase.listIndex');

  @override
  int get listIndex {
    _$listIndexAtom.context.enforceReadPolicy(_$listIndexAtom);
    _$listIndexAtom.reportObserved();
    return super.listIndex;
  }

  @override
  set listIndex(int value) {
    _$listIndexAtom.context.conditionallyRunInAction(() {
      super.listIndex = value;
      _$listIndexAtom.reportChanged();
    }, _$listIndexAtom, name: '${_$listIndexAtom.name}_set');
  }

  final _$setImageAsyncAction = AsyncAction('setImage');

  @override
  Future setImage({File savedImage}) {
    return _$setImageAsyncAction
        .run(() => super.setImage(savedImage: savedImage));
  }

  final _$_ContactStoreBaseActionController =
      ActionController(name: '_ContactStoreBase');

  @override
  void setListIndex(int index) {
    final _$actionInfo = _$_ContactStoreBaseActionController.startAction();
    try {
      return super.setListIndex(index);
    } finally {
      _$_ContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImageToNull() {
    final _$actionInfo = _$_ContactStoreBaseActionController.startAction();
    try {
      return super.setImageToNull();
    } finally {
      _$_ContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(Contact contactModel) {
    final _$actionInfo = _$_ContactStoreBaseActionController.startAction();
    try {
      return super.add(contactModel);
    } finally {
      _$_ContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void edit(Contact contact) {
    final _$actionInfo = _$_ContactStoreBaseActionController.startAction();
    try {
      return super.edit(contact);
    } finally {
      _$_ContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove() {
    final _$actionInfo = _$_ContactStoreBaseActionController.startAction();
    try {
      return super.remove();
    } finally {
      _$_ContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'contacts: ${contacts.toString()},image: ${image.toString()},listIndex: ${listIndex.toString()}';
    return '{$string}';
  }
}
