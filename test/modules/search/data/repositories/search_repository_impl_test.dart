import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zipcodef/modules/search/data/datasources/search_datasource.dart';
import 'package:zipcodef/modules/search/data/models/result_search_model.dart';
import 'package:zipcodef/modules/search/data/repositories/search_repository_impl.dart';
import 'package:zipcodef/modules/search/domain/errors/errors.dart';

class SearchDataSourceMock extends Mock implements SearchDatasource{}

void main(){
  final datasource        = SearchDataSourceMock();
  final repository        = SearchRepositorImp(datasource);
  final resultSearchModel = ResultSearchModel(cep: 'null', localidade: 'null', uf: 'null', logradouro: 'null', bairro: 'null');

  test('Should returns ResultSearchModel',() async{
      when(datasource.getSearch(any))
          .thenAnswer((realInvocation) async=> resultSearchModel);
      final result = await repository.search('83601360');
      expect(result.getOrElse(() => null) ,isA<ResultSearchModel>());
  });

  test('Should returns a DataSource error if datasource fails',() async{
    when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search('83601360');
    expect(result.fold((l) => l, (r) => r),isA<DataSourceError>());
  });
}