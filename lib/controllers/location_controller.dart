// import 'dart:developer';

import 'package:location/location.dart';

Future<LocationData> getUserLocation() async {
  Location _location = Location();
  bool _isServiceEnabled;
  PermissionStatus _permissionStatus;

  _isServiceEnabled = await _location.serviceEnabled();

  if (!_isServiceEnabled) {
    _isServiceEnabled = await _location.requestService();
    if (!_isServiceEnabled) {
      return Future.error("Location Service is disabled");
    }
  }

  _permissionStatus = await _location.hasPermission();

  if (_permissionStatus == PermissionStatus.denied) {
    _permissionStatus = await _location.requestPermission();
    if (_permissionStatus == PermissionStatus.deniedForever) {
      return Future.error("permission status is disabled");
    }
  }

  LocationData? locale = await _location.getLocation();
  return locale;
}
