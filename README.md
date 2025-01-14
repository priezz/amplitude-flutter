# amplitude_flutter

The Official Amplitude Flutter plugin. Used to track events with [Amplitude](https://www.amplitude.com).

## Getting Started

To use this plugin, add `amplitude_flutter` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

Find the [API key](https://amplitude.zendesk.com/hc/en-us/articles/235649848-Settings#project-general-settings) for your Amplitude project under your project settings.

Import `package:amplitude_flutter/amplitude_flutter.dart`, and instantiate `AmplitudeFlutter` with your API key.

In the example below - replace the string `API_KEY` with your API Key.

In addition, a [`Config`](https://github.com/amplitude/Amplitude-Flutter/blob/master/lib/src/config.dart) object can be passed as a constructor argument for additional options.
NOTE: This plugin's methods should only be called from the main isolate.

### Adding Carrier Information
You can set an option in the config object titled `getCarrierInfo` to retreive carrier name for a device. This is the ( [`Config`](https://github.com/amplitude/Amplitude-Flutter/blob/master/lib/src/config.dart)). This object can be passed as a constructor argument for additional options.

If you set `getCarrierInfo` to `true` - **recipients on Android devices will see a dialog box asking them for perimssion** . This dialog will say
`allow app to make and manage phone calls`. This is a message sent from the android operating system for the `READ_PHONE_STATE` permission and carrier info is grouped into this.
If the user denies permission - carrier information will not be retrieved. The new android operating systems require asking a user for permission before retrieving this information.

By default the Config will set `getCarrierInfo` will default to false.

And example can be found here [`Example`](https://github.com/amplitude/Amplitude-Flutter/blob/chores/add-missing-device-data-wip/example/lib/my_app.dart#L30).

### Example

```dart
import 'package:amplitude_flutter/amplitude_flutter.dart';

// replace 'API_KEY' with your project's API_KEY
Future<void> example() async {
  final AmplitudeFlutter analytics = AmplitudeFlutter('API KEY');

  // set this user's id
  analytics.setUserId('abc123');

  // log an event
  analytics.logEvent(name: 'add_friend');

  // Log events with event properties
  analytics.logEvent(name: 'add_friend', properties: { 'event_properties': { 'key': 'value' }});

  // identify a user
  final Identify identify = Identify()
    ..set('cohort', 'Test A')
    ..setOnce('completed_onboarding', 'true')
    ..add('login_count', 1)
    ..append('tags', 'new tag')
    ..unset('demo_user');

  analytics.identify(identify);

  // Amplitude Accounts [https://amplitude.zendesk.com/hc/en-us/articles/115001765532-Accounts] methods:
  // add a user to a group
  analytics.setGroup('orgId', 15);

  // change properties of a group
  analytics.groupIdentify('orgId', 15, Identify()..set('account_manager', 456));

  // emit an event associated with a group
  analytics.logEvent('Demo Released', properties: { 'groups': { 'orgId': 15 } });

  // Log revenue
  final Revenue revenue = Revenue()
    ..setPrice(23.23)
    ..setQuantity(3)
    ..setProductId('widget1')

  analytics.logRevenue(revenue);
}
```
