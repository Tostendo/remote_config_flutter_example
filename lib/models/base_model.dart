import 'package:flutter/foundation.dart';

import '../locator.dart';
import '../services/feature_toggle_service.dart';

class BaseModel extends ChangeNotifier {
  final FeatureToggleService _featureToggleService =
      locator<FeatureToggleService>();

  Future<void> handleStartUpLogic() async {
    await _featureToggleService.initialise();
  }

  String get buttonColor =>
      _featureToggleService.showInvasiveButton ? "#FF0000" : "#00FFFF";
  String get welcomeMessage => _featureToggleService.welcomeMessage;
}
