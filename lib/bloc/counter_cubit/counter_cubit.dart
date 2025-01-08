import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterInitial());

  // Increment
  void increment() {

    // final currentCount = (state is CounterUpdated || state is CounterInitial || state is CounterCleared)
    //     ? (state as dynamic).count
    //     : 0;
    //
    // emit(CounterUpdated(currentCount + 1));

    int currentCount = 0;

    // Check current state and retrieve the count accordingly
    if (state is CounterUpdated) {
      currentCount = (state as CounterUpdated).count;
    } else if (state is CounterInitial) {
      currentCount = (state as CounterInitial).count;
    } else if (state is CounterCleared) {
      currentCount = (state as CounterCleared).count;
    }

    emit(CounterUpdated(currentCount + 1));

  }

  // Decrement
  void decrement() {
      int currentCount = 0;

      // Check current state and retrieve the count accordingly
      if (state is CounterUpdated) {
        currentCount = (state as CounterUpdated).count;
      } else if (state is CounterInitial) {
        currentCount = (state as CounterInitial).count;
      } else if (state is CounterCleared) {
        currentCount = (state as CounterCleared).count;
      }

      emit(CounterUpdated(currentCount - 1));

    // final currentCount = (state is CounterUpdated || state is CounterInitial || state is CounterCleared)
    //     ? (state as dynamic).count
    //     : 0;

    // emit(CounterUpdated(currentCount - 1));

  }

  // Clear
  void clear() {
    emit(CounterCleared());
  }


  @override
  void onChange(Change<CounterCubitState> change) {
    super.onChange(change);
    print("CounterCubitState $change");
  }

}
