import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task/core/router/app_router.dart';
import 'package:test_task/core/theme/app_theme.dart';

class TestTaskApp extends StatelessWidget {
  const TestTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Test Task',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
