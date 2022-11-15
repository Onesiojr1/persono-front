import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String label;
  final String errorMessage;
  final String hintText;
  final int minlength;
  final TextEditingController controller;

  const FormInput(
      {super.key,
      required this.label,
      required this.errorMessage,
      required this.hintText,
      required this.minlength,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              controller: controller,
              validator: (String? value) {
                return (value != null && value.length <= minlength)
                    ? errorMessage
                    : null;
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hintText,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  contentPadding: const EdgeInsets.all(8)),
            ),
          ),
        ],
      ),
    );
  }
}
