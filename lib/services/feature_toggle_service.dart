import 'package:firebase_remote_config/firebase_remote_config.dart';

const String _showInvasiveButton = "show_invasive_button";
const String _welcomeMessage = "welcome_message";

class FeatureToggleService {
  final RemoteConfig _remoteConfig;
  final defaults = <String, dynamic>{
    _showInvasiveButton: false,
    _welcomeMessage: "Hello Thomas!"
  };

  static FeatureToggleService _instance;
  FeatureToggleService({RemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  static Future<FeatureToggleService> getInstance() async {
    if (_instance == null) {
      _instance = FeatureToggleService(
        remoteConfig: await RemoteConfig.instance,
      );
    }
    return _instance;
  }

  Future<void> initialise() async {
    try {
      await _remoteConfig.setDefaults(defaults);
      await _fetchAndActivate();
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      print('Remote config fetch throttled: $exception');
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
    }
  }

  Future<void> _fetchAndActivate() async {
    await _remoteConfig.fetch(expiration: Duration(seconds: 30));
    await _remoteConfig.activateFetched();
  }

  bool get showInvasiveButton => _remoteConfig.getBool(_showInvasiveButton);
  String get welcomeMessage => _remoteConfig.getString(_welcomeMessage);
}
