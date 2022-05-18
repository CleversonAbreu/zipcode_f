import 'package:mobx/mobx.dart';
import 'package:zipcodef/modules/search/data/models/result_search_model.dart';
import 'package:zipcodef/modules/search/domain/usecases/search_by_zipcode.dart';
part 'search_zipcode_controller.g.dart';

class SearchZipCodeController = _SearchZipCodeControllerBase
    with _$SearchZipCodeController;

abstract class _SearchZipCodeControllerBase with Store{
  final SearchByZipcode usecase;
  _SearchZipCodeControllerBase(this.usecase);
  ResultSearchModel resultSearchModel;

  @observable
  String zipcode_text = '';

  @action
  getZipcode(String zipcode) async {
    if(zipcode.isNotEmpty && zipcode!=null){

      zipcode_text = 'carregando...';
      final result = await usecase(zipcode);
      result.fold(
              (l) => zipcode_text='Erro: Verifique o CEP e tente novamente',
              (r) {
                resultSearchModel = result.getOrElse(null);
                zipcode_text = "Endereço :\n" +
                resultSearchModel.address +
                '\n' +
                resultSearchModel.district +
                '\n' +
                resultSearchModel.city +
                '/' +
                resultSearchModel.state ;
              });
    }
  }
}