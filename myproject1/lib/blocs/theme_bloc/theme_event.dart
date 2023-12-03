sealed class ThemeBlocEvent {}

class ChangThemEvent extends ThemeBlocEvent {
  final String themeText;

  ChangThemEvent(this.themeText);
}
