import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resume_builder/modules/model/resume_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final ResumeModel? resumeModel;

  const HomeScreen({super.key, this.resumeModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _buildSkillsText(ResumeModel data) {
    List<String> skills = [];

    if (data.skill1.trim().isNotEmpty) skills.add(data.skill1);
    if (data.skill2.trim().isNotEmpty) skills.add(data.skill2);
    if (data.skill3.trim().isNotEmpty) skills.add(data.skill3);

    return skills.isEmpty ? "Flutter, Dart, Firebase" : skills.join(', ');
  }

  String withFallback(String value, String fallback) {
    return value.trim().isEmpty ? fallback : value.trim();
  }

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
    final resumeModel = widget.resumeModel;
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
                      withFallback(resumeModel!.name, "Emily deo").toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      withFallback(resumeModel.jobTitle, "computer Engineer"),
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              "${withFallback(resumeModel.phone, "123-456-7890")} | ${withFallback(resumeModel.email, "emily.doe@example.com")}",
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(height: 24, thickness: 1),
          Text("PROFILE", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(
            withFallback(
              resumeModel.summary,
              "Passionate developer with experience in building scalable apps.",
            ),
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(height: 12),
          Text(
            "WORK EXPERIENCE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          buildWorkItem(
            withFallback(resumeModel.role, "Application Developer"),
            withFallback(resumeModel.company, "Tech"),
            withFallback(resumeModel.duration, "2020 - 2023"),
          ),
          SizedBox(height: 12),
          Text("EDUCATION", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(
            "${withFallback(resumeModel.education, "vnsgu University")}\n"
            "${withFallback(resumeModel.degree, "B.Sc in Computer Science")}\n"
            "${withFallback(resumeModel.year, "2015 - 2019")}",
            style: TextStyle(fontSize: 13),
          ),

          SizedBox(height: 12),

          // Skills
          Text("SKILLS", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(_buildSkillsText(resumeModel), style: TextStyle(fontSize: 13)),

          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade300,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeScreen()),
                // );
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

  Widget buildWorkItem(String role, String company, String duration) {
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
