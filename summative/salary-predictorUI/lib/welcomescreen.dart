import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
                decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/third.jpg'), // Use AssetImage for local assets
              fit: BoxFit.cover,
            ),
          ),

        child: Container(
          color: Colors.black.withOpacity(0.5), // Dark overlay for text visibility
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Text
              const Text(
                "Salary Predictor.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 86),
              
              // Subtitle Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "predict your salary based on the requirements that you have as a junior/intermediate/professional.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 179, 175, 175),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              
              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  // Define your navigation or action here
                  Navigator.pushNamed(context, '/predict');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 14, 52, 113), // Custom blue color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 23),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
