import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> savePdfToDownloads(File pdfFile) async {
  // Default to granted and only request on mobile platforms; catch MissingPluginException.
  PermissionStatus status = PermissionStatus.granted;

  if (Platform.isAndroid || Platform.isIOS) {
    try {
      if (Platform.isAndroid) {
        status = await Permission.manageExternalStorage.request();
        if (!status.isGranted) {
          status = await Permission.storage.request();
        }
      } else {
        status = await Permission.photosAddOnly.request();
      }
    } on MissingPluginException {
      status = PermissionStatus.granted;
    }
  }

  if ((Platform.isAndroid || Platform.isIOS) && !status.isGranted) {
    throw Exception("Storage permission denied");
  }

  Directory? downloadsDir;

  if (Platform.isAndroid) {
    final manual = Directory("/storage/emulated/0/Download");
    downloadsDir = manual.existsSync()
        ? manual
        : await getExternalStorageDirectory();
  } else {
    downloadsDir = await getDownloadsDirectory();
  }

  downloadsDir ??= await getApplicationDocumentsDirectory();
  if (!await downloadsDir.exists()) {
    await downloadsDir.create(recursive: true);
  }

  final newPath =
      "${downloadsDir.path}/Transfer_Receipt_${DateTime.now().millisecondsSinceEpoch}.pdf";

  final newFile = await pdfFile.copy(newPath);
  return newFile.path;
}
