import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });

    @override
    Stream<CounterState> mapEventToState(CounterState event) async* {
      if (state is increment) {
        yield CounterState(count: state.count);
        print("nachuu");
      } else if (state is decrement) {
        yield CounterState(count: state.count);
      }
    }
  }
}
