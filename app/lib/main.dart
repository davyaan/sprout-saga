import 'package:convex_flutter/convex_flutter.dart';
import 'package:flutter/material.dart';

import 'routing/app_router.dart';
import 'theme/app_theme.dart';

/// Convex dev deployment URL, passed at build/run time, e.g.:
///   flutter run --dart-define=CONVEX_URL=https://my-app.convex.cloud
const convexDeploymentUrl = String.fromEnvironment('CONVEX_URL');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (convexDeploymentUrl.isNotEmpty) {
    await ConvexClient.initialize(
      ConvexConfig(
        deploymentUrl: convexDeploymentUrl,
        clientId: 'sprout-saga-app',
        healthCheckQuery: 'health:ping',
      ),
    );
  }

  runApp(const SproutSagaApp());
}

class SproutSagaApp extends StatelessWidget {
  const SproutSagaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sprout Saga',
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
