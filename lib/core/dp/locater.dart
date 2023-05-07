import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../../network/network_manager.dart';


final locator = GetIt.instance;

void setupLocators() {
  locator.registerLazySingleton<NetworkManager>(() => NetworkManager(dotenv.env['baseUrl']!));
}
