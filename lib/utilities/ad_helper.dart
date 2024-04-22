import 'dart:io';
import 'package:universal_platform/universal_platform.dart';
class AdHelper {
  static String get bannerAdUnitId {
    if (UniversalPlatform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (UniversalPlatform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    throw UnsupportedError("Unsupported platform");
  }

  static String get nativeAdUnitId {
    if (UniversalPlatform.isAndroid) {
      return 'ca-app-pub-3940256099942544/2247696110';
    } else if (UniversalPlatform.isIOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    }
    throw UnsupportedError("Unsupported platform");
  }

  static String get rewardedInterstitialAdUnitId {
    if (UniversalPlatform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5354046379';
    } else if (UniversalPlatform.isIOS) {
      return 'ca-app-pub-3940256099942544/6978759866';
    }
    throw UnsupportedError("Unsupported platform");
  }
}
