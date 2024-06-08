import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;

class ExportPDFPage extends StatefulWidget {
  const ExportPDFPage({
    Key? key,
    required String cowId,
  }) : super(key: key);

  @override
  State<ExportPDFPage> createState() => _ExportPDFPageState();
}

class _ExportPDFPageState extends State<ExportPDFPage> {
  // Function to generate the PDF document
  Future<void> _generatePDF() async {
    final pdf = pdfWidgets.Document();

    // Add content to the PDF
    pdf.addPage(
      pdfWidgets.Page(
        build: (context) => pdfWidgets.Column(
          children: [],
        ),
      ),
    );

    // Save the PDF to a file
    final output = await getTemporaryDirectory();
    print("Temporary Directory: ${output.path}");
    final file = File('${output.path}/exported_data.pdf');
    await file.writeAsBytes(await pdf.save());
    print("PDF saved to: ${file.path}");

    // Open the PDF file
    // You can choose to open the PDF here or navigate back with the file path
    // For simplicity, we'll just navigate back after saving the file
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export to PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _generatePDF,
          child: const Text('Generate PDF'),
        ),
      ),
    );
  }
}
