import 'package:get_it/get_it.dart';

import '../../data/network/user_repository.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerLazySingleton<FirebaseRepository>(() => FirebaseRepository());
}
