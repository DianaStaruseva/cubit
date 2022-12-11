part of 'listedit_cubit.dart';

@immutable
abstract class ListeditState {}
class ListeditInitial extends ListeditState {}
class ListChanger extends ListeditState{

   var tile;

  ListChanger(this.tile);
}