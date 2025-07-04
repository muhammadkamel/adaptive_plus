import 'package:adaptive_plus/src/models/adaptive_plus_options.dart';
import 'package:adaptive_plus/src/models/adaptive_plus_view.dart';
import 'package:adaptive_plus/src/types/scale_strategy.dart';
import 'package:adaptive_plus/src/utils/adaptive_plus_scaler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class DefaultAdaptivePlusScaler implements AdaptivePlusScaler {
  const DefaultAdaptivePlusScaler();

  Size getScreenSize(AdaptivePlusView view, bool flipSizeWhenLandscape) {
    if (flipSizeWhenLandscape &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
        ].contains(defaultTargetPlatform) &&
        view.orientation == Orientation.landscape) {
      return Size(view.height, view.width);
    }
    return Size(view.width, view.height);
  }

  @override
  double getFontScaleFactor(
    AdaptivePlusView view,
    AdaptivePlusOptions options,
  ) {
    final screenSize = getScreenSize(view, options.flipSizeWhenLandscape);

    final widthFactor = screenSize.width / options.designSize.width;
    final heightFactor = screenSize.height / options.designSize.height;

    if (options.fontScaleStrategy == AdaptivePlusScaleStrategy.both) {
      return (widthFactor * options.fontFactorByWidth +
              heightFactor * options.fontFactorByHeight) /
          (options.fontFactorByWidth + options.fontFactorByHeight);
    }
    if (options.fontScaleStrategy == AdaptivePlusScaleStrategy.width) {
      return widthFactor;
    }
    if (options.fontScaleStrategy == AdaptivePlusScaleStrategy.height) {
      return heightFactor;
    }

    return 1.0;
  }

  @override
  double getWidthScaleFactor(
    AdaptivePlusView view,
    AdaptivePlusOptions options,
  ) {
    final screenSize = getScreenSize(view, options.flipSizeWhenLandscape);
    return screenSize.width / options.designSize.width;
  }

  @override
  double getHeightScaleFactor(
    AdaptivePlusView view,
    AdaptivePlusOptions options,
  ) {
    final screenSize = getScreenSize(view, options.flipSizeWhenLandscape);
    return screenSize.height / options.designSize.height;
  }

  @override
  double getPaddingScaleFactor(
    AdaptivePlusView view,
    AdaptivePlusOptions options,
  ) {
    final screenSize = getScreenSize(view, options.flipSizeWhenLandscape);

    final widthFactor = screenSize.width / options.designSize.width;
    final heightFactor = screenSize.height / options.designSize.height;

    return (widthFactor + heightFactor) / 2;
  }
}
