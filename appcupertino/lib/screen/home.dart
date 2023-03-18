import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IWD',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: const [
          Grand(),
          CardBanner(),
        ],
      ),
    );
  }
}

class CardBanner extends StatelessWidget {
  const CardBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url =
        'https://scontent.flim3-2.fna.fbcdn.net/v/t39.30808-6/326254203_1604344496676899_2016998308796987761_n.png?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=uOJaq66NrP4AX-Ve0ZL&_nc_ht=scontent.flim3-2.fna&oh=00_AfDiINZIXVPL7rPpFq_vn1_jPHZlxzyAOstMXSyIwuozQg&oe=641A4A17';

    return Center(
        child: Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 250,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Bienvenidas(os)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Internacional Women Day 2023',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(url),
            )
          ],
        ),
      ),
    ));
  }
}
