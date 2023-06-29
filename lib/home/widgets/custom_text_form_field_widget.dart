import 'package:flutter/material.dart';

class CustomTextFormF extends StatelessWidget {
  const CustomTextFormF({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: TextFormField(
        keyboardType: TextInputType.number,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          hintText: hint,
        ),
      ),
    );
  }
}
