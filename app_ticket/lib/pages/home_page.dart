import 'package:app_ticket/widgets/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_ticket/pages/blocs/ticket/ticket_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     final GlobalKey globalKey = GlobalKey();
     final readTicketCubit = context.read<TicketCubit>();

    return Scaffold(
          body: Center(
            child: RepaintBoundary(
              key: globalKey,
              child: Ticket(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: () => readTicketCubit.captureWidget(globalKey),
            child: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        );
  }
}

