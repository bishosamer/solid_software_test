part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {
  final Color color;
  final Color textColor;
  final String joke;
  const HomePageState(
      {required this.joke, required this.color, required this.textColor});
}

class HomePageInitial extends HomePageState {
  const HomePageInitial(
      {required super.color, required super.textColor, super.joke = ''});
}

class JokeLoading extends HomePageState {
  const JokeLoading(
      {required super.color, required super.textColor, super.joke = ''});
}

class JokeLoaded extends HomePageState {
  const JokeLoaded(
      {required super.color, required super.textColor, required super.joke});
}
