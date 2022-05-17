abstract class FailureSearch implements Exception{}

class InvalidZipcodeError implements FailureSearch{}
class DataSourceError implements FailureSearch{
  final String message;

  DataSourceError({this.message});

}