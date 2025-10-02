import 'package:flutter/material.dart';
import 'package:resume_builder/modules/model/resume_model.dart';
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

  final jobTitleController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final summaryController = TextEditingController();

  final companyController = TextEditingController();
  final roleController = TextEditingController();
  final durationController = TextEditingController();

  final schoolController = TextEditingController();
  final degreeController = TextEditingController();
  final yearController = TextEditingController();

  final skill1Controller = TextEditingController();
  final skill2Controller = TextEditingController();
  final skill3Controller = TextEditingController();

  void _clearAllFields() {
    jobTitleController.clear();
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    summaryController.clear();

    companyController.clear();
    roleController.clear();
    durationController.clear();

    schoolController.clear();
    degreeController.clear();
    yearController.clear();

    skill1Controller.clear();
    skill2Controller.clear();
    skill3Controller.clear();

    setState(() {
      isExperienceExpanded = false;
      isEducationExpanded = false;
      isSkillsExpanded = false;
    });
  }

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
              buildTextField("Job Title", controller: jobTitleController),
              buildTextField("Name", controller: nameController),
              buildTextField(
                "Phone number",
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
              buildTextField(
                "Email",
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              buildTextField(
                "Summary",
                maxLines: 3,
                controller: summaryController,
              ),
              SizedBox(height: 24),
              buildExpandableHeader("EXPERIENCE SECTION", () {
                setState(() {
                  isExperienceExpanded = !isExperienceExpanded;
                });
              }),
              if (isExperienceExpanded) ...[
                buildTextField("Company", controller: companyController),
                buildTextField("Role", controller: roleController),
                buildTextField("Duration", controller: durationController),
              ],
              SizedBox(height: 16),
              buildExpandableHeader("EDUCATION SECTION", () {
                setState(() {
                  isEducationExpanded = !isEducationExpanded;
                });
              }),
              if (isEducationExpanded) ...[
                buildTextField(
                  "School / College",
                  controller: schoolController,
                ),
                buildTextField("Degree", controller: degreeController),
                buildTextField("Year", controller: yearController),
              ],
              SizedBox(height: 16),
              buildExpandableHeader("SKILLS SECTION", () {
                setState(() {
                  isSkillsExpanded = !isSkillsExpanded;
                });
              }),
              if (isSkillsExpanded) ...[
                buildTextField("Skill 1", controller: skill1Controller),
                buildTextField("Skill 2", controller: skill2Controller),
                buildTextField("Skill 3", controller: skill3Controller),
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
                  onPressed: () async {
                    final resumeData = ResumeModel(
                      jobTitle: jobTitleController.text,
                      name: nameController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      summary: summaryController.text,
                      company: companyController.text,
                      role: roleController.text,
                      duration: durationController.text,
                      education: schoolController.text,
                      degree: degreeController.text,
                      year: yearController.text,
                      skill1: skill1Controller.text,
                      skill2: skill2Controller.text,
                      skill3: skill3Controller.text,
                    );

                    _clearAllFields();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => HomeScreen(resumeModel: resumeData),
                      ),
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
    TextEditingController? controller,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
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
