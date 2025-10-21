import 'package:get_it/get_it.dart';
import 'package:parle_app/app/core/client/app_client.dart';
import 'package:parle_app/data/remote/auth/auth_service.dart';
import 'package:parle_app/data/remote/auth/auth_service_impl.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  sl.registerSingleton<AppClient>(AppClient());
  sl.registerLazySingleton<AuthService>(() => AuthServiceImpl(sl.get()));
}
