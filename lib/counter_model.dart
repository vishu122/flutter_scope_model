

import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model{

  int counter=0;


  void incrementCounter(){
    counter++;
    notifyListeners();
  }

  void decrementCounter(){
    counter--;
    notifyListeners();
  }
}