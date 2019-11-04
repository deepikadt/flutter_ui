import 'dart:async';

class ThemeBloc 
{
  StreamController<bool> _themeController = StreamController<bool>();
  StreamController<int> _themeColorController=StreamController<int>();

  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;

  get changeThemeColor => _themeColorController.sink.add;
  get colorChanged => _themeColorController.stream;
}