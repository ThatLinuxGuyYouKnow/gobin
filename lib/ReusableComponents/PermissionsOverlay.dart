import 'package:flutter/material.dart';
import 'package:gobin/ReusableComponents/CustonTexts.dart';

class OverlayIfNoPermissions extends StatelessWidget {
  final String dissalowedPermission;
  final Widget baseScreen;
  final bool showOverlay;
  OverlayIfNoPermissions(
      {super.key,
      required this.dissalowedPermission,
      required this.baseScreen,
      required this.showOverlay});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        baseScreen,
        showOverlay
            ? Container(
                height: screenHeight,
                width: screenWidth,
                color: Colors.black.withOpacity(.2),
                child: NoPermissionModal(
                    dissalowedPermission: dissalowedPermission),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}

class NoPermissionModal extends StatelessWidget {
  final String dissalowedPermission;
  NoPermissionModal({super.key, required this.dissalowedPermission});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .4,
      width: screenWidth * .4,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/warning.png'),
          ),
          SizedBox(height: screenHeight * .1),
          StandardText(text: 'Device Permissions not granted for this feature'),
          SizedBox(height: screenHeight * .05),
          StandardText(
              text: 'Pleae go to your device settings and grant' +
                  dissalowedPermission +
                  'for this app')
        ],
      )),
    );
  }
}
