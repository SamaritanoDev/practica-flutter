import 'package:app_user_random/src/blocs/user/user_bloc.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final userBloc = UserBloc();

  @override
  void initState() {
    super.initState();
    userBloc.fetchUser();
  }

  @override
  void dispose() {
    super.dispose();
    userBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: userBloc.user,
        builder: (context, user, _) {
          if (user != null) {
            return Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.pictureMedium),
                      radius: 50,
                    ),
                    const SizedBox(height: 16),
                    Text("Name: ${user.firstName} ${user.lastName}"),
                    const SizedBox(height: 16),
                    Text("Email: ${user.email}")
                  ],
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
