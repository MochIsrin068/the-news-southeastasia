import 'package:flutter/foundation.dart';

class ModeBloc extends ChangeNotifier{

  bool _isDark = false;

  bool get isDark => _isDark;

  set isDark(bool newValue){
    _isDark = newValue;
    notifyListeners();
  }

}