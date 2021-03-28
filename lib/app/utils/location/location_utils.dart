

import 'package:flutter/material.dart';


class LocationUtils {
  static void navigateTo(BuildContext context, double lat, double lng) async {

  }

//   static Future openLocation(BuildContext context) async {
//     Location location = new Location();
//
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     LocationData _locationData;
//
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return null;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return null;
//       }
//     }
//
//     _locationData = await location.getLocation();
//
//     final coordinates =
//         new Coordinates(_locationData.latitude, _locationData.longitude);
//     var addresses =
//         await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     var address = addresses.first;
//     var localeName = "${address?.addressLine ?? ""}";
//
//     return address;
//
// //    location.onLocationChanged.listen((LocationData currentLocation) {
// //      print(currentLocation.longitude);
// //      print(currentLocation.latitude);
// //    });
//   }


}
