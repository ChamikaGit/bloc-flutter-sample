part of 'counter_bloc.dart';

/** Need to to export this file to the bloc file('counter_bloc.dart')
 * that's why we used part of and it's file name **/

abstract class CounterEvent {}

class CounterIncrement extends CounterEvent {}

class CounterDecrement extends CounterEvent {}

class CounterClear extends CounterEvent {}

