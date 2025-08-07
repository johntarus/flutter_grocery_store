import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingContent(),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              context.go('/login');
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('assets/logo/logo.svg', width: 325, height: 78),
            const SizedBox(height: 10),
            Text(
              'Your needs in just one place',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.1,
                color: const Color(0xFF55AB60),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/login');
        },
        backgroundColor: const Color(0xFF55AB60),
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}
