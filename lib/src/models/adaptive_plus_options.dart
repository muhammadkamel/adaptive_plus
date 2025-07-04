import 'package:adaptive_plus/src/types/scale_strategy.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class AdaptivePlusOptions extends Equatable {
  final bool enable;
  final Size designSize;
  final double minTextScale, maxTextScale;
  final double fontFactorByWidth, fontFactorByHeight;
  final bool flipSizeWhenLandscape;
  final AdaptivePlusScaleStrategy fontScaleStrategy,
      paddingScaleStrategy,
      widthScaleStrategy,
      heightScaleStrategy;

  const AdaptivePlusOptions({
    this.enable = true,
    required this.designSize,
    double? fontFactorByWidth,
    double? fontFactorByHeight,
    double? minTextScale,
    double? maxTextScale,
    bool? flipSizeWhenLandscape,
    AdaptivePlusScaleStrategy? fontScaleStrategy,
    AdaptivePlusScaleStrategy? paddingScaleStrategy,
    AdaptivePlusScaleStrategy? widthScaleStrategy,
    AdaptivePlusScaleStrategy? heightScaleStrategy,
  }) : fontFactorByWidth = fontFactorByWidth ?? 1.0,
       fontFactorByHeight = fontFactorByHeight ?? 1.0,
       minTextScale = minTextScale ?? 0.2,
       maxTextScale = maxTextScale ?? 4.0,
       flipSizeWhenLandscape = flipSizeWhenLandscape ?? false,
       fontScaleStrategy = fontScaleStrategy ?? AdaptivePlusScaleStrategy.width,
       paddingScaleStrategy =
           paddingScaleStrategy ?? AdaptivePlusScaleStrategy.width,
       widthScaleStrategy =
           widthScaleStrategy ?? AdaptivePlusScaleStrategy.width,
       heightScaleStrategy =
           heightScaleStrategy ?? AdaptivePlusScaleStrategy.height;

  @override
  List<Object?> get props => [
    enable,
    designSize,
    fontFactorByWidth,
    fontFactorByHeight,
    minTextScale,
    maxTextScale,
    flipSizeWhenLandscape,
    fontScaleStrategy,
    paddingScaleStrategy,
    widthScaleStrategy,
    heightScaleStrategy,
  ];
}
