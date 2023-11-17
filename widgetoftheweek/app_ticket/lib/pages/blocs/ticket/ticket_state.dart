part of 'ticket_cubit.dart';

class TicketState {
  final String code;
  final String name;
  final double price;

  const TicketState({
    this.code = '',
    this.name = '',
    this.price = 0.0,
  });

  TicketState copyWhith({
    String? code,
    String? name,
    double? price,
  }) =>
      TicketState(
        code: code ?? this.code,
        name: name ?? this.name,
        price: price ?? this.price,
      );

  List<Object> get props => [code, name, price];
}

// Estado de carga (loading) antes de la operación
class TicketLoading extends TicketState {}

// Estado para indicar que la operación de captura fue exitosa
class TicketCaptured extends TicketState {}

// Estado para indicar un error durante la operación de captura
class TicketCaptureError extends TicketState {
  final String message;

  const TicketCaptureError({required this.message});

  @override
  List<Object> get props => [message];
}
