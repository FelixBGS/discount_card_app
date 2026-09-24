import 'package:permission_handler/permission_handler.dart';

enum ScannerPermission { unknown, granted, denied, permanentlyDenied }

class CameraPermissionClient {
  Future<ScannerPermission> current() async {
    return _map(await Permission.camera.status);
  }

  Future<ScannerPermission> request() async {
    return _map(await Permission.camera.request());
  }

  Future<bool> canAskAgain() {
    return Permission.camera.shouldShowRequestRationale;
  }

  Future<void> openSettings() {
    return openAppSettings();
  }

  ScannerPermission _map(PermissionStatus status) {
    if (status.isGranted) return ScannerPermission.granted;
    if (status.isPermanentlyDenied) return ScannerPermission.permanentlyDenied;
    return ScannerPermission.denied;
  }
}
