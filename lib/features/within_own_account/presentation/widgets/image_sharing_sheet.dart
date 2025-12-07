import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ShareOptionsImageSheet {
  static void show({
    required BuildContext context,
    required Future<File> Function() onGenerateImage,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) =>
          _ShareImageOptionsContent(onGenerateImage: onGenerateImage),
    );
  }
}

class _ShareImageOptionsContent extends StatelessWidget {
  final Future<File> Function() onGenerateImage;

  const _ShareImageOptionsContent({required this.onGenerateImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Share Image",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          _ShareOption(
            icon: Icons.image,
            label: "Share as Image",
            onTap: () async {
              Navigator.pop(context);

              final imgFile = await onGenerateImage();

              // To implement:
              // Share.shareXFiles([XFile(imgFile.path)]);
            },
          ),

          _ShareOption(
            icon: Icons.download,
            label: "Download Image",
            onTap: () async {
              final messenger = ScaffoldMessenger.of(context);
              Navigator.pop(context);

              final imgFile = await onGenerateImage();
              await saveImageToDownloads(imgFile);

              messenger.showSnackBar(
                const SnackBar(content: Text("Image saved")),
              );
            },
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _ShareOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ShareOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.blue),
      title: Text(label, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}

Future<String> saveImageToDownloads(File imageFile) async {
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

  final targetPath =
      "${downloadsDir.path}/Transfer_Image_${DateTime.now().millisecondsSinceEpoch}.png";
  final newFile = await imageFile.copy(targetPath);
  return newFile.path;
}
