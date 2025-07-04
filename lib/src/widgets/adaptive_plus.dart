import 'package:adaptive_plus/src/models/adaptive_plus_data.dart';
import 'package:adaptive_plus/src/models/adaptive_plus_options.dart';
import 'package:adaptive_plus/src/models/empty_adaptive_plus_data.dart';
import 'package:adaptive_plus/src/utils/adaptive_plus_scaler.dart';
import 'package:adaptive_plus/src/utils/default_adaptive_plus_scaler.dart';
import 'package:adaptive_plus/src/widgets/adaptive_plus_provider.dart';
import 'package:flutter/widgets.dart';

class AdaptivePlus extends StatefulWidget {
  const AdaptivePlus({
    super.key,
    this.scaler = const DefaultAdaptivePlusScaler(),
    required this.options,
    required this.child,
  });

  final AdaptivePlusScaler scaler;
  final AdaptivePlusOptions options;
  final Widget child;

  static double sp(BuildContext context, num fontSize) {
    return AdaptivePlusProvider.fontSizeScaleOf(context) * fontSize;
  }

  static double w(BuildContext context, num width) {
    return AdaptivePlusProvider.widthScaleOf(context) * width;
  }

  static double h(BuildContext context, num height) {
    return AdaptivePlusProvider.heightScaleOf(context) * height;
  }

  static double r(BuildContext context, num radius) {
    return AdaptivePlusProvider.radiusScaleOf(context) * radius;
  }

  static double i(BuildContext context, num inset) {
    return AdaptivePlusProvider.insetScaleOf(context) * inset;
  }

  @override
  State<AdaptivePlus> createState() => _AdaptivePlusState();
}

class _AdaptivePlusState extends State<AdaptivePlus> {
  @override
  Widget build(BuildContext context) {
    if (!widget.options.enable) {
      return AdaptivePlusProvider(
        data: const EmptyAdaptivePlusData(),
        child: widget.child,
      );
    }

    final data = AdaptivePlusData.fromContext(
      context: context,
      options: widget.options,
      scaler: widget.scaler,
    );

    return AdaptivePlusProvider(data: data, child: widget.child);
  }
}
