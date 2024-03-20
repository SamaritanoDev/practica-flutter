import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../const/colors.dart';
import '../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Fondo(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 450,
            child: Column(
              children: [
                Text(
                  '¿Eres nuevo usuario? Comienza ya',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const ButtonRedesSociales(),
                const Divider(),
                const SizedBox(height: 20),
                const _RegisterForm(),
                const SizedBox(height: 5),
                Text(
                  'Terminos y condiciones | Privacidad y políticas',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'samaritanodev@gmail.com', labelText: 'Correo electrónico'),

            onChanged: (value) => value,
            //validation
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'El valor ingresado no puede ser un correo';
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 10),
          Focus(
            child: TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(hintText: '*****', labelText: 'Contraseña'),
              onChanged: (value) => value,
              //validation
              validator: (value) {
                if (value == null) return 'Este campo es requerido';
                return value.length < 8 ? 'Minimo 8 caracteres' : null;
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
              child: const Text(
                'Registrarse',
                style: TextStyle(color: ColorsMyApp.primarycolor),
              )),
        ],
      ),
    );
  }
}

class ButtonRedesSociales extends StatelessWidget {
  const ButtonRedesSociales({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            icon: const Icon(LineIcons.googleLogo),
            onPressed: () {
              print('hi');
            }),
        IconButton(
            icon: const Icon(LineIcons.facebook),
            onPressed: () {
              print('hi');
            }),
        IconButton(
            icon: const Icon(LineIcons.twitter),
            onPressed: () {
              print('hi');
            })
      ],
    );
  }
}
