import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:solid_software_test/repository.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  static Color getColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  static Color getContrastColor(Color color) {
    double y = (299 * color.red + 587 * color.green + 114 * color.blue) / 1000;
    return y >= 128 ? Colors.black : Colors.white;
  }

  HomePageBloc()
      : super(HomePageInitial(
            color: Colors.white, textColor: getContrastColor(Colors.white))) {
    on<ChangeColorEvent>((event, emit) {
      Color color = getColor();
      Color textColor = getContrastColor(color);
      print(state.joke);
      emit(HomePageInitial(
          color: color, textColor: textColor, joke: event.joke));
    });

    on<ChangeTextEvent>((event, emit) async {
      emit(JokeLoading(
          color: state.color, textColor: state.textColor, joke: state.joke));
      String joke = await Repository.getJoke();
      emit(HomePageInitial(
          color: state.color, textColor: state.textColor, joke: joke));
    });
  }
}
