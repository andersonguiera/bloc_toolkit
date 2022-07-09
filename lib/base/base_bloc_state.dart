import 'package:equatable/equatable.dart';

typedef RetryFunc = void Function();

class BaseBlocState extends Equatable {
  final Exception? exception;
  final RetryFunc? retry;

  const BaseBlocState({this.exception, this.retry});

  bool get isException => exception != null;
  bool get isNotException => !isException;
  bool get isRetry => retry != null;
  bool get isNotRetry => !isRetry;

  @override
  List<Object?> get props => [exception, retry];
}