import 'package:flutter/material.dart';
import '../../utils/app_color.dart';

enum MyInputFieldVariant { primary, secondary, wrong, password }

class MyInputField extends StatefulWidget {
  final Color? color;
  final double? width;
  final MyInputFieldVariant variant;

  const MyInputField({
    super.key,
    this.color,
    this.width,
    this.variant = MyInputFieldVariant.primary,
  });

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  bool _obscureText = true;

  Color getBackgroundColor() {
    switch (widget.variant) {
      case MyInputFieldVariant.secondary:
        return AppColor.secondary;
      case MyInputFieldVariant.wrong:
        return Colors.red;
      case MyInputFieldVariant.primary:
      case MyInputFieldVariant.password:
        return widget.color ?? AppColor.primary;
    }
  }

  Color getTextColor() {
    return AppColor.black1;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: TextFormField(
        obscureText: widget.variant == MyInputFieldVariant.password ? _obscureText : false,
        decoration: InputDecoration(
          hintText: widget.variant == MyInputFieldVariant.password
              ? 'Masukkan password Anda'
              : 'Masukkan email Anda',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primary, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primary, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: widget.variant == MyInputFieldVariant.password
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColor.black1,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
        keyboardType: widget.variant == MyInputFieldVariant.password
            ? TextInputType.text
            : TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.variant == MyInputFieldVariant.password
                ? 'Password tidak boleh kosong'
                : 'Email tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }
}
