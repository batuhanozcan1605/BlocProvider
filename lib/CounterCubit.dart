import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit():super(0); //başlangıç değeri

  void increaseCounter() {
    int counter = state + 1;
    emit(counter);
  }

  void decreaseCounter(int amount) {
    int counter = state - amount;
    emit(counter);
  }
}