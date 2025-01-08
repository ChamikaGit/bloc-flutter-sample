part of 'counter_bloc.dart';

/** Need to to export this file to the bloc file('counter_bloc.dart')
 * that's why we used part of and it's file name **/

// @immutable
// sealed
class CounterState {
  final int count;

  CounterState({this.count = 0});

  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }
}


// class CounterState {
//   int count;
//
//   CounterState({this.count = 0});
// }

// final class CounterInitial extends CounterState {}
