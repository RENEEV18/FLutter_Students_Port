import 'package:flutter/material.dart';

class ListDetails extends StatelessWidget {
  const ListDetails({
    super.key,
    required this.controller,
    required this.text,
    required this.icons,
    this.formValidator,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final Widget text;
  final Icon icons;
  final TextInputType keyboardType;
  final String? Function(String?)? formValidator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: TextFormField(
        validator: formValidator,
        keyboardType: keyboardType,
        controller: controller,
        style: const TextStyle(fontSize: 20, color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label: text,
          prefixIcon: icons,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
