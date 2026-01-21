import 'package:flutter/material.dart';
import 'package:the9thhour/core/common/style/global_text_style.dart';

class PreferenceTextField extends StatelessWidget {
  final String label;
  final String initialValue;

  const PreferenceTextField({
    super.key,
    required this.label,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GlobalTextStyle.heading2.copyWith(fontSize: 14)),
        const SizedBox(height: 6),
        TextField(
          controller: TextEditingController(text: initialValue),
          style: GlobalTextStyle.bodyText.copyWith(fontSize: 14,fontWeight: FontWeight.w100),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 248, 201, 220),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
