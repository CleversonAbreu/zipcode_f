// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_zipcode_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchZipCodeController on _SearchZipCodeControllerBase, Store {
  final _$zipcode_textAtom =
      Atom(name: '_SearchZipCodeControllerBase.zipcode_text');

  @override
  String get zipcode_text {
    _$zipcode_textAtom.reportRead();
    return super.zipcode_text;
  }

  @override
  set zipcode_text(String value) {
    _$zipcode_textAtom.reportWrite(value, super.zipcode_text, () {
      super.zipcode_text = value;
    });
  }

  final _$getZipcodeAsyncAction =
      AsyncAction('_SearchZipCodeControllerBase.getZipcode');

  @override
  Future getZipcode(String zipcode) {
    return _$getZipcodeAsyncAction.run(() => super.getZipcode(zipcode));
  }

  @override
  String toString() {
    return '''
zipcode_text: ${zipcode_text}
    ''';
  }
}
