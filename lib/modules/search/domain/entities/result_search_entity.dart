import 'package:meta/meta.dart';
class ResultSearchEntity{
  final String zipcode;
  final String address;
  final String state;
  final String city;
  final String district;

  ResultSearchEntity({@required this.zipcode,@required this.address,@required this.state,@required this.city,@required this.district});
}