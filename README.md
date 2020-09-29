### HOW TO

1. Setup apps within Firebase (follow the instructions). For that, Google service credentials need to be put in ios and android folder of the repository.

2. use firebase_remote_config sdk from firebase and include into your pubspec.yaml (firebase_remote_config: ^0.4.0)


3. Configure one or more parameters in firebase unter “Remote Config” with standard values. Here it is easily possible to restrict to platforms, users and much more (if google analytics is also included)

4. Let app use remote config (see example code) and configure default values. They will be used on first startup. Then the config will be fetched and cached for a defined amount of time, but will only be used on from the next startup (to avoid flakiness)

5. Change parameters in firebase, then reload app. The app layout does not change, but will on next reload. This is to avoid flakiness. You keep using the old values but if the time between your last fetch and this one is longer then the defined time period, app will fetch the new values and use them on next startup.
