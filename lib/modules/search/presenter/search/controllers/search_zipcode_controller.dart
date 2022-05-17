import 'package:mobx/mobx.dart';
import 'package:zipcodef/modules/search/data/models/result_search_model.dart';
import 'package:zipcodef/modules/search/domain/usecases/search_by_zipcode.dart';
part 'search_zipcode_controller.g.dart';

class SearchZipCodeController = _SearchZipCodeControllerBase
    with _$SearchZipCodeController;

abstract class _SearchZipCodeControllerBase with Store{
  final SearchByZipcode usecase;
  _SearchZipCodeControllerBase(this.usecase);

  @observable
  String zipcode_text = '';

  @action
  getZipcode(String zipcode) async {
    final result = await usecase(zipcode);
    final ResultSearchModel resultSearchModel = result.getOrElse(null);
     zipcode_text = "Address :\n" +
         resultSearchModel.logradouro +
         '\n' +
         resultSearchModel.bairro +
         '\n' +
         resultSearchModel.localidade +
         '/' +
         resultSearchModel.uf ;
  }
}