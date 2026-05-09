import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../features/follow-me/logic/cubit/follow_me_cubit.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerFactory(() => RafiqnyCubit());
}
