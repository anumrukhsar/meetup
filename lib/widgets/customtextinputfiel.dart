
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextInputField extends StatelessWidget {
  final tag;
  final controller;
  final hint;
  final err;
  final inputAction;
  final String? Function(String) validationErr;

  const CustomTextInputField({
    this.tag,
    this.controller,
    this.hint,
    this.err,
    this.inputAction,
    required this.validationErr,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: tag==2,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.mukta(
              textStyle: TextStyle(fontSize: 16, color: Colors.black)),
        ),
        validator: (value) => validationErr(value!),
        maxLines: 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        textInputAction: inputAction);
  }



  }
