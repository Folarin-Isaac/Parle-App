import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
  final String svgAssetPath;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double? size;
  final double? iconSize;
  final Color? iconColor; // Optional, for tinting SVG

  const SocialLoginButton({
    super.key,
    required this.svgAssetPath,
    required this.backgroundColor,
    required this.onPressed,
    this.size,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final buttonSize = size ?? 56.0;
    final buttonIconSize = iconSize ?? 24.0;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(buttonSize / 2),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            svgAssetPath,
            width: buttonIconSize,
            height: buttonIconSize,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                : null,
          ),
        ),
      ),
    );
  }
}