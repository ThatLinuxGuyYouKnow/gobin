// lib/gemini_spot_waste.dart
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'dart:convert';

class GeminiSpotWaste {
  final String serverUrl;

  GeminiSpotWaste({required this.serverUrl});

  Future<void> identifyWaste({required List<int> imageBytes}) async {
    // Get location
    Location location = new Location();
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    PermissionStatus _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData _locationData = await location.getLocation();

    // Prepare data
    final String userLocation =
        "${_locationData.latitude},${_locationData.longitude}";
    final Uri uri = Uri.parse("$serverUrl/upload_image");
    final request = http.MultipartRequest("POST", uri)
      ..fields['location'] = userLocation
      ..files.add(http.MultipartFile.fromBytes('image', imageBytes,
          filename: 'waste_image.png'));

    // Send request
    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    // Handle response
    if (response.statusCode == 200) {
      final data = json.decode(responseString);
      print("Waste Type: ${data['waste_type']}");
      print("Description: ${data['description']}");
      print("Disposal Sites: ${data['disposal_sites']}");
    } else {
      print("Failed to get data: ${response.statusCode}");
    }
  }
}
