import 'package:adaptive_plus/src/models/adaptive_plus_options.dart';
import 'package:adaptive_plus/src/models/adaptive_plus_view.dart';

abstract class AdaptivePlusScaler {
  const AdaptivePlusScaler();

  double getFontScaleFactor(AdaptivePlusView view, AdaptivePlusOptions options);

  double getWidthScaleFactor(
    AdaptivePlusView view,
    AdaptivePlusOptions options,
  );

  double getHeightScaleFactor(
    AdaptivePlusView view,
    AdaptivePlusOptions options,
  );

  double getPaddingScaleFactor(
    AdaptivePlusView view,
    AdaptivePlusOptions options,
  );
}
