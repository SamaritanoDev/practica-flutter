import 'package:app_ticket/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();

    // Llamada a addPostFrameCallback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      captureWidget(globalKey);
    });

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RepaintBoundary(
            key: globalKey,
            child: const Ticket(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () => captureWidget(globalKey),
          child: const Icon(
            Icons.save,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> captureWidget(GlobalKey globalKey) async {
    try {
      final RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(
          pixelRatio: 3.0); // Adjust the pixelRatio as needed

      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image to the device
      await saveImage(pngBytes);

      // Show a success message
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text('Ticket image saved to device.'),
        ),
      );
    } catch (e) {
      // Show an error message if something goes wrong
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text('Failed to capture widget as image.'),
        ),
      );
    }
  }

  Future<void> saveImage(Uint8List uint8List) async {
    try {
      // Save the image to the gallery
      await ImageGallerySaver.saveImage(uint8List);

      print('Image saved to gallery');
    } catch (e) {
      print('Error saving image to gallery: $e');
    }

    // try {
    //   final directory = await getApplicationDocumentsDirectory();
    //   final filePath = '${directory.path}/ticket.png';

    //   final file = File(filePath);
    //   await file.writeAsBytes(uint8List);

    //   print('Saving image to: $filePath');
    // } catch (e) {
    //   print('Error saving image: $e');
    // }
  }
}
