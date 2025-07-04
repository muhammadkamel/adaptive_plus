import 'package:adaptive_plus/src/utils/adaptive_plus_scaler.dart';

class AdaptivePlusPassthroughScaler extends AdaptivePlusScaler {
  const AdaptivePlusPassthroughScaler();

  @override
  double getFontScaleFactor(_, _) => 1.0;

  @override
  double getWidthScaleFactor(_, _) => 1.0;

  @override
  double getHeightScaleFactor(_, _) => 1.0;

  @override
  double getPaddingScaleFactor(_, _) => 1.0;
}
