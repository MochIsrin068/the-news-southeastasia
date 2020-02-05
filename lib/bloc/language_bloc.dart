import 'package:flutter/foundation.dart';

class LanguageBloc extends ChangeNotifier {
  String _currentApi =
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=acdf5e7002c94b1ea4f61f1a80c1a50c";
  String _currentLang = "id";

  String get languageValue => _currentLang;
  String get api => _currentApi;

  set languageValue(String newValue) {
    _currentLang = newValue;
    newValue == "id"
        ? _currentApi =
            "https://newsapi.org/v2/top-headlines?country=id&apiKey=acdf5e7002c94b1ea4f61f1a80c1a50c"
        : newValue == "my"
            ? _currentApi =
                "https://newsapi.org/v2/top-headlines?country=my&apiKey=acdf5e7002c94b1ea4f61f1a80c1a50c"
            : newValue == "ph"
                ? _currentApi =
                    "https://newsapi.org/v2/top-headlines?country=ph&apiKey=acdf5e7002c94b1ea4f61f1a80c1a50c"
                : newValue == "th"
                    ? _currentApi =
                        "https://newsapi.org/v2/top-headlines?country=th&apiKey=acdf5e7002c94b1ea4f61f1a80c1a50c"
                    : _currentApi =
                        "https://newsapi.org/v2/top-headlines?country=sg&apiKey=acdf5e7002c94b1ea4f61f1a80c1a50c";

    notifyListeners();
  }
}
