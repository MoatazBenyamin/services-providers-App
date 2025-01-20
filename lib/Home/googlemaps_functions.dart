import 'package:geolocator/geolocator.dart';

// ! This function is used to get the current location
Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled, handle accordingly
    return Future.error('Location services are disabled');
  }

  // Request location permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Location permission is denied, handle accordingly
      return Future.error('Location permissions are denied');
    }
  }

  // Get the current location
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  return position;
}

// ! This function is used to get the distance between current location and destination
Future<double> calculateDistance(String destination) async {
  try {
    Position position = await getCurrentLocation();
    double startLatitude = position.latitude;
    double startLongitude = position.longitude;

    List<String> latLong = destination.split(',');

    double latdis = double.parse(latLong[0]);
    double longdis = double.parse(latLong[1]);
    double distanceInMeters = await Geolocator.distanceBetween(
        startLatitude, startLongitude, latdis, longdis);

    // Convert distance from meters to kilometers
    double distanceInKm = distanceInMeters / 1000;
    double roundeddistanceInKm = double.parse(distanceInKm.toStringAsFixed(3));

    return roundeddistanceInKm;
  } catch (e) {
    // Handle any errors that occur while retrieving the location
    print('Error getting location: $e');
    return Future.error('Error getting location');
  }
}
