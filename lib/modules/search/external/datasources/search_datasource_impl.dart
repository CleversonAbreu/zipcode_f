import 'package:dio/dio.dart';
import 'package:zipcodef/modules/search/data/datasources/search_datasource.dart';
import 'package:zipcodef/modules/search/data/models/result_search_model.dart';
import 'package:zipcodef/modules/search/domain/errors/errors.dart';

class SearchDataSourceImpl implements SearchDatasource{
  final Dio dio;

  SearchDataSourceImpl(this.dio);

  @override
  Future<ResultSearchModel> getSearch(String zipcode) async{
    final response = await dio.get('https://viacep.com.br/ws/${zipcode.replaceAll('-', '')}/json/');

    if(response.statusCode==200 && response.data['erro']!='true'){
      return ResultSearchModel.fromMap(response.data);
    }else{
      throw DataSourceError();
    }
  }
}