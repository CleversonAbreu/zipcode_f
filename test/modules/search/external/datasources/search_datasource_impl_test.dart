import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zipcodef/modules/search/domain/errors/errors.dart';
import 'package:zipcodef/modules/search/external/datasources/search_datasource_impl.dart';

import '../../../../utils/search_cep_response.dart';

class DioMock extends Mock implements Dio{}

main(){
  final dio = DioMock();
  final datasource = SearchDataSourceImpl(dio);

  test('Should return ResulSearchModel',()async{
    when(dio.get(any))
        .thenAnswer((_) async=> Response(data: jsonDecode(searchCepResponse),statusCode: 200));
    final future = datasource.getSearch('83601690');
    expect(future, completes);
  });

  test('Should return an error if status is not 200',()async{
    when(dio.get(any))
        .thenAnswer((_) async=> Response(data: null,statusCode: 401));
    final future = datasource.getSearch('83601690');
    expect(future, throwsA(isA<DataSourceError>()));
  });

  test('Should return an error if Dio has error',()async{
    when(dio.get(any)).thenThrow(Exception());
        
    final future = datasource.getSearch('83601690');
    expect(future, throwsA(isA<Exception>()));
  });
}