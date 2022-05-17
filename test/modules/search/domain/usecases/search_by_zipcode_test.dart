import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zipcodef/modules/search/domain/entities/result_search_entity.dart';
import 'package:zipcodef/modules/search/domain/errors/errors.dart';
import 'package:zipcodef/modules/search/domain/repositories/search_repository.dart';
import 'package:zipcodef/modules/search/domain/usecases/search_by_zipcode.dart';


class SearchRepositoryMock extends Mock implements SearchRepository{}

main(){
  final repository   = SearchRepositoryMock();
  final usecase      = SearchByZipcodeImp(repository);
  final resultSearch = ResultSearchEntity(zipcode: 'null', address: 'null', state: 'null', city: 'null', district: 'null');

  test('Should returns ResultSearch',()async{
    when(repository.search(any)).thenAnswer((_) async => Right(resultSearch));

    final result = await usecase('83601890');
    expect(result, isA<Right>());
    expect(result.getOrElse(() => null), isA<ResultSearchEntity>());
  });

  test('Should returns an exception when zipcode is invalid',()async{
    when(repository.search(any)).thenAnswer((_) async => Right(resultSearch));

    final result = await usecase(null);

    expect(result.isLeft(),true);
    expect(result.fold((l) => l, (r) => r),isA<InvalidZipcodeError>());
  });

  test('Should returns an exception when zipcode is invalid',()async{
    when(repository.search(any)).thenAnswer((_) async => Right(resultSearch));

    final result = await usecase('');

    expect(result.isLeft(),true);
    expect(result.fold((l) => l, (r) => r),isA<InvalidZipcodeError>());
  });



}