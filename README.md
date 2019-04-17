# amplitude_flutter
A Flutter plugin for tracking events to [Amplitude](https://www.amplitude.com).

## Usage

To use this plugin, add `amplitude_flutter` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

Import package:amplitude_flutter/amplitude_flutter.dart, and instantiate AmplitudeFlutter with your `API_KEY`.

### Example

```dart
import 'package:amplitude_flutter/amplitude_flutter.dart';

Future<void> example() async {
  final AmplitudeFlutter analytics =  AmplitudeFlutter('API KEY');

  // log an event
  await analytics.logEvent(name: 'Dart Click');

  // Log events with properties
  await analytics.logEvent(name: 'Dart Click', properties: { 'key': 'value' });

  // identify a user
  final Identify identify = Identify()
    ..set('cohort', 'Test A')
    ..setOnce('completed_onboarding', 'true')
    ..add('login_count', 1)
    ..append('tags', 'new tag')
    ..unset('demo_user');

  await analytics.identify(identify);
}
```

## Getting Started

For help getting started with Flutter, view our online
[documentation](http://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).