import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'avatar_selection.dart'; // Import the Avatar Selection page

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController diagonized = TextEditingController();
  TextEditingController sleepHoursController = TextEditingController();
  TextEditingController focusLevelController = TextEditingController();

  String? gender;
  String avatarPath = "assets/user_avatar.png"; // Default avatar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE5D9),
      appBar: AppBar(
        title: Text(
          "User Profile",
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFFD8A48F),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final selectedAvatar = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AvatarSelection()),
                        );
                        if (selectedAvatar != null) {
                          setState(() {
                            avatarPath = selectedAvatar;
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(avatarPath),
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildTextField(nameController, "Full Name", FontAwesomeIcons.user, "Enter your name"),
                    _buildTextField(emailController, "Email", FontAwesomeIcons.envelope, "Enter your email"),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Personal Information Section
              ProfileSection(title: "Personal Information", children: [
                _buildTextField(ageController, "Age", FontAwesomeIcons.idCard, "Enter your age", isNumber: true),
                _buildGenderSelection(),
                _buildTextField(locationController, "Location", FontAwesomeIcons.locationDot, "Enter your location"),
              ]),
              SizedBox(height: 20),

              // Memory Health Details
              ProfileSection(title: "Memory Health Details", children: [
                _buildTextField(diagonized, "Diagnosed Date", FontAwesomeIcons.brain, "When were you diagnosed?", isNumber: true),
                _buildTextField(sleepHoursController, "Average Sleep Hours", FontAwesomeIcons.bed, "Enter sleep hours", isNumber: true),
                _buildTextField(focusLevelController, "Do you take medicines?", FontAwesomeIcons.pills, "Yes or No"),
              ]),
              SizedBox(height: 20),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process Data
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Profile Saved Successfully!")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFEFEBCE),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("Save Profile", style: GoogleFonts.poppins(fontSize: 18, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, String hint, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) return "Please enter $label";
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: Color(0xFFBB8588)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(FontAwesomeIcons.venusMars, color: Color(0xFFBB8588)),
          SizedBox(width: 12),
          Text("Gender:", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
          SizedBox(width: 20),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: gender,
              onChanged: (String? newValue) {
                setState(() {
                  gender = newValue;
                });
              },
              validator: (value) => value == null ? "Select gender" : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.white,
              ),
              items: ["Male", "Female", "Other"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: GoogleFonts.poppins(fontSize: 16)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  ProfileSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(thickness: 1),
            Column(children: children),
          ],
        ),
      ),
    );
  }
}
