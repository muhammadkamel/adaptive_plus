import 'package:adaptive_plus/src/models/adaptive_plus_data.dart';
import 'package:flutter/widgets.dart';

enum AdaptivePlusProviderAspect { font, width, height, radius, inset }

class AdaptivePlusProvider extends InheritedModel<AdaptivePlusProviderAspect> {
  const AdaptivePlusProvider({
    super.key,
    required this.data,
    required super.child,
  });

  final AdaptivePlusData data;

  @override
  bool updateShouldNotify(covariant AdaptivePlusProvider oldWidget) {
    return data != oldWidget.data;
  }

  static AdaptivePlusData? _maybeOf(
    BuildContext context, [
    AdaptivePlusProviderAspect? aspect,
  ]) {
    return InheritedModel.inheritFrom<AdaptivePlusProvider>(
      context,
      aspect: aspect,
    )?.data;
  }

  static AdaptivePlusData? maybeOf(BuildContext context) {
    return _maybeOf(context);
  }

  static AdaptivePlusData _of(
    BuildContext context, [
    AdaptivePlusProviderAspect? aspect,
  ]) {
    if (aspect != null) {
      final data = _maybeOf(context, aspect);
      if (data == null) {
        throw FlutterError(
          'AdaptivePlusProvider.of() called with a context that does not contain '
          'a AdaptivePlusProvider for the aspect $aspect.',
        );
      }
      return data;
    }
    return _maybeOf(context, aspect)!;
  }

  static AdaptivePlusData of(BuildContext context) {
    return _of(context);
  }

  static double fontSizeScaleOf(BuildContext context) {
    return _of(context, AdaptivePlusProviderAspect.font).fontSizeScale;
  }

  static double widthScaleOf(BuildContext context) {
    final widthScale = _of(
      context,
      AdaptivePlusProviderAspect.width,
    ).widthScale;
    return widthScale;
  }

  static double heightScaleOf(BuildContext context) {
    final heightScale = _of(
      context,
      AdaptivePlusProviderAspect.height,
    ).heightScale;
    return heightScale;
  }

  static double radiusScaleOf(BuildContext context) {
    return _of(context, AdaptivePlusProviderAspect.radius).radiusScale;
  }

  static double insetScaleOf(BuildContext context) {
    return _of(context, AdaptivePlusProviderAspect.inset).insetScale;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant AdaptivePlusProvider oldWidget,
    Set<AdaptivePlusProviderAspect> dependencies,
  ) {
    for (final Object dependency in dependencies) {
      if (dependency is AdaptivePlusProviderAspect) {
        return switch (dependency) {
          AdaptivePlusProviderAspect.font =>
            data.fontSizeScale != oldWidget.data.fontSizeScale,
          AdaptivePlusProviderAspect.width =>
            data.widthScale != oldWidget.data.widthScale,
          AdaptivePlusProviderAspect.height =>
            data.heightScale != oldWidget.data.heightScale,
          AdaptivePlusProviderAspect.radius =>
            data.radiusScale != oldWidget.data.radiusScale,
          AdaptivePlusProviderAspect.inset =>
            data.insetScale != oldWidget.data.insetScale,
        };
      }
    }

    return false;
  }
}
