import 'package:zipcodef/modules/search/data/models/result_search_model.dart';

abstract class SearchDatasource{
  Future<ResultSearchModel> getSearch(String zipcode);
}