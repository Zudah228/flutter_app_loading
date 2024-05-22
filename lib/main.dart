import 'package:flutter/material.dart';

import 'components/loading_indicator.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Stack(
          children: [
            Positioned.fill(child: child!),
            const Positioned.fill(child: LoadingIndicator()),
          ],
        );
      },
      home: const HomePage(),
    );
  }
}
