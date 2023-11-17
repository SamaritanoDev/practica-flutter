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
    // Resto de tu lógica para capturar y guardar la imagen
  }

  Future<void> captureWidget(GlobalKey globalKey) async {
    emit(TicketLoading()); // Estado de carga antes de la operación

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
      // Guardar la imagen en la galería
      await ImageGallerySaver.saveImage(uint8List);
    } catch (e) {
      // Emitir un evento de error
      emit(TicketCaptureError(message: 'Error saving image to gallery: $e'));
    }
  }
}
