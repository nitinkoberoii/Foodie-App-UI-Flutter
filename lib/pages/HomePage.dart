import 'package:flutter/material.dart';
import 'package:food_app/pages/main_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Image.asset(
                      'assets/images/chef_image.png',
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Food for\nEveryone',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 30),
              // for blurized effect - unsuccessful attempt
              // Expanded(
              //   child: Stack(
              //     fit: StackFit.expand,
              //     children: [
              //       Image.asset(
              //         'assets/images/food1.png',
              //         fit: BoxFit.cover,
              //       ),
              //       Container(
              //         decoration: const BoxDecoration(
              //           gradient: LinearGradient(
              //               begin: Alignment.center,
              //               end: Alignment.bottomCenter,
              //               colors: [Colors.transparent, Colors.red],
              //               stops: [0.4, 1.0]),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/food2.png',
                      height: 350,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const MainHome();
                      }),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(325, 70)),
                  child: Text(
                    'Get Started',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
