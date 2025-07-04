import 'package:adaptive_plus/src/widgets/adaptive_plus_provider.dart';
import 'package:adaptive_plus/src/widgets/adaptive_plus_singleton.dart';
import 'package:flutter/widgets.dart';

extension AdaptivePlusContextExtension on BuildContext {
  double sp(num fontSize) =>
      AdaptivePlusProvider.fontSizeScaleOf(this) * fontSize;
  double w(num width) => AdaptivePlusProvider.widthScaleOf(this) * width;
  double h(num height) => AdaptivePlusProvider.heightScaleOf(this) * height;
  double r(num radius) => AdaptivePlusProvider.radiusScaleOf(this) * radius;
  double i(num inset) => AdaptivePlusProvider.insetScaleOf(this) * inset;
}

extension AdaptivePlusWidgetExtension<T extends StatefulWidget> on State<T> {
  double sp(num fontSize) =>
      AdaptivePlusProvider.fontSizeScaleOf(context) * fontSize;
  double w(num width) => AdaptivePlusProvider.widthScaleOf(context) * width;
  double h(num height) => AdaptivePlusProvider.heightScaleOf(context) * height;
  double r(num radius) => AdaptivePlusProvider.radiusScaleOf(context) * radius;
  double i(num inset) => AdaptivePlusProvider.insetScaleOf(context) * inset;
}

extension AdaptivePlusSingletonExtension on num {
  double get sp => AdaptivePlusSingleton.sp(this);
  double get w => AdaptivePlusSingleton.w(this);
  double get h => AdaptivePlusSingleton.h(this);
  double get r => AdaptivePlusSingleton.r(this);
  double get i => AdaptivePlusSingleton.i(this);
}

extension AdaptivePlusSingletonContextExtension on BuildContext {
  void su() {
    AdaptivePlusSingleton.addDependent(this);
  }
}
