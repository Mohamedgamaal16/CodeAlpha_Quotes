import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_router.dart';

void main() {
  runApp(const QuotesApp());
}

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
     routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
