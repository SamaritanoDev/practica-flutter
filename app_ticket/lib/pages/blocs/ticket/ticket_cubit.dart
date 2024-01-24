import 'dart:io';
import 'package:app_ticket/infrastructure/models/services.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
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
    emit(TicketLoading());

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

        ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
           SnackBar(
            backgroundColor: Colors.green,
            content: Text('Ticket image saved to device. And it was saved in $imagePath'),
          ),
        );

        await shareImage(globalKey, pngBytes, state.selectedService.name);


      } else {
        emit(TicketCaptureError(message: 'imagePath equal  is null.'));

        ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('imagePath equal  is null.'),
          ),
        );
      }
    } catch (e) {
      emit(TicketCaptureError(message: 'Failed to capture widget as image.'));

      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
         SnackBar(
          backgroundColor: Colors.red,
          content: Text('Failed to capture widget as image: $e'),
        ),
      );
    }
  }

  Future<String?> saveMyImage(Uint8List uint8List) async {
    try {
      // Obtener el directorio de la galería
      final galleryDir = await getExternalStorageDirectory();

      if (galleryDir == null) {
        emit(TicketCaptureError(message: 'Error getting gallery directory.'));
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
        return galleryPath;

      } else {
        emit(TicketCaptureError(message: 'Image is null.'));
        return null;
      }
    } catch (e) {
      emit(TicketCaptureError(message: 'Error saving image to gallery: $e'));
      return null;
    }
  }

  Future<void> shareImage(GlobalKey globalKey, Uint8List pngBytes, String clientName) async {
    try {
      final String fileName = '${clientName}_ticket.png';
      await Share.file("Ticket", fileName, pngBytes, 'images/png');

      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Ticket sent.'),
        ),
      );
    } catch (e) {
      emit(TicketCaptureError(message: 'Error sharing image: $e'));
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error generated ticket: $e'),
        ),
      );
    }
  }
}
