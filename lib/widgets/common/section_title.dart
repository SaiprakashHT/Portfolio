import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import 'gradient_text.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool centered;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.centered = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        GradientText(
          text: title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          textAlign: centered ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: AppConstants.spacingSM),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: AppColors.primaryGradient,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppConstants.spacingMD),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: centered ? TextAlign.center : TextAlign.start,
          ),
        ],
      ],
    );
  }
}
