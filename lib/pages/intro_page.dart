import 'package:flutter/material.dart';
import 'package:grocery_ui/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //logo
          Padding(
            padding: EdgeInsets.only(
              left: 80,
              right: 80,
              bottom: 40,
              top: 120,
            ),
            child: Image.asset('assets/image.png'),
          ),

          //welcome text
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'We deliver to your home doorstep',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // sub title
          Text(
            'We welcome you all the time',
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),
          // get started button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomePage();
            })),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(25),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
