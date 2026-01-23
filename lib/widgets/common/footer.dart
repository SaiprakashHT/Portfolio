import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive_helper.dart';
import 'social_button.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingXL,
        vertical: isMobile ? AppConstants.spacingLG : AppConstants.spacingXL,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.backgroundDarkSecondary
            : AppColors.backgroundLightSecondary,
        border: Border(
          top: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: isMobile
              ? _buildMobileFooter(context, isDark)
              : _buildDesktopFooter(context, isDark),
        ),
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: AppColors.primaryGradient,
                    ),
                    borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                  ),
                  child: const Center(
                    child: Text(
                      'S',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.spacingSM),
                Text(
                  'Saiprakash H T',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacingSM),
            Text(
              'Full Stack Flutter Developer',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
            ),
          ],
        ),
        Row(
          children: [
            SocialButton(
              icon: FontAwesomeIcons.linkedin,
              url: AppConstants.linkedInUrl,
              tooltip: 'LinkedIn',
              size: 36,
            ),
            const SizedBox(width: AppConstants.spacingMD),
            SocialButton(
              icon: FontAwesomeIcons.github,
              url: AppConstants.githubUrl,
              tooltip: 'GitHub',
              size: 36,
            ),
            const SizedBox(width: AppConstants.spacingMD),
            SocialButton(
              icon: FontAwesomeIcons.envelope,
              url: 'mailto:${AppConstants.email}',
              tooltip: 'Email',
              size: 36,
            ),
          ],
        ),
        Text(
          '© ${DateTime.now().year} Saiprakash H T. All rights reserved.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context, bool isDark) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(
              icon: FontAwesomeIcons.linkedin,
              url: AppConstants.linkedInUrl,
              tooltip: 'LinkedIn',
              size: 36,
            ),
            const SizedBox(width: AppConstants.spacingMD),
            SocialButton(
              icon: FontAwesomeIcons.github,
              url: AppConstants.githubUrl,
              tooltip: 'GitHub',
              size: 36,
            ),
            const SizedBox(width: AppConstants.spacingMD),
            SocialButton(
              icon: FontAwesomeIcons.envelope,
              url: 'mailto:${AppConstants.email}',
              tooltip: 'Email',
              size: 36,
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacingMD),
        Text(
          '© ${DateTime.now().year} Saiprakash H T',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
        ),
        const SizedBox(height: AppConstants.spacingXS),
        Text(
          'Built with Flutter',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.primary,
              ),
        ),
      ],
    );
  }
}
