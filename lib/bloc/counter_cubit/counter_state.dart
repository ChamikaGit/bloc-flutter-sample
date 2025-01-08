part of 'counter_cubit.dart';

@immutable
sealed class CounterCubitState {}

// Initial State
final class CounterInitial extends CounterCubitState {
  final int count;

  CounterInitial({this.count = 0});
}

// Updated State
final class CounterUpdated extends CounterCubitState {
  final int count;

  CounterUpdated(this.count);
}

// Cleared State
final class CounterCleared extends CounterCubitState {
  final int count;

  CounterCleared({this.count = 0});
}

