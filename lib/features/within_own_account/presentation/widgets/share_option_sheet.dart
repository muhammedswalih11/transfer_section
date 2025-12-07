import 'dart:io';

import 'package:flutter/material.dart';

import 'pdf_saving.dart';

class ShareOptionsSheet {
  static void show({
    required BuildContext context,
    required Future<File> Function() onGeneratePdf,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _ShareOptionsContent(onGeneratePdf: onGeneratePdf),
    );
  }
}

class _ShareOptionsContent extends StatelessWidget {
  final Future<File> Function() onGeneratePdf;

  const _ShareOptionsContent({required this.onGeneratePdf});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Share Options",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          _ShareOption(
            icon: Icons.call,
            label: "WhatsApp",
            onTap: () async {
              Navigator.pop(context);
              final file = await onGeneratePdf();
              // TODO: implement WhatsApp share
            },
          ),

          _ShareOption(
            icon: Icons.facebook,
            label: "Facebook",
            onTap: () async {
              Navigator.pop(context);
              final file = await onGeneratePdf();
              // TODO: implement Facebook share
            },
          ),

          _ShareOption(
            icon: Icons.send,
            label: "Telegram",
            onTap: () async {
              Navigator.pop(context);
              final file = await onGeneratePdf();
              // TODO: implement Telegram share
            },
          ),

          _ShareOption(
            icon: Icons.download,
            label: "Download PDF",
            onTap: () async {
              Navigator.pop(context);

              final pdfFile = await onGeneratePdf();
              await savePdfToDownloads(pdfFile);

              // no snackbar
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
