import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:zipcodef/app_widget.dart';
import 'package:zipcodef/modules/search/data/repositories/search_repository_impl.dart';
import 'package:zipcodef/modules/search/domain/usecases/search_by_zipcode.dart';
import 'package:zipcodef/modules/search/external/datasources/search_datasource_impl.dart';
import 'package:zipcodef/modules/search/presenter/search/search_page.dart';
import 'package:zipcodef/modules/search/presenter/search/controllers/search_zipcode_controller.dart';

class AppModule extends MainModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => [
    Bind((i)=>Dio()),
    Bind((i)=>SearchByZipcodeImp(i())),
    Bind((i)=>SearchRepositorImp(i())),
    Bind((i)=>SearchDataSourceImpl(i())),
    Bind((i)=>SearchZipCodeController(i())),
  ];

  @override
  // TODO: implement routers
  List<Router> get routers => [
    Router('/',child: (_,__)=>SearchPage()),
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

}

