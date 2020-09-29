import 'package:get_it/get_it.dart';
import 'services/feature_toggle_service.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  var featureToggleService = await FeatureToggleService.getInstance();
  locator.registerSingleton(featureToggleService);
}
