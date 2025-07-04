import 'package:adaptive_plus/adaptive_plus.dart';
import 'package:flutter/widgets.dart';

class AdaptivePlusSingleton extends StatelessWidget {
  const AdaptivePlusSingleton({
    super.key,
    this.scaler = const DefaultAdaptivePlusScaler(),
    required this.options,
    required this.child,
  });

  final AdaptivePlusScaler scaler;
  final AdaptivePlusOptions options;
  final Widget child;

  static void addDependent(BuildContext context) {
    AdaptivePlusProvider.of(context);
  }

  static double sp(num fontSize) {
    final currentState = AdaptivePlusKeyProvider.key.currentState;
    if (currentState == null) {
      throw FlutterError(
        'AdaptivePlusSingleton is not initialized. Please wrap your app with AdaptivePlusSingleton.',
      );
    }
    return currentState.data.sp(fontSize);
  }

  static double w(num width) {
    final currentState = AdaptivePlusKeyProvider.key.currentState;
    if (currentState == null) {
      throw FlutterError(
        'AdaptivePlusSingleton is not initialized. Please wrap your app with AdaptivePlusSingleton.',
      );
    }
    return currentState.data.w(width);
  }

  static double h(num height) {
    final currentState = AdaptivePlusKeyProvider.key.currentState;
    if (currentState == null) {
      throw FlutterError(
        'AdaptivePlusSingleton is not initialized. Please wrap your app with AdaptivePlusSingleton.',
      );
    }
    return currentState.data.h(height);
  }

  static double r(num radius) {
    final currentState = AdaptivePlusKeyProvider.key.currentState;
    if (currentState == null) {
      throw FlutterError(
        'AdaptivePlusSingleton is not initialized. Please wrap your app with AdaptivePlusSingleton.',
      );
    }
    return currentState.data.r(radius);
  }

  static double i(num inset) {
    final currentState = AdaptivePlusKeyProvider.key.currentState;
    if (currentState == null) {
      throw FlutterError(
        'AdaptivePlusSingleton is not initialized. Please wrap your app with AdaptivePlusSingleton.',
      );
    }
    return currentState.data.i(inset);
  }

  @override
  Widget build(BuildContext context) {
    return _AdaptivePlusSingleton(
      key: AdaptivePlusKeyProvider.key,
      scaler: scaler,
      options: options,
      child: child,
    );
  }
}

class _AdaptivePlusSingleton extends StatefulWidget {
  const _AdaptivePlusSingleton({
    super.key,
    required this.scaler,
    required this.options,
    required this.child,
  });

  final AdaptivePlusScaler scaler;
  final AdaptivePlusOptions options;
  final Widget child;

  @override
  State<_AdaptivePlusSingleton> createState() => AdaptivePlusSingletonState();
}

class AdaptivePlusSingletonState extends State<_AdaptivePlusSingleton> {
  AdaptivePlusData _data = const EmptyAdaptivePlusData();
  AdaptivePlusData get data => _data;

  AdaptivePlusData _calculateData() {
    if (!widget.options.enable) {
      return const EmptyAdaptivePlusData();
    }

    return AdaptivePlusData.fromContext(
      context: context,
      options: widget.options,
      scaler: widget.scaler,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final data = _calculateData();
    if (_data != data) setState(() => _data = data);
  }

  @override
  Widget build(BuildContext context) {
    return AdaptivePlusProvider(data: _data, child: widget.child);
  }
}
