import 'package:flutter/foundation.dart';

class SliderProvider with ChangeNotifier{
  double _values = 1.0;

  double get values =>  _values;

  void setValue(double val){
    _values = val;
    notifyListeners();
  }

}