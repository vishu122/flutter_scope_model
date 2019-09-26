import 'package:get_it/get_it.dart';
import 'counter_model.dart';

class ServiceLocator{


  GetIt locator = GetIt.instance;

  void setupLocator(){
    locator.registerFactory<CounterModel>(() => CounterModel());

  }

}