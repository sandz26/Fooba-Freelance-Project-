import 'package:flutter/material.dart';
import 'package:checkout/models/custom_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _genderFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInputTransparent(
                hintText: 'Enter your email',
                // labelText: 'Email',
                onChanged: (value) {},
                onSubmitted: (value) => _firstNameFocus.requestFocus(),
                focusNode: _emailFocus,
                textInputAction: TextInputAction.next,
                isPasswordField: false,
                controller: _emailController,
              ),
              const SizedBox(height: 10),
              CustomInputTransparent(
                hintText: 'Enter your first name',
                // labelText: 'First Name',
                onChanged: (value) {},
                onSubmitted: (value) => _lastNameFocus.requestFocus(),
                focusNode: _firstNameFocus,
                textInputAction: TextInputAction.next,
                isPasswordField: false,
                controller: _firstNameController,
              ),
              const SizedBox(height: 10),
              CustomInputTransparent(
                hintText: 'Enter your last name',
                // labelText: 'Last Name',
                onChanged: (value) {},
                onSubmitted: (value) => _genderFocus.requestFocus(),
                focusNode: _lastNameFocus,
                textInputAction: TextInputAction.next,
                isPasswordField: false,
                controller: _lastNameController,
              ),
              const SizedBox(height: 10),
              CustomInputTransparent(
                hintText: 'Enter your gender',
                // labelText: 'Gender',
                onChanged: (value) {},
                onSubmitted: (value) => _passwordFocus.requestFocus(),
                focusNode: _genderFocus,
                textInputAction: TextInputAction.next,
                isPasswordField: false,
                controller: _genderController,
              ),
              const SizedBox(height: 10),
              CustomInputTransparent(
                hintText: 'Enter your password',
                // labelText: 'Password',
                onChanged: (value) {},
                onSubmitted: (value) => _confirmPasswordFocus.requestFocus(),
                focusNode: _passwordFocus,
                textInputAction: TextInputAction.next,
                isPasswordField: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 10),
              CustomInputTransparent(
                hintText: 'Confirm your password',
                // labelText: 'Confirm Password',
                onChanged: (value) {},
                onSubmitted: (value) => _confirmPasswordFocus.unfocus(),
                focusNode: _confirmPasswordFocus,
                textInputAction: TextInputAction.done,
                isPasswordField: true,
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 50.0),
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => Scaffold(),
                    ));
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
