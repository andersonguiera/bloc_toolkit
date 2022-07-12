import 'package:equatable/equatable.dart';

/// Convenience type for retry callback function
typedef RetryFunc = void Function();

/// A [BaseBlocState] to all blocs states
class BaseBlocState extends Equatable {
  /// Any [Exception] throwed on last event
  final Exception? exception;
  /// A retry function to be called, when an exception occurs
  final RetryFunc? retry;

  /// Constructor for [BaseBlocState]
  /// ``` dart
  /// BaseBlocState(
  ///   exception: Exception('Sorry, but something went wrong!'),
  ///   retry: () => doSomething(args)
  /// )
  /// ```
  const BaseBlocState({this.exception, this.retry});

  /// Convenience get [isException] to sign this state has an exception
  bool get isException => exception != null;
  /// True when this state hasn't an exception
  bool get isNotException => !isException;
  /// Convenience get [isRetry] to sign this state has a callback function.
  bool get isRetry => retry != null;
  /// True when this state hasn't a callback function.
  bool get isNotRetry => !isRetry;

  @override
  List<Object?> get props => [exception, retry];
}