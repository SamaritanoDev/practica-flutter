part of 'ticket_cubit.dart';

class TicketState {
  final String code;
  final String name;
  final double price;
  final Services selectedService;

  const TicketState({
    this.code = '',
    this.name = '',
    this.price = 0.0,
    required this.selectedService,
  });

  // Agregar un constructor sin argumentos
  TicketState.empty()
      : code = '',
        name = '',
        price = 0.0,
        selectedService = Services(
          code: '',
          name: '',
          price: 0.0,
        );

  TicketState copyWhith({
    String? code,
    String? name,
    double? price,
    Services? selectedService,
  }) =>
      TicketState(
        code: code ?? this.code,
        name: name ?? this.name,
        price: price ?? this.price,
        selectedService: selectedService ?? this.selectedService,
      );

  List<Object> get props => [code, name, price, selectedService];
}

// Estado de carga (loading) antes de la operación
class TicketLoading extends TicketState {
  TicketLoading() : super.empty();
}

// Estado para indicar que la operación de captura fue exitosa
class TicketCaptured extends TicketState {
  final String? imagePath;
  TicketCaptured(this.imagePath) : super.empty();
}

// Estado para indicar un error durante la operación de captura
class TicketCaptureError extends TicketState {
  final String message;

  TicketCaptureError({required this.message}) : super.empty();

  @override
  List<Object> get props => [message];
}

class TicketGenerated extends TicketState {
  final String clientName;
  final String dateOfIssue;
  final Services selectedService;

  TicketGenerated({
    required this.clientName,
    required this.dateOfIssue,
    required this.selectedService,
  }) : super.empty();

  @override
  List<Object> get props => [clientName, dateOfIssue, selectedService];
}
