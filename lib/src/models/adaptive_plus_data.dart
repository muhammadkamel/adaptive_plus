import 'dart:math' show min;

import 'package:adaptive_plus/src/models/adaptive_plus_options.dart';
import 'package:adaptive_plus/src/models/adaptive_plus_view.dart';
import 'package:adaptive_plus/src/utils/adaptive_plus_scaler.dart';
import 'package:adaptive_plus/src/utils/default_adaptive_plus_scaler.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class AdaptivePlusData extends Equatable {
  final double fontSizeScale;
  final double widthScale;
  final double heightScale;
  final double insetScale;
  final double radiusScale;

  const AdaptivePlusData({
    double? fontSizeScale,
    double? widthScale,
    double? heightScale,
    double? paddingScale,
    double? radiusScale,
  }) : fontSizeScale = fontSizeScale == null || fontSizeScale <= 0
           ? 1
           : fontSizeScale,
       widthScale = widthScale == null || widthScale <= 0 ? 1 : widthScale,
       heightScale = heightScale == null || heightScale <= 0 ? 1 : heightScale,
       insetScale = paddingScale == null || paddingScale <= 0
           ? 1
           : paddingScale,
       radiusScale = radiusScale == null || radiusScale <= 0 ? 1 : radiusScale;

  factory AdaptivePlusData.from({
    required Size screenSize,
    Orientation orientation = Orientation.portrait,
    required AdaptivePlusOptions options,
    AdaptivePlusScaler scaler = const DefaultAdaptivePlusScaler(),
  }) {
    final view = AdaptivePlusView(
      width: screenSize.width,
      height: screenSize.height,
      orientation: orientation,
    );

    final fontSizeScale = scaler.getFontScaleFactor(view, options);
    final widthScale = scaler.getWidthScaleFactor(view, options);
    final heightScale = scaler.getHeightScaleFactor(view, options);
    final paddingScale = scaler.getPaddingScaleFactor(view, options);
    final radiusScale = min(widthScale, heightScale);

    return AdaptivePlusData(
      fontSizeScale: fontSizeScale,
      widthScale: widthScale,
      heightScale: heightScale,
      radiusScale: radiusScale,
      paddingScale: paddingScale,
    );
  }

  factory AdaptivePlusData.fromContext({
    required BuildContext context,
    required AdaptivePlusOptions options,
    AdaptivePlusScaler scaler = const DefaultAdaptivePlusScaler(),
  }) {
    return AdaptivePlusData.from(
      options: options,
      screenSize: MediaQuery.sizeOf(context),
      orientation: MediaQuery.orientationOf(context),
      scaler: scaler,
    );
  }

  @override
  int get hashCode => Object.hash(
    fontSizeScale,
    widthScale,
    heightScale,
    insetScale,
    radiusScale,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdaptivePlusData &&
        other.fontSizeScale == fontSizeScale &&
        other.widthScale == widthScale &&
        other.heightScale == heightScale &&
        other.insetScale == insetScale &&
        other.radiusScale == radiusScale;
  }

  @override
  String toString() {
    return """AdaptivePlusData(
      fontSizeScale: $fontSizeScale,
      widthScale: $widthScale,
      heightScale: $heightScale,
      insetScale: $insetScale,
      radiusScale: $radiusScale,
    )""";
  }

  double sp(num size) {
    return size * fontSizeScale;
  }

  double w(num width) {
    return width * widthScale;
  }

  double h(num height) {
    return height * heightScale;
  }

  double r(num radius) {
    return radius * radiusScale;
  }

  double i(num padding) {
    return padding * insetScale;
  }

  @override
  List<Object?> get props => [
    fontSizeScale,
    widthScale,
    heightScale,
    insetScale,
    radiusScale,
  ];
}
