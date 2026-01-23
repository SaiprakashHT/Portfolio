import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive_helper.dart';
import '../../data/portfolio_data/portfolio_data.dart';
import '../common/section_title.dart';
import '../common/glass_card.dart';
import '../common/animated_counter.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      padding: ResponsiveHelper.getScreenPadding(context).copyWith(
        top: AppConstants.spacingXXXL,
        bottom: AppConstants.spacingXXXL,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            children: [
              const SectionTitle(
                title: 'About Me',
                subtitle: 'Get to know more about me and my journey',
              ).animate().fadeIn().slideY(begin: -0.2),
              const SizedBox(height: AppConstants.spacingXXL),
              isMobile
                  ? _buildMobileLayout(context)
                  : _buildDesktopLayout(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _buildSummaryCard(context),
        ),
        const SizedBox(width: AppConstants.spacingXL),
        Expanded(
          flex: 2,
          child: _buildStatsAndHighlights(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildSummaryCard(context),
        const SizedBox(height: AppConstants.spacingXL),
        _buildStatsAndHighlights(context),
      ],
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassCard(
      enableHover: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppConstants.spacingMD),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.primaryGradient,
                  ),
                  borderRadius: BorderRadius.circular(AppConstants.radiusMD),
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppConstants.spacingMD),
              Text(
                'Professional Summary',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacingLG),
          Text(
            PortfolioData.professionalSummary,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.8,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
          ),
          const SizedBox(height: AppConstants.spacingLG),
          Wrap(
            spacing: AppConstants.spacingMD,
            runSpacing: AppConstants.spacingMD,
            children: [
              _buildInfoChip(
                context,
                Icons.email_outlined,
                AppConstants.email,
              ),
              _buildInfoChip(
                context,
                Icons.phone_outlined,
                AppConstants.phone,
              ),
              _buildInfoChip(
                context,
                Icons.location_on_outlined,
                'Hyderabad, India',
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1);
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingMD,
        vertical: AppConstants.spacingSM,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.black.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(AppConstants.radiusSM),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 16,
          ),
          const SizedBox(width: AppConstants.spacingSM),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildStatsAndHighlights(BuildContext context) {
    return Column(
      children: [
        _buildStatsCard(context),
        const SizedBox(height: AppConstants.spacingLG),
        _buildEducationCard(context),
      ],
    );
  }

  Widget _buildStatsCard(BuildContext context) {
    return GlassCard(
      enableHover: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Stats',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppConstants.spacingLG),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: AppConstants.spacingMD,
            crossAxisSpacing: AppConstants.spacingMD,
            children: PortfolioData.stats
                .map(
                  (stat) => AnimatedCounter(
                    value: stat['value']!,
                    label: stat['label']!,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1);
  }

  Widget _buildEducationCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final education = PortfolioData.education;

    return GlassCard(
      enableHover: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppConstants.spacingSM),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                ),
                child: const Icon(
                  Icons.school_outlined,
                  color: AppColors.secondary,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppConstants.spacingMD),
              Expanded(
                child: Text(
                  'Education',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacingMD),
          Text(
            education.degree,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: AppConstants.spacingXS),
          Text(
            education.institution,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
          ),
          const SizedBox(height: AppConstants.spacingXS),
          Row(
            children: [
              Text(
                education.graduationDate,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
              if (education.cgpa != null) ...[
                const SizedBox(width: AppConstants.spacingMD),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacingSM,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'CGPA: ${education.cgpa}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1);
  }
}
