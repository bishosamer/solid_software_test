part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class ChangeColorEvent extends HomePageEvent {
  final String joke;
  ChangeColorEvent({required this.joke});
}

class ChangeTextEvent extends HomePageEvent {
  ChangeTextEvent();
}
