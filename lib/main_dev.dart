import 'package:friends/flavor_config.dart';
import 'package:friends/main_common.dart';
import 'firebase_options.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.dev,
    env: "dev",
    name: "DEV friends",
    values: FlavorValues(
        bundleID: 'friends.dev',
        appID: '',
        baseUrl: '',
        apiUrl: '',
        sentryUrl: '',
        dynamicLinkUrl: ''),
  );

  mainCommon(DefaultFirebaseOptions.currentPlatform);
}
