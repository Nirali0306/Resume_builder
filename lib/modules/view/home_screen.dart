import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        centerTitle: true,
        title: const Text(
          "Resume Preview",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          buildResumeCard(context),
           SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildResumeCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Emilly",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text("Developer", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
           SizedBox(height: 12),
           Center(
            child: Text(
              "123-456-7890 | john.doe@example.com",
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
           Divider(height: 24, thickness: 1),
           Text("PROFILE", style: TextStyle(fontWeight: FontWeight.bold)),
           SizedBox(height: 4),
           Text(
            "Summary",
            style: TextStyle(fontSize: 13),
          ),
           SizedBox(height: 12),
           Text(
            "WORK EXPERIENCE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 4),
          buildWorkItem(
            "Computer Engineer",
            "Tech",
            "2024-01 - 2025-02"
          ),
         SizedBox(height: 12),
           Text(
            "EDUCATION",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 4),
           Text(
            "University\nB.sc in Computer Science\n2018 - 2020",
            style: TextStyle(fontSize: 13),
          ),

           SizedBox(height: 12),

          // Skills
           Text("SKILLS", style: TextStyle(fontWeight: FontWeight.bold)),
           SizedBox(height: 4),
           Text(
            "Flutter, Dart, Firebase, REST API",
            style: TextStyle(fontSize: 13),
          ),

           SizedBox(height: 20),
          Center(
            child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: const Text(
                    "Select Template",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget buildWorkItem(
    String role,
    String company,
    String duration,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$role\n$company\n$duration",
            style: const TextStyle(fontSize: 13),
          ),        
        ],
      ),
    );
  }
}
