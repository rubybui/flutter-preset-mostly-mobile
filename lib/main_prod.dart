import 'package:friends/firebase_options_prod.dart';
import 'package:friends/flavor_config.dart';
import 'package:friends/main_common.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.prod,
    env: "prod",
    name: "friends",
    values: FlavorValues(
        bundleID: 'friends',
        appID: '',
        baseUrl: '',
        apiUrl: '',
        sentryUrl: '',
        dynamicLinkUrl: ''),
  );

  mainCommon(DefaultFirebaseOptions.currentPlatform);
}
