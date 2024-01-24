import 'package:app_ticket/pages/blocs/ticket/ticket_cubit.dart';
import 'package:app_ticket/widgets/text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Ticket extends StatelessWidget {
  final TicketGenerated generatedState;
  final GlobalKey globalKey = GlobalKey();
  Ticket({super.key, required this.generatedState});

    String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }
  
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return RepaintBoundary(
      key: globalKey,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 500,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xff602E9E),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/logo.svg',
                color: const Color(0xff602E9E),
                width: 250,
                height: 80,
              ),
              const SizedBox(height: 20),
              const Divider(
                height: 2,
                color: Color(0xff602E9E),
              ),
              const SizedBox(height: 50),
              const TextRow(
                emoji: '👩‍💻',
                prefix: 'Contractor',
                value: 'Lesly Samaritano',
              ),
              const SizedBox(height: 10),
              TextRow(
                emoji: '👩',
                prefix: 'Name client',
                value: generatedState.clientName,
              ),
              const SizedBox(height: 10),
              TextRow(
                emoji: '🗓️',
                prefix: 'Date of issue',
                value:
                    formatDateTime(DateTime.parse(generatedState.dateOfIssue)),
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
                  style: textTheme.titleLarge)
            ],
          ),
        ),
      ),
    );
  }
}
