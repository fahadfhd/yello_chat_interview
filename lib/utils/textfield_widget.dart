import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final Color borderColor;
  final InputBorder? border;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final String? error;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final VoidCallback? onTap;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.enabled = true,
    this.validator,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.words,
    this.obscureText = false,
    this.borderColor = const Color(0xFFDEE7FF),
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onEditingComplete,
    this.onChanged,
    this.maxLines,
    this.error,
    this.textStyle,
    this.hintStyle,
    this.contentPadding,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textCapitalization: textCapitalization,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      onTap: onTap,
      enableInteractiveSelection: false,
      style: textStyle ??
          GoogleFonts.rubik(
            color: const Color(0xFF8391B5),
          ),
      maxLines: obscureText ? 1 : maxLines,
      decoration:  InputDecoration(
          fillColor: Colors.white ,
          filled: true,
          labelText: labelText,
          hintText: hintText,
          hintStyle: hintStyle,
          contentPadding: contentPadding,
          labelStyle: GoogleFonts.rubik(
            color: const Color(0xFF8391B5),
          ),
          border: border ?? outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: border ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Color(0xff00A293),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          errorText: error,
          errorStyle: GoogleFonts.inter(fontSize: 12),
          errorMaxLines: 3),
      validator: validator,
    );
  }

  InputBorder? outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(5),
    );
  }
}
