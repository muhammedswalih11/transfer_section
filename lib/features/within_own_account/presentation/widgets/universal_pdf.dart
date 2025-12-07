import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class PdfSection {
  final String title;
  final String value;

  PdfSection(this.title, this.value);
}

Future<File> generateReceiptPdf({
  required String headerTitle,
  required String dateTime,
  required List<PdfSection> sections,
  String fileName = "transfer_receipt.pdf",
}) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      margin: const pw.EdgeInsets.all(24),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Center(
              child: pw.Text(
                headerTitle,
                style: pw.TextStyle(
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),

            pw.SizedBox(height: 10),

            pw.Center(
              child: pw.Text(dateTime, style: pw.TextStyle(fontSize: 12)),
            ),

            pw.SizedBox(height: 25),

            ...sections.map((e) => _pdfSectionWidget(e)).toList(),
          ],
        );
      },
    ),
  );

  final dir = await getTemporaryDirectory();
  final file = File("${dir.path}/$fileName");
  await file.writeAsBytes(await pdf.save());
  return file;
}

pw.Widget _pdfSectionWidget(PdfSection section) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 16),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          section.title,
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 4),
        pw.Text(section.value, style: const pw.TextStyle(fontSize: 12)),
        pw.Divider(),
      ],
    ),
  );
}
