import 'package:dartz/dartz.dart';
import 'package:zipcodef/modules/search/domain/errors/errors.dart';
import 'package:zipcodef/modules/search/domain/repositories/search_repository.dart';
import '../entities/result_search_entity.dart';

abstract class SearchByZipcode{
  Future<Either<FailureSearch,ResultSearchEntity>> call(String zipcode);
}

class SearchByZipcodeImp implements SearchByZipcode{
  final SearchRepository repository;

  SearchByZipcodeImp(this.repository);
  @override
  Future<Either<FailureSearch, ResultSearchEntity>> call(String zipcode) async {
    if(zipcode == null || zipcode.isEmpty){
      return Left(InvalidZipcodeError());
    }
    return repository.search(zipcode);
  }
}