import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zipcodef/app_module.dart';
import 'package:zipcodef/modules/search/domain/entities/result_search_entity.dart';
import 'package:zipcodef/modules/search/domain/usecases/search_by_zipcode.dart';

import 'utils/search_cep_response.dart';


class DioMock extends Mock implements Dio{}

main(){
  final dio = DioMock();
  initModule(AppModule(),changeBinds: [
    Bind<Dio>((i)=>dio),
  ]);

  test('Should recover usecase without error',(){
    final usecase = Modular.get<SearchByZipcode>();
    expect(usecase,isA<SearchByZipcodeImp>());
  });

  test('Should bring ResultSearchEntity ',()async{
    when(dio.get(any)).thenAnswer((_) async =>Response(data: jsonDecode(searchCepResponse),statusCode: 200));
    final usecase = Modular.get<SearchByZipcode>();
    final result = await usecase('83601970');
    expect(result.getOrElse(() => null),isA<ResultSearchEntity>());
  });

}