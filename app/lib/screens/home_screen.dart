import 'dart:async';

import 'package:convex_flutter/convex_flutter.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<WebSocketConnectionState>? _connectionSub;
  WebSocketConnectionState? _connectionState;
  String? _pingResult;
  Object? _pingError;

  @override
  void initState() {
    super.initState();
    if (convexDeploymentUrl.isNotEmpty) {
      _connectionState = ConvexClient.instance.currentConnectionState;
      _connectionSub =
          ConvexClient.instance.connectionState.listen(_onConnectionState);
      if (_connectionState == WebSocketConnectionState.connected) {
        _runPing();
      }
    }
  }

  void _onConnectionState(WebSocketConnectionState state) {
    setState(() => _connectionState = state);
    if (state == WebSocketConnectionState.connected && _pingResult == null) {
      _runPing();
    }
  }

  Future<void> _runPing() async {
    try {
      final result = await ConvexClient.instance.query('health:ping', const {});
      if (mounted) setState(() => _pingResult = result);
    } catch (error) {
      if (mounted) setState(() => _pingError = error);
    }
  }

  @override
  void dispose() {
    _connectionSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sprout Saga')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Skeleton build — no features yet.'),
            const SizedBox(height: 16),
            _buildConvexStatus(),
          ],
        ),
      ),
    );
  }

  Widget _buildConvexStatus() {
    if (convexDeploymentUrl.isEmpty) {
      return const Text('Convex: no CONVEX_URL configured');
    }
    if (_pingError != null) {
      return Text('Convex: error — $_pingError');
    }
    if (_pingResult != null) {
      return Text('Convex: connected ($_pingResult)');
    }
    return Text('Convex: ${_connectionState?.name ?? 'connecting'}...');
  }
}
