import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:checkout/models/custom_input.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _currentPasswordFocus = FocusNode();
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmNewPasswordFocus = FocusNode();

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  
  final _userData = {
    'email': 'sandiepkloof@gmail.com',
    'firstName': 'Sandile',
    'lastName': 'Mdluli',
    'gender': 'Male',
  };

  @override
  void initState() {
    super.initState();
    
    _firstNameController.text = _userData['firstName'] ?? '';
    _lastNameController.text = _userData['lastName'] ?? '';
  }

  Future<void> _pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _saveProfile() {
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile Updated Successfully')),
    );
  }

  void _changePassword() {
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Password Changed Successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 6,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () {
             
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            GestureDetector(
              onTap: _pickProfileImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[200],
                backgroundImage:
                    _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null
                    ? Icon(Icons.camera_alt, color: Colors.grey[800], size: 50)
                    : null,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Tap to change profile picture',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            
            Text(
              'Email: ${_userData['email']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),

            // First Name
            CustomInputTransparent(
              hintText: 'Enter your first name',
              // labelText: 'First Name',
              onChanged: (value) {},
              focusNode: _firstNameFocus,
              controller: _firstNameController,
              textInputAction: TextInputAction.next,
              isPasswordField: false,
              onSubmitted: (value) {},
            ),
            const SizedBox(height: 10),

            // Last Name
            CustomInputTransparent(
              hintText: 'Enter your last name',
              // labelText: 'Last Name',
              onChanged: (value) {},
              focusNode: _lastNameFocus,
              controller: _lastNameController,
              textInputAction: TextInputAction.done,
              isPasswordField: false,
              onSubmitted: (value) {},
            ),
            const SizedBox(height: 10),

            // Gender (Read-only)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Gender: ${_userData['gender']}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Change Password Section
            Text(
              'Change Password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            CustomInputTransparent(
              hintText: 'Current Password',
              // labelText: 'Current Password',
              focusNode: _currentPasswordFocus,
              controller: _currentPasswordController,
              textInputAction: TextInputAction.next,
              isPasswordField: true,
              onSubmitted: (value) {},
              onChanged: (value) {},
            ),
            const SizedBox(height: 10),
            CustomInputTransparent(
              hintText: 'New Password',
              // labelText: 'New Password',
              focusNode: _newPasswordFocus,
              controller: _newPasswordController,
              textInputAction: TextInputAction.next,
              isPasswordField: true,
              onSubmitted: (value) {},
              onChanged: (value) {},
            ),
            const SizedBox(height: 10),
            CustomInputTransparent(
              hintText: 'Confirm New Password',
              // labelText: 'Confirm New Password',
              focusNode: _confirmNewPasswordFocus,
              controller: _confirmNewPasswordController,
              textInputAction: TextInputAction.done,
              isPasswordField: true,
              onSubmitted: (value) {},
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),

            // Save Profile Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: TextButton(
                onPressed: () {
                  _saveProfile();
                  _changePassword();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'SAVE CHANGES',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _currentPasswordFocus.dispose();
    _newPasswordFocus.dispose();
    _confirmNewPasswordFocus.dispose();
    super.dispose();
  }
}
