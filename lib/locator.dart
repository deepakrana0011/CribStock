import 'package:crib_stock/provider/home_page_provider.dart';
import 'package:get_it/get_it.dart';



GetIt locator = GetIt.instance;

void setupLocator() {


  locator.registerFactory(() => HomePageProvider());


}