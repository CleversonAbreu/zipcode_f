import 'package:dartz/dartz.dart';
import 'package:zipcodef/modules/search/domain/errors/errors.dart';

import '../entities/result_search_entity.dart';

abstract class SearchRepository{
  Future<Either<FailureSearch,ResultSearchEntity>> search(String zipcode);

}