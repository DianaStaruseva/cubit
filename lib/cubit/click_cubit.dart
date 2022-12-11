import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'click_state.dart';

class ClickCubit extends Cubit<ClickState> {
  ClickCubit() : super(ClickIniltial(0));
  int count = 0;
  var result = <ClickCubitModel>[];
  void Click(bool darkmode) {
    if (count >= 100) {
      emit(ClickError('Счёткик равен 100. Конец.'));
    } else {
      if (darkmode == true) {
        count += 2;
        result.add(ClickCubitModel(count, ' Темная тема'));

      } else {
        count++;
        result.add(ClickCubitModel(count, ' Светлая тема'));
      }
      emit(onClick(count));
    }
  }

  void ClickMinus(bool darkmode) {
    if (count <= 1) {
      emit(ClickError('Счётчик не можетбыть равен 0'));
    } else {
      if (darkmode == true) {
        count -= 2;
        result.add(ClickCubitModel(count, ' Темная тема'));
      } else {
        count--;
        result.add(ClickCubitModel(count, ' Светлая тема'));
      }
      emit(onClick(count));
    }
  }
}

class ClickCubitModel {
  final int count;
  final String message;

  ClickCubitModel(this.count, this.message);
}