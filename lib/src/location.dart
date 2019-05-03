import 'package:location/location.dart' as location_service;

class Location {
  Location() {
    loc = location_service.Location();
  }

  location_service.Location loc;

  Future<Map<String, dynamic>> getLocation() async {
    final enabled = await loc.serviceEnabled();
    final hasPermission = await loc.hasPermission();

    if (enabled && hasPermission) {
      try {
        final position = await loc.getLocation();
        return <String, dynamic>{
          'location': {'lat': position.latitude, 'lng': position.longitude}
        };
      } catch (e) {
        // error
      }
    }
    return <String, dynamic>{};
  }
}
