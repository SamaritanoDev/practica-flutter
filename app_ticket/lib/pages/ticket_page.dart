import 'package:app_ticket/widgets/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_ticket/pages/blocs/ticket/ticket_cubit.dart';

class TicketPage extends StatelessWidget {
  final TicketState ticketState;

  const TicketPage({
    super.key,
    required this.ticketState,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (ticketState is TicketGenerated) {
      final generatedState = ticketState as TicketGenerated;
      final readTicketCubit = context.read<TicketCubit>();
      final GlobalKey globalKey = GlobalKey();

      return BlocBuilder<TicketCubit, TicketState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: color.primary,
              onPressed: () => readTicketCubit.captureWidget(globalKey),
              child: const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            body: Ticket(generatedState: generatedState),
          );
        },
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: color.error,
          title: const Text('ERROR'),
        ),
        body: Center(
          child: Text(
            'No ticket generated',
            style: textTheme.headlineSmall,
          ),
        ),
      );
    }
  }
}
