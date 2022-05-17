import 'dart:convert';
import 'package:zipcodef/modules/search/domain/entities/result_search_entity.dart';
import 'package:meta/meta.dart';

class ResultSearchModel extends ResultSearchEntity{
  final String cep;
  final String logradouro;
  final String uf;
  final String localidade;
  final String bairro;

  ResultSearchModel({@required this.cep,@required this.logradouro,@required this.uf,@required this.localidade,@required this.bairro});

  Map<String,dynamic> toMap(){
    return {
      'zipcode':zipcode,
      'address':logradouro,
      'state':uf,
      'city':localidade,
      'district':bairro
    };
  }

  static ResultSearchModel fromMap(Map<String,dynamic>map){
    if(map==null) return null;
    return ResultSearchModel(
      cep:map['cep'],
      logradouro:map['logradouro'],
      uf: map['uf'],
      localidade: map['localidade'],
      bairro: map['bairro']
    );
  }
  String toJson()=> json.encode(toMap());

  static ResultSearchModel fromJson(String source) =>fromMap(json.decode(source));
}