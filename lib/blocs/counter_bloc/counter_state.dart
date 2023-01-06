part of 'counter_bloc.dart';
//
// abstract class CounterState extends Equatable {
//   const CounterState();
// }

class CounterState extends Equatable {
  CounterState({required this.count});
    final int count;
  @override
  List<Object> get props => [count];
}
