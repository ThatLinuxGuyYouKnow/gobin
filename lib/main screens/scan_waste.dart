// lib/screens/scan_waste.dart
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gobin/AI-Interactions/gemini-waste-spot.dart';
import 'package:gobin/ReusableComponents/PermissionsOverlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ScanWaste extends StatefulWidget {
  @override
  _ScanWasteState createState() => _ScanWasteState();
}

class _ScanWasteState extends State<ScanWaste> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  final GeminiSpotWaste _geminiSpotWaste =
      GeminiSpotWaste(serverUrl: 'http://34.68.140.15:8080');

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    if (await Permission.camera.request().isGranted) {
      _initializeCamera();
    } else {
      // Show a message to the user explaining that the camera permission is required
      _showPermissionDeniedDialog();
    }
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    _initializeControllerFuture = _controller?.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Denied'),
        content: Text('Camera permission is required to use this feature.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller?.takePicture();
      final directory = await getApplicationDocumentsDirectory();
      final String imagePath =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
      final File newImage = await File(image!.path).copy(imagePath);
      final List<int> imageBytes = await newImage.readAsBytes();

      // Pass the image bytes to GeminiSpotWaste class
      await _geminiSpotWaste.identifyWaste(imageBytes: imageBytes);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _initializeControllerFuture == null
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.9,
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SizedBox(
                          width: screenWidth,
                          height: screenHeight * 0.9,
                          child: CameraPreview(_controller!),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: screenWidth / 2 - 50,
                  child: ElevatedButton(
                    onPressed: _captureImage,
                    child: Text('Capture Image'),
                  ),
                ),
              ],
            ),
    );
  }
}
