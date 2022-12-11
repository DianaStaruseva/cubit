

part of 'themechanger_cubit.dart';

@immutable
abstract class ThemechangerState {}

class ThemechangerInitial extends ThemechangerState {}


class ThemeChanger extends ThemechangerState{

 final ThemeMode theme;

 ThemeChanger(this.theme);
}