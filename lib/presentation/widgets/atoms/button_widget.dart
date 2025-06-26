import 'package:flutter/material.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text_style.dart';

enum ButtonColorVariant {
  primary,
  secondary,
  outline,
  danger,
  dangerOutline,
  disable,
}

enum ButtonSizeVariant { small, medium, large }

class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final double? width;
  final ButtonColorVariant buttonColorVariant;
  final ButtonSizeVariant buttonSizeVariant;
  final Widget? icon;

  const MyButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.width,
    this.buttonColorVariant = ButtonColorVariant.primary,
    this.buttonSizeVariant = ButtonSizeVariant.small,
    this.icon,
  });

  EdgeInsets getPaddingButton() {
    switch (buttonSizeVariant) {
      case ButtonSizeVariant.small:
        return const EdgeInsets.symmetric(vertical: 14, horizontal: 8);
      case ButtonSizeVariant.medium:
        return const EdgeInsets.symmetric(vertical: 18, horizontal: 12);
      case ButtonSizeVariant.large:
        return const EdgeInsets.symmetric(vertical: 18, horizontal: 12);
    }
  }

  Color getBackgroundColor() {
    switch (buttonColorVariant) {
      case ButtonColorVariant.primary:
        return AppColor.primary;
      case ButtonColorVariant.secondary:
        return AppColor.secondary;
      case ButtonColorVariant.danger:
        return AppColor.danger;
      case ButtonColorVariant.outline:
        return AppColor.white1;
      case ButtonColorVariant.disable:
        return AppColor.disable;
      case ButtonColorVariant.dangerOutline:
        return AppColor.white1;
    }
  }

  Color getTextColor() {
    switch (buttonColorVariant) {
      case ButtonColorVariant.primary:
        return AppColor.white1;
      case ButtonColorVariant.secondary:
        return AppColor.gray1;
      case ButtonColorVariant.danger:
        return AppColor.white1;
      case ButtonColorVariant.outline:
        return AppColor.black1;
      case ButtonColorVariant.disable:
        return AppColor.white1;
      case ButtonColorVariant.dangerOutline:
        return AppColor.danger;
    }
  }

  TextStyle getTextStyle() {
    switch (buttonSizeVariant) {
      case (ButtonSizeVariant.small):
        return AppTextStyle.small;
      case (ButtonSizeVariant.medium):
        return AppTextStyle.medium;
      case (ButtonSizeVariant.large):
        return AppTextStyle.large;
    }
  }

  @override
  Widget build(BuildContext context) {
    double minWidth;
    switch (buttonSizeVariant) {
      case ButtonSizeVariant.small:
        minWidth = 100;
        break;
      case ButtonSizeVariant.medium:
        minWidth = 120;
        break;
      case ButtonSizeVariant.large:
        minWidth = double.infinity;
        break;
    }
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: minWidth),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: getBackgroundColor(),
            foregroundColor: getTextColor(),
            padding: getPaddingButton(),
            side:
                buttonColorVariant == ButtonColorVariant.dangerOutline ||
                    buttonColorVariant == ButtonColorVariant.outline
                ? BorderSide(color: getTextColor(), width: 1.5)
                : BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon!,
                    const SizedBox(width: 14),
                    Text(
                      label,
                      style: getTextStyle().copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : Text(
                  label,
                  style: getTextStyle().copyWith(fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
