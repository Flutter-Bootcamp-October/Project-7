abstract class ThemeEvent {}

final class ChangeThemeEvent extends ThemeEvent {
  final String themeText;

  ChangeThemeEvent(this.themeText);

}
