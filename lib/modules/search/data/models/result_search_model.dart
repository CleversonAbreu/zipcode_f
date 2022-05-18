import 'dart:convert';
import 'package:zipcodef/modules/search/domain/entities/result_search_entity.dart';
import 'package:meta/meta.dart';

class ResultSearchModel extends ResultSearchEntity{
  final String zipcode;
  final String address;
  final String state;
  final String city;
  final String district;

  ResultSearchModel({@required this.zipcode,@required this.address,@required this.state,@required this.city,@required this.district});

  Map<String,dynamic> toMap(){
    return {
      'cep':zipcode,
      'address':address,
      'state':state,
      'city':city,
      'district':district
    };
  }

  static ResultSearchModel fromMap(Map<String,dynamic>map){
    if(map==null) return null;
    return ResultSearchModel(
        zipcode:map['cep'],
        address:map['logradouro'],
        state: map['uf'],
        city: map['localidade'],
        district: map['bairro']
    );
  }
  String toJson()=> json.encode(toMap());

  static ResultSearchModel fromJson(String source) =>fromMap(json.decode(source));
}