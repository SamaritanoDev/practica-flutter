import 'package:app_ticket/pages/blocs/ticket/ticket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TicketPage extends StatelessWidget {
  final TicketState ticketState;

  const TicketPage({
    super.key,
    required this.ticketState,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (ticketState is TicketGenerated) {
      final generatedState = ticketState as TicketGenerated;

      return BlocBuilder<TicketCubit, TicketState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    color: const Color(0xff602E9E),
                    width: 250,
                    height: 80,
                  ),
                  const SizedBox(height: 50),
                  const TextRow(
                    emoji: '👩‍💻',
                    prefix: 'Contractor',
                    value: 'Lesly Samaritano',
                  ),
                  const SizedBox(height: 10),
                  TextRow(
                    emoji: '🗓️',
                    prefix: 'Date of issue',
                    value: generatedState.dateOfIssue,
                  ),
                  const SizedBox(height: 10),
                  TextRow(
                    emoji: '⚙️',
                    prefix: 'Service',
                    value: generatedState.selectedService.name,
                  ),
                  const SizedBox(height: 10),
                  TextRow(
                    emoji: '💰',
                    prefix: 'Total Amount',
                    value: '\$${generatedState.selectedService.price}',
                  ),
                  const SizedBox(height: 50),
                  Text('Thanks for your preference 🥹💜',
                      style: textTheme.headlineSmall)
                ],
              ),
            ),
          );
        },
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('ERROR'),
        ),
        body: Center(
          child: Text('No ticket generated', style: textTheme.headlineSmall),
        ),
      );
    }
  }
}

class TextRow extends StatelessWidget {
  final String emoji;
  final String prefix;
  final String value;

  const TextRow({
    Key? key,
    required this.emoji,
    required this.prefix,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          prefix,
          style: textTheme.titleLarge?.copyWith(color: const Color(0xffF5907C)),
        ),
        Text(emoji),
        Text(value, style: textTheme.bodyLarge),
      ],
    );
  }
}
