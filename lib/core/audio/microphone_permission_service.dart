import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'microphone_permission_service.g.dart';

enum MicPermissionResult { granted, denied, permanentlyDenied }

class MicrophonePermissionService {
  const MicrophonePermissionService();

  Future<MicPermissionResult> request() async {
    final status = await Permission.microphone.request();
    return _map(status);
  }

  Future<MicPermissionResult> check() async {
    final status = await Permission.microphone.status;
    return _map(status);
  }

  Future<bool> openSystemSettings() => openAppSettings();

  MicPermissionResult _map(PermissionStatus status) {
    if (status.isGranted || status.isLimited) {
      return MicPermissionResult.granted;
    }
    if (status.isPermanentlyDenied || status.isRestricted) {
      return MicPermissionResult.permanentlyDenied;
    }
    return MicPermissionResult.denied;
  }
}

@Riverpod(keepAlive: true)
MicrophonePermissionService microphonePermissionService(Ref ref) =>
    const MicrophonePermissionService();
