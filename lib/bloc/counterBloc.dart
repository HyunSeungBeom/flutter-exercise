import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event == CounterEvent.increment) {
      yield state + 1;
    } else if (event == CounterEvent.decrement) {
      yield state - 1;
    }
  }
}
