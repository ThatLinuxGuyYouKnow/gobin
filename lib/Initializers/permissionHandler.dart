// lib/permissions.dart
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class PermissionManger {
  Future<void> requestPermissions(BuildContext context) async {
    // Permissions to be requested
    Map<Permission, String> permissions = {
      Permission.camera: 'Camera is required to capture images.',
      Permission.storage:
          'Storage permission is required to save captured images.',
      Permission.locationWhenInUse: 'Location is required to find nearby bins.',
    };

    List<Permission> deniedPermissions = [];

    for (Permission permission in permissions.keys) {
      if (await permission.isDenied || await permission.isPermanentlyDenied) {
        deniedPermissions.add(permission);
      }
    }

    if (deniedPermissions.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Permissions Required'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: permissions.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entry.key.toString().split('.').last + ': '),
                    Text(entry.value,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                );
              }).toList(),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  // Request all denied permissions
                  Map<Permission, PermissionStatus> statuses =
                      await Future.wait(
                    deniedPermissions.map((permission) => permission.request()),
                  ).then((results) =>
                          Map.fromIterables(deniedPermissions, results));

                  bool allGranted =
                      statuses.values.every((status) => status.isGranted);
                  if (!allGranted) {
                    // Handle the case where permissions are not granted
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Permissions Denied'),
                          content: Text(
                              'All permissions are required for the app to function properly.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Grant Permissions'),
              ),
            ],
          );
        },
      );
    }
  }
}
