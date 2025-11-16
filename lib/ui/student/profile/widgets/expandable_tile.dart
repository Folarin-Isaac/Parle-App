import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class ExpandableTile extends StatefulWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
  final Widget child;
  final Duration animationDuration;
  final Curve animationCurve;

  const ExpandableTile({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
  });

  @override
  State<ExpandableTile> createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5, // 180 degrees (0.5 * 2π)
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: widget.animationCurve,
    ));

    if (widget.isExpanded) {
      _rotationController.forward();
    }
  }

  @override
  void didUpdateWidget(ExpandableTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _rotationController.forward();
      } else {
        _rotationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Column(
      children: [
        // Header with animated background
        AnimatedContainer(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          decoration: BoxDecoration(
            color: widget.isExpanded
                ? (isDarkMode ? AppColors.darkPrimary : AppColors.yellow1)
                : (isDarkMode ? AppColors.darkCardBackground : const Color(0xFFFFF8E1)),
            borderRadius: widget.isExpanded
                ? BorderRadius.only(
              topLeft: Radius.circular(AppSizes.radius8),
              topRight: Radius.circular(AppSizes.radius8),
            )
                : BorderRadius.circular(AppSizes.radius8),
          ),
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: widget.isExpanded
                ? BorderRadius.only(
              topLeft: Radius.circular(AppSizes.radius8),
              topRight: Radius.circular(AppSizes.radius8),
            )
                : BorderRadius.circular(AppSizes.radius8),
            child: Container(
              padding: EdgeInsets.all(AppSizes.size20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Animated text color
                  AnimatedDefaultTextStyle(
                    duration: widget.animationDuration,
                    curve: widget.animationCurve,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: widget.isExpanded
                          ? (isDarkMode ? Colors.black : Colors.white)
                          : theme.textTheme.titleLarge?.color,
                      fontWeight: FontWeight.w500,
                    ) ?? const TextStyle(),
                    child: Text(widget.title),
                  ),
                  // Animated rotating arrow
                  RotationTransition(
                    turns: _rotationAnimation,
                    child: AnimatedContainer(
                      duration: widget.animationDuration,
                      curve: widget.animationCurve,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: widget.isExpanded
                            ? (isDarkMode ? Colors.black : Colors.black)
                            : theme.iconTheme.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Animated expanding content
        AnimatedSize(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          child: widget.isExpanded
              ? Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppSizes.size20),
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.darkCardBackground : Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppSizes.radius8),
                bottomRight: Radius.circular(AppSizes.radius8),
              ),
            ),
            child: widget.child,
          )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}