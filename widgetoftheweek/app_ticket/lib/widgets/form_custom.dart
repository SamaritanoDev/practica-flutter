import 'package:app_ticket/data/data.dart';
import 'package:app_ticket/infrastructure/models/services.dart';
import 'package:app_ticket/pages/blocs/ticket/ticket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormCustom extends StatelessWidget {
  const FormCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final readTicketCubit = context.read<TicketCubit>();
    final textTheme = Theme.of(context).textTheme;
    TextEditingController codeController = TextEditingController();

    List<Services> servicios = serviciosData.map((data) {
      return Services.fromJsonMap(data);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Generate my ticket')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<TicketCubit, TicketState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client name',
                  ),
                ),
                const SizedBox(height: 20),
                servicios.isNotEmpty
                    ? DropdownButtonFormField<Services>(
                        value: servicios.contains(state.selectedService)
                            ? state.selectedService
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'Services',
                          border: OutlineInputBorder(),
                        ),
                        items: servicios.map((service) {
                          return DropdownMenuItem(
                            key: Key(service.code),
                            value: service,
                            child: Text(service.name),
                          );
                        }).toList(),
                        onChanged: (Services? newSelectedService) {
                          if (newSelectedService != null) {
                            readTicketCubit.onSelectService(newSelectedService);
                            codeController.text = newSelectedService.code;
                          }
                        },
                      )
                    : Text('No services available',
                        style:
                            textTheme.titleLarge?.copyWith(color: Colors.red)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Code services',
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      color: Color(0xff04FFB0),
                    ),
                    Text(
                      'Total amount: \$${state.selectedService.code.isNotEmpty ? state.selectedService.price : "Select a service"}',
                      style: textTheme.titleLarge
                          ?.copyWith(color: Colors.deepPurpleAccent),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Generated')),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
