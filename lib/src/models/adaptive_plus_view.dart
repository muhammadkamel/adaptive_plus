import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class AdaptivePlusView extends Equatable {
  final double width;
  final double height;
  final Orientation orientation;

  const AdaptivePlusView({
    required this.width,
    required this.height,
    required this.orientation,
  });

  @override
  String toString() {
    return 'AdaptivePlusView(width: $width, height: $height, orientation: $orientation)';
  }

  @override
  List<Object?> get props => [width, height, orientation];
}
