import 'dart:io';
import 'package:printing/printing.dart';

Future<File> convertPdfToImage(File pdfFile) async {
  try {
    final pdfBytes = await pdfFile.readAsBytes();

    // Rasterize the first page of the PDF
    // Printing.raster returns a stream of PdfRaster objects
    final rasterStream = Printing.raster(pdfBytes, pages: [0]);
    final raster = await rasterStream.first;

    final imageFile = File(
      "${pdfFile.parent.path}/transfer_image_${DateTime.now().millisecondsSinceEpoch}.png",
    );

    // Convert raster image to PNG bytes
    final pngBytes = await raster.toPng();
    await imageFile.writeAsBytes(pngBytes);

    return imageFile;
  } catch (e) {
    rethrow;
  }
}
