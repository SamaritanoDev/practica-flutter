import 'package:app_makeup/models/image_type_barbie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCard extends StatelessWidget {
  final ImageTypeBarbie barbie;
  const CustomCard({
    Key? key,
    required this.barbie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).go(barbie.routepage);
        print(barbie.routepage);
      },
      child: Container(
        padding: const EdgeInsets.only(right: 8, left: 8, top: 0, bottom: 8),
        child: Card(
          color: Theme.of(context).colorScheme.primary,
          elevation: 1,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              Center(
                  child: Text(
                barbie.profession,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'staatlichesRegular',
                      fontSize: 20,
                    ),
              )),
              const SizedBox(height: 10),
              SizedBox(
                width: 250,
                height: 220,
                child: Image.asset(
                  barbie.urlpath,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
