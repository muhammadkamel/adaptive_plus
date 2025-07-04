import 'package:adaptive_plus/src/widgets/adaptive_plus_singleton.dart';
import 'package:flutter/widgets.dart';

abstract class AdaptivePlusKeyProvider {
  const AdaptivePlusKeyProvider._();

  static GlobalObjectKey<AdaptivePlusSingletonState>? _key;

  static GlobalObjectKey<AdaptivePlusSingletonState> get key {
    return _key ??= const GlobalObjectKey<AdaptivePlusSingletonState>(
      'screen_adaptive_plus_key',
    );
  }
}
