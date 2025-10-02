import 'package:flutter/material.dart';
import 'package:resume_builder/modules/view/home_screen.dart';

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({super.key});

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isExperienceExpanded = false;
  bool isEducationExpanded = false;
  bool isSkillsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        centerTitle: true,
        title: Text("Enter details", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PROFILE SECTION",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 16),
              buildTextField("Job Title"),
              buildTextField("Name"),
              buildTextField("Phone number", keyboardType: TextInputType.phone),
              buildTextField("Email", keyboardType: TextInputType.emailAddress),
              buildTextField("Summary", maxLines: 3),
              SizedBox(height: 24),
              buildExpandableHeader("EXPERIENCE SECTION", () {
                setState(() {
                  isExperienceExpanded = !isExperienceExpanded;
                });
              }),
              if (isExperienceExpanded) ...[
                buildTextField("Company"),
                buildTextField("Role"),
                buildTextField("Duration"),
              ],
              SizedBox(height: 16),
              buildExpandableHeader("EDUCATION SECTION", () {
                setState(() {
                  isEducationExpanded = !isEducationExpanded;
                });
              }),
              if (isEducationExpanded) ...[
                buildTextField("School / College"),
                buildTextField("Degree"),
                buildTextField("Year"),
              ],
              SizedBox(height: 16),
              buildExpandableHeader("SKILLS SECTION", () {
                setState(() {
                  isSkillsExpanded = !isSkillsExpanded;
                });
              }),
              if (isSkillsExpanded) ...[
                buildTextField("Skill 1"),
                buildTextField("Skill 2"),
                buildTextField("Skill 3"),
              ],
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    padding: EdgeInsets.symmetric(vertical: 16),
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
                  child: Text(
                    "Generate Resume",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildExpandableHeader(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          Icon(Icons.add_circle, color: Colors.blue),
        ],
      ),
    );
  }
}
