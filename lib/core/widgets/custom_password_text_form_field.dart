import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    required this.controller,
    required this.hint,
    required this.prefixIconPath,
  });

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hint;
  final String prefixIconPath;

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodySmall,
      obscuringCharacter: '★',
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          color: AppColorsLight.black[20],
          iconSize: 20,
          onPressed: _togglePasswordVisibility,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.padding_16,
            right: AppSizes.padding_4,
          ),
          child: Image.asset(
            widget.prefixIconPath,
            width: AppSizes.icon_20,
            height: AppSizes.icon_20,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: AppSizes.icon_20,
          minHeight: AppSizes.icon_20,
        ),
      ),
    );
  }
}
