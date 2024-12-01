
import 'package:get_it/get_it.dart';
import 'package:tracklab/src/resources/home/home_repository.dart';

final locator = GetIt.I; 
void setUpLocator() {
  locator.registerLazySingleton(() => HomeRepository());
}