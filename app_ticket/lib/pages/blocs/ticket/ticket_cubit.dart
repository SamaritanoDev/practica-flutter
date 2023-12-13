import 'package:app_ticket/infrastructure/models/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;
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
  }

  Future<void> captureWidget(GlobalKey globalKey) async {
    emit(TicketLoading()); // Estado de carga antes de la operación

    try {
      final RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
<<<<<<< Updated upstream
      final ui.Image image = await boundary.toImage(
          pixelRatio: 3.0); // Adjust the pixelRatio as needed
=======
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
>>>>>>> Stashed changes

      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image to the device
      await saveImage(pngBytes);

      // Éxito, emitir estado de éxito
      emit(TicketCaptured());
      // Mostrar SnackBar de éxito
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Ticket image saved to device.'),
        ),
      );
    } catch (e) {
      // Error, emitir estado de error con mensaje
      emit(TicketCaptureError(message: 'Failed to capture widget as image.'));
      // Mostrar SnackBar de error
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Failed to capture widget as image.'),
        ),
      );
    }
  }

  Future<void> saveImage(Uint8List uint8List) async {
    try {
<<<<<<< Updated upstream
      // Guardar la imagen en la galería
      await ImageGallerySaver.saveImage(uint8List);
    } catch (e) {
      // Emitir un evento de error
      emit(TicketCaptureError(message: 'Error saving image to gallery: $e'));
=======
      final Map<dynamic, dynamic>? result =
          await ImageGallerySaver.saveImage(uint8List);

      if (result != null && result.containsKey('filePath')) {
        final String imagePath = result['filePath'];
        return imagePath;
      } else {
        // Si 'filePath' no está presente, guarda la imagen en el directorio temporal
        final String fileName =
            DateTime.now().millisecondsSinceEpoch.toString();
        final String tempPath = '${Directory.systemTemp.path}/$fileName.png';

        File(tempPath).writeAsBytesSync(uint8List);

        return tempPath;
      }
    } catch (e) {
      
      emit(TicketCaptureError(message: 'Error saving image to gallery: {$e}'));
      return null;
    }
  }

  Future<void> shareImage(String imagePath, GlobalKey globalKey) async {
    // Verifica si el archivo existe antes de compartirlo
    if (File(imagePath).existsSync()) {
      // Compartir la imagen utilizando share_plus
      await Share.shareXFiles([XFile(imagePath)]);
    } else {
      // Mostrar un mensaje de error si el archivo no existe
      emit(TicketCaptureError(message: 'Image file does not exist.'));
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Image file does not exist.'),
        ),
      );
>>>>>>> Stashed changes
    }
  }
}
