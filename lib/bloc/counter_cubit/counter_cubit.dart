import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterInitial());

  // Increment
  void increment() {
    if (state is CounterUpdated) {
      emit(CounterUpdated((state as CounterUpdated).count + 1));
    } else if (state is CounterInitial) {
      emit(CounterUpdated((state as CounterInitial).count + 1));
    }
  }

  // Decrement
  void decrement() {
    if (state is CounterUpdated) {
      emit(CounterUpdated((state as CounterUpdated).count - 1));
    } else if (state is CounterInitial) {
      emit(CounterUpdated((state as CounterInitial).count - 1));
    }
  }

  // Clear
  void clear() {
    emit(CounterCleared());
  }
}
