import 'package:dartz/dartz.dart';

abstract class UseCase<T, Params> {
  /// By default `call()` function call is hide when call Usecase
  /// For example get method call `UseCase()(Params)`
  Future<Either<Exception, T>> call(Params params);
}
