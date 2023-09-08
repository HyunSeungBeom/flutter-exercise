import 'package:flutter_bloc/flutter_bloc.dart';

// 카운터 Cubit 클래스 정의
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
