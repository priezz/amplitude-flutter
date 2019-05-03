import 'package:flutter/foundation.dart';
import 'client.dart';
import 'device_info.dart';
import 'location.dart';
import 'session.dart';
import 'store.dart';

class ServiceProvider {
  ServiceProvider({@required String apiKey, @required int timeout}) {
    client = Client(apiKey);
    deviceInfo = DeviceInfo();
    session = Session(timeout);
    store = Store();
  }

  Client client;
  DeviceInfo deviceInfo;
  Location location;
  Session session;
  Store store;

  Location getLocation() => location ??= Location();
}
