import 'package:bloc/bloc.dart';
import 'package:bloc_toolkit/base/base_bloc_state.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(const AddState());

  void increment() {
    if (state.value + 1 <= state.max) {
      emit(state.copy(value: state.value + 1));
    } else {
      emit(state.copy(
          exception: Exception('It' 'll exceed maximum value ${state.max}'),
          retry: () => increment()));
    }
  }
}
