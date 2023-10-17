
import 'package:flutter/cupertino.dart';

class ProviderService with ChangeNotifier{

  bool _loading = false;

  get loading => _loading;

  setLoading(bool val){
    _loading = val;
    notifyListeners();
  }
}