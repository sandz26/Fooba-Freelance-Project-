import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputTransparent extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  TextEditingController? controller;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  final Widget? prefix;
  final Widget? suffix;
  CustomInputTransparent(
      {required this.hintText,
        required this.onChanged,
        required this.onSubmitted,
        required this.focusNode,
        required this.textInputAction,
        required this.isPasswordField,
        this.controller,
        this.prefix,
        this.suffix});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField;
    return Container(
      padding: EdgeInsets.only(left: 2, right: 2, top: 8, bottom: 0),
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: TextField(
        obscureText: _isPasswordField,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        controller: controller,
        textInputAction: textInputAction,
/*        validator: (val) {
            return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val!)
                ? null
                : "Please Enter Correct Email";
          },*/
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: prefix,
          suffixIcon: suffix,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          hintStyle: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 13.5,
                color: Colors.grey,
                letterSpacing: 0,
                fontWeight: FontWeight.w500),
          ),
          contentPadding: EdgeInsets.only(top: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.0)),
            borderRadius: BorderRadius.circular(36),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffED7D32)),
            borderRadius: BorderRadius.circular(360),
          ),
        ),
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13.5),
      ),
    );
  }
}