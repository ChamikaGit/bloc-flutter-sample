import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<CounterIncrement>((event, emit) {
      emit(state.copyWith(count: state.count +1));
    });

    on<CounterDecrement>((event, emit) {
      emit(state.copyWith(count: state.count-1));
    });

    on<CounterClear>((event, emit) {
      emit(state.copyWith(count: 0));
    });
  }
}
