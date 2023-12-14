import 'package:app_ticket/pages/form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_ticket/pages/blocs/ticket/ticket_cubit.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.deepPurpleAccent),
      home: BlocProvider(
        create: (context) => TicketCubit(),
        child: const FormPage(),
      ),
    );
  }
}
