import 'package:flutter/material.dart';
import 'package:flutter_app_loading/components/loading_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _onPressed() async {
    _send();
  }

  Future<void> _send() async {
    try {
      await LoadingIndicator.show(() async {
        await Future.delayed(const Duration(seconds: 3));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: FilledButton(onPressed: _onPressed, child: const Text('Send')),
      ),
    );
  }
}
