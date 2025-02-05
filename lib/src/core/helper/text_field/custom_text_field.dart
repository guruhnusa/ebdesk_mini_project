import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Color filled;

  final bool isBorder;
  final TextInputType keyboardType;
  final bool isReadOnly;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool isRequired;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final VoidCallback? suffixOnPressed;
  final List<TextInputFormatter>? inputFormatters;
  final String? error;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.filled = Colors.transparent,
    this.isBorder = true,
    this.keyboardType = TextInputType.text,
    this.isReadOnly = false,
    this.onChanged,
    this.obscureText = false,
    this.isRequired = false,
    this.validator,
    this.maxLength,
    this.textInputAction,
    this.suffixOnPressed,
    this.inputFormatters,
    this.error,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPassword = true;
  bool isFilled = false;

  @override
  void initState() {
    super.initState();

    isFilled = widget.controller.text.isNotEmpty;

    widget.controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    final newIsFilled = widget.controller.text.isNotEmpty;
    if (newIsFilled != isFilled) {
      setState(() {
        isFilled = newIsFilled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.isReadOnly,
      textInputAction: widget.textInputAction,
      maxLength: widget.maxLength,
      validator: widget.validator,
      obscureText: widget.obscureText ? isPassword : false,
      obscuringCharacter: '•',
      inputFormatters: widget.inputFormatters,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      onChanged: (text) {
        setState(() {
          isFilled = text.isNotEmpty;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(text);
        }
      },
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.label,
        suffixIcon: widget.obscureText
            ? GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, right: 14, bottom: 8),
                  child: Icon(
                    isPassword ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                  ),
                ),
                onTap: () {
                  setState(
                    () {
                      isPassword = !isPassword;
                    },
                  );
                },
              )
            : null,
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
