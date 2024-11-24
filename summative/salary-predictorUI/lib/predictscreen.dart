import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PredictScreen extends StatefulWidget {
  const PredictScreen({super.key});

  @override
  _PredictScreenState createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  // Controllers for input fields
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _educationLevelController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  String _selectedGender = 'male'; // Default gender
  String? _predictedSalary; // Store predicted salary

  // Function to call the backend
  Future<void> _predictSalary() async {
    final url = Uri.parse('https://salary-16ch.onrender.com/predict/'); // Backend URL

    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "age": int.tryParse(_ageController.text) ?? 0,
          "gender": _selectedGender,
          "education_level": _educationLevelController.text.toLowerCase(),
          "job_title": _jobTitleController.text.toLowerCase(),
          "years_of_experience": double.tryParse(_experienceController.text) ?? 0.0,
        }),
      );

      Navigator.pop(context); // Dismiss loading indicator

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        setState(() {
          _predictedSalary = "USD ${result['predicted_salary']}";
        });
      } else {
        final error = jsonDecode(response.body);
        _showErrorDialog(error['detail'] ?? 'Unexpected error occurred.');
      }
    } catch (e) {
      Navigator.pop(context); // Dismiss loading indicator
      _showErrorDialog('Error: Unable to connect to the server. Please try again later.');
    }
  }

  // Function to show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFD9D2C3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02,
              horizontal: screenWidth * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'SALARY PREDICTOR',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'Salary:',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 57, 144),
                  ),
                ),
                if (_predictedSalary != null)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    child: Text(
                      _predictedSalary!,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  'Person Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Age',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: TextField(
                              controller: _educationLevelController,
                              decoration: const InputDecoration(
                                labelText: 'Education level (e.g., Bachelor\'s)',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _jobTitleController,
                              decoration: const InputDecoration(
                                labelText: 'Job Title',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: TextField(
                              controller: _experienceController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Years of experience',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      DropdownButtonFormField<String>(
                        value: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'male',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'female',
                            child: Text('Female'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                ElevatedButton(
                  onPressed: _predictSalary,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 14, 52, 113),
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Predict',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'All rights reserved 2024',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PredictScreen(),
  ));
}
