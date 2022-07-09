part of 'add_cubit.dart';

class AddState extends BaseBlocState {
  final int value;
  final int max;
  const AddState({this.value = 0, this.max = 10, super.retry, super.exception});

  AddState copy({int? value, int? max, RetryFunc? retry, Exception? exception}) {
    return AddState(
      value: value ?? this.value,
      max: max ?? this.max,
      retry: retry,
      exception: exception,
    );
  }

  @override
  List<Object?> get props => [value, max, ...super.props];
}