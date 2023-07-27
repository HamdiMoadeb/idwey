import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';

Future<void> setup() async {
  // Initialize AppRouter
  final AppRouter appRouter = AppRouter();
  GetIt.I.registerSingleton<AppRouter>(appRouter);
}
