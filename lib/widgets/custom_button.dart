import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'custom_image_view.dart';

/**
 * A customizable button component that supports multiple variants including
 * icon-only, text-only, and text with icon combinations.
 * 
 * @param onPressed - Callback function when button is pressed
 * @param text - Optional text content for the button
 * @param leadingIcon - Optional leading icon path
 * @param trailingIcon - Optional trailing icon path
 * @param variant - Button style variant (elevated, text, outlined, icon)
 * @param backgroundColor - Custom background color
 * @param textColor - Custom text color
 * @param borderRadius - Custom border radius
 * @param padding - Custom padding
 * @param height - Fixed height for the button
 * @param width - Fixed width for the button
 * @param fontSize - Custom font size for text
 * @param fontWeight - Custom font weight for text
 * @param isEnabled - Whether the button is enabled
 */
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.leadingIcon,
    this.trailingIcon,
    this.variant,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.isEnabled,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? text;
  final String? leadingIcon;
  final String? trailingIcon;
  final CustomButtonVariant? variant;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    final effectiveVariant = variant ?? CustomButtonVariant.elevated;
    final effectiveEnabled = isEnabled ?? true;
    final effectivePadding =
        padding ?? EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h);
    final effectiveBorderRadius = borderRadius ?? 8.h;
    final effectiveFontSize = fontSize ?? 14.fSize;
    final effectiveFontWeight = fontWeight ?? FontWeight.w500;

    Widget buttonChild = _buildButtonContent();

    // Handle different button variants
    switch (effectiveVariant) {
      case CustomButtonVariant.elevated:
        return SizedBox(
          height: height,
          width: width,
          child: ElevatedButton(
            onPressed: effectiveEnabled ? onPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? Color(0xFFFFFFFF),
              foregroundColor: textColor ?? Color(0xFF0D1814),
              padding: effectivePadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(effectiveBorderRadius),
              ),
              elevation: 0,
            ),
            child: buttonChild,
          ),
        );

      case CustomButtonVariant.text:
        return SizedBox(
          height: height,
          width: width,
          child: TextButton(
            onPressed: effectiveEnabled ? onPressed : null,
            style: TextButton.styleFrom(
              foregroundColor: textColor ?? Color(0xFF427662),
              padding: effectivePadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(effectiveBorderRadius),
              ),
            ),
            child: buttonChild,
          ),
        );

      case CustomButtonVariant.outlined:
        return SizedBox(
          height: height,
          width: width,
          child: OutlinedButton(
            onPressed: effectiveEnabled ? onPressed : null,
            style: OutlinedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor ?? Color(0xFF0D1814),
              padding: effectivePadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(effectiveBorderRadius),
              ),
            ),
            child: buttonChild,
          ),
        );

      case CustomButtonVariant.icon:
        return SizedBox(
          height: height ?? 44.h,
          width: width ?? 44.h,
          child: Material(
            color: backgroundColor ?? Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            child: InkWell(
              onTap: effectiveEnabled ? onPressed : null,
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
              child: Container(
                padding: effectivePadding,
                child: buttonChild,
              ),
            ),
          ),
        );
    }
  }

  Widget _buildButtonContent() {
    final hasLeadingIcon = leadingIcon != null;
    final hasTrailingIcon = trailingIcon != null;
    final hasText = text != null && text!.isNotEmpty;

    // Icon-only button
    if (!hasText && (hasLeadingIcon || hasTrailingIcon)) {
      return CustomImageView(
        imagePath: leadingIcon ?? trailingIcon!,
        height: 20.h,
        width: 20.h,
      );
    }

    // Text-only button
    if (hasText && !hasLeadingIcon && !hasTrailingIcon) {
      return Text(
        text!,
        style: TextStyle(
          fontSize: fontSize ?? 14.fSize,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontFamily: 'DM Sans',
        ),
      );
    }

    // Text with icons
    if (hasText && (hasLeadingIcon || hasTrailingIcon)) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasLeadingIcon) ...[
            CustomImageView(
              imagePath: leadingIcon!,
              height: 16.h,
              width: 16.h,
            ),
            SizedBox(width: 8.h),
          ],
          Text(
            text!,
            style: TextStyle(
              fontSize: fontSize ?? 14.fSize,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontFamily: 'DM Sans',
            ),
          ),
          if (hasTrailingIcon) ...[
            SizedBox(width: 8.h),
            CustomImageView(
              imagePath: trailingIcon!,
              height: 16.h,
              width: 16.h,
            ),
          ],
        ],
      );
    }

    // Fallback - empty container
    return Container();
  }
}

enum CustomButtonVariant {
  elevated,
  text,
  outlined,
  icon,
}
