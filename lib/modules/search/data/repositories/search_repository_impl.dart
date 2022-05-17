import 'package:dartz/dartz.dart';
import 'package:zipcodef/modules/search/data/datasources/search_datasource.dart';
import 'package:zipcodef/modules/search/domain/entities/result_search_entity.dart';
import 'package:zipcodef/modules/search/domain/errors/errors.dart';
import 'package:zipcodef/modules/search/domain/repositories/search_repository.dart';

class SearchRepositorImp implements SearchRepository{
  final SearchDatasource datasource;
  SearchRepositorImp(this.datasource);

  @override
  Future<Either<FailureSearch, ResultSearchEntity>> search(String zipcode) async{
      try{
        final result = await datasource.getSearch(zipcode);
        return Right(result);
      } on DataSourceError catch (e){
        return Left(e);
      } catch (e){
        return Left(DataSourceError());
      }
  }
}