part of 'click_cubit.dart';

@immutable
abstract class ClickState {
  final int count;

  ClickState(this.count);
}

class ClickIniltial extends ClickState {
  ClickIniltial(super.count);
}

class onClick extends ClickState{
  onClick(super.count);
}

class ClickError extends ClickState
{
final String message;

ClickError(this.message) : super(0);
}