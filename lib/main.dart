import 'package:flutter/material.dart';
import 'package:flutter_series_app_bloc/app_router.dart';

void main() {
  runApp(SeriesApp(
    appRouter: AppRouter(),
  ));
}

class SeriesApp extends StatelessWidget {
  final AppRouter appRouter;

  const SeriesApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
