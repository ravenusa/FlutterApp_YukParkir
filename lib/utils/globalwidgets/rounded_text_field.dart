import 'package:flutter/material.dart';
import 'package:yukparkir/utils/components/constans.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  const RoundedTextField({super.key, required this.hintText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Constans.padding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyText1,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
