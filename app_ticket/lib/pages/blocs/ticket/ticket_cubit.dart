import 'dart:io';
import 'package:app_ticket/infrastructure/models/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit()
      : super(
          TicketState(
            selectedService: Services(
              code: '',
              name: '',
              price: 0.0,
            ),
          ),
        );

  void onSelectService(Services service) {
    emit(state.copyWhith(
      selectedService: service,
    ));
  }

  void onGenerateTicket(String clientName, String dateOfIssue) {
    emit(TicketGenerated(
      clientName: clientName,
      dateOfIssue: dateOfIssue,
      selectedService: state.selectedService,
    ));
    // Resto de tu lógica para capturar y guardar la imagen
  }

  Future<void> captureWidget(GlobalKey globalKey) async {
    emit(TicketLoading()); // Estado de carga antes de la operación

    try {
      final RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(pixelRatio: 2.0);

      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      final String? imagePath = await saveMyImage(pngBytes);

      if (imagePath != null) {
        emit(TicketCaptured("La ruta del archivo es $imagePath"));

        print("ruta de la imagen: {$imagePath}");

        // Mostrar SnackBar de éxito
        ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Ticket image saved to device.'),
          ),
        );

        // Comparte la imagen guardada
        await shareMyImage(imagePath);


      } else {
        // Manejar caso en el que no se obtuvo la ruta del archivo
        emit(TicketCaptureError(error: 'imagePath equal  is null.'));
        ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('imagePath equal  is null.'),
          ),
        );
      }
    } catch (e) {
      // Error, emitir estado de error con mensaje
      print("Error: {$e}");
      emit(TicketCaptureError(error: 'Failed to capture widget as image.'));
      // Mostrar SnackBar de error
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Failed to capture widget as image.'),
        ),
      );
    }
  }

  Future<String?> saveMyImage(Uint8List uint8List) async {
    try {
      // Obtener el directorio de la galería
      final galleryDir = await getExternalStorageDirectory();

      if (galleryDir == null) {
        emit(TicketCaptureError(error: 'Error getting gallery directory.'));
        return null;
      }

      // Guardar la imagen en el directorio de la galería
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final String localPath = '${galleryDir.path}/$fileName.png';
      await File(localPath).writeAsBytes(uint8List);

      // Guardar también en la galería
      final result = await ImageGallerySaver.saveFile(localPath);

      if (result != null && result.containsKey('filePath')) {
        // Se obtiene la ruta del archivo en la galería
        final String galleryPath = result['filePath'];
        print("Ruta de la imagen en la galería: $galleryPath");
        return galleryPath;
      } else {
        emit(TicketCaptureError(error: 'Error saving image to gallery.'));
        return null;
      }
    } catch (e) {
      print("Error2: $e");
      emit(TicketCaptureError(error: 'Error saving image: $e'));
      return null;
    }
  }

  Future<void> shareMyImage(String imagePath) async {
    try {
      // Compartir la imagen usando share_extend
      ShareExtend.share("my imagen", imagePath);
    } catch (e) {
      print("Error al compartir la imagen: $e");
      emit(TicketCaptureError(error: 'Error al compartir la imagen: $e'));
      // Puedes agregar un SnackBar de error si lo deseas
    }
  }
}
