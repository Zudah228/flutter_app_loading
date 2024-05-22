import 'dart:async';

import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  static Future<void> show(Future<void> Function() cb) async {
    if (_state == null) {
      throw FlutterError(
        'LoadingIndicator.show() was called \n'
        'No State of LoadingIndicator widget has created.',
      );
    }

    await _state!._show(cb);
  }

  static late _LoadingIndicatorState? _state;

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  final _isLoadingNotifier = ValueNotifier(false);

  Future<void> _show(Future<void> Function() cb) async {
    _isLoadingNotifier.value = true;

    await cb();

    _isLoadingNotifier.value = false;
  }

  @override
  void didChangeDependencies() {
    LoadingIndicator._state = this;
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    LoadingIndicator._state = null;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isLoadingNotifier,
      builder: (context, value, child) {
        return Visibility(
          visible: value,
          child: child!,
        );
      },
      child: const SizedBox.expand(
        child: ColoredBox(
          color: Colors.black45,
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
