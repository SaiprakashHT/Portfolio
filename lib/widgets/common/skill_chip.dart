import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';

class SkillChip extends StatelessWidget {
  final String label;
  final Color? color;
  final bool isSmall;

  const SkillChip({
    super.key,
    required this.label,
    this.color,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final chipColor = color ?? AppColors.primary;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? AppConstants.spacingSM : AppConstants.spacingMD,
        vertical: isSmall ? AppConstants.spacingXS : AppConstants.spacingSM,
      ),
      decoration: BoxDecoration(
        color: chipColor.withValues(alpha: isDark ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(
          isSmall ? AppConstants.radiusSM : AppConstants.radiusMD,
        ),
        border: Border.all(
          color: chipColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: chipColor,
          fontSize: isSmall ? 11 : 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
