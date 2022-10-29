import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? obscure;
  final String? label;
  const CustomTextField({this.controller, this.obscure, this.label, Key? key})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obsc = widget.obscure ?? false;
  late String labels = widget.label ?? "form";
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obsc,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.blue, width: 1.6),
        ),
        labelText: labels,
        labelStyle: const TextStyle(
          color: Colors.blueGrey,
        ),
        suffixIcon: const Icon(Icons.abc),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.blue, width: 1.6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.blue, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.red, width: 1.6),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.white10, width: 1.6),
        ),
      ),
    );
  }
}
