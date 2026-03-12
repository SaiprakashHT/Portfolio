import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive_helper.dart';
import '../../data/models/experience_model.dart';
import '../../data/portfolio_data/portfolio_data.dart';
import '../common/section_title.dart';
import '../common/glass_card.dart';
import '../common/skill_chip.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                title: 'Work Experience',
                subtitle: 'My professional journey and achievements',
              ).animate().fadeIn().slideY(begin: -0.2),
              const SizedBox(height: AppConstants.spacingXXL),
              ...PortfolioData.experiences.asMap().entries.map(
                (entry) => _ExperienceCard(
                  experience: entry.value,
                  index: entry.key,
                  isLast: entry.key == PortfolioData.experiences.length - 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final Experience experience;
  final int index;
  final bool isLast;

  const _ExperienceCard({
    required this.experience,
    required this.index,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveHelper.isMobile(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMobile) ...[
          SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  experience.startDate,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                if (experience.isCurrent)
                  Container(
                    margin: const EdgeInsets.only(top: AppConstants.spacingXS),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.spacingSM,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Present',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.success,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppConstants.spacingLG),
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: experience.isCurrent
                      ? AppColors.primary
                      : (isDark ? AppColors.cardDark : AppColors.cardLight),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary,
                    width: 3,
                  ),
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withValues(alpha: 0.3),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: AppConstants.spacingLG),
        ],
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: isLast ? 0 : AppConstants.spacingXL,
            ),
            child: GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isMobile) ...[
                    Row(
                      children: [
                        Text(
                          experience.duration,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: AppColors.primary,
                                  ),
                        ),
                        if (experience.isCurrent) ...[
                          const SizedBox(width: AppConstants.spacingSM),
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
                              'Current',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppColors.success,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacingSM),
                  ],
                  Text(
                    experience.position,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacingXS),
                  Row(
                    children: [
                      const Icon(
                        Icons.business_outlined,
                        size: 16,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(width: AppConstants.spacingXS),
                      Expanded(
                        child: Text(
                          experience.company,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.secondary,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacingXS),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight,
                      ),
                      const SizedBox(width: AppConstants.spacingXS),
                      Text(
                        experience.location,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: isDark
                                  ? AppColors.textTertiaryDark
                                  : AppColors.textTertiaryLight,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacingMD),
                  const Divider(),
                  const SizedBox(height: AppConstants.spacingMD),
                  Text(
                    'Key Responsibilities',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacingSM),
                  ...experience.responsibilities.take(5).map(
                        (responsibility) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppConstants.spacingSM,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: AppConstants.spacingMD),
                              Expanded(
                                child: Text(
                                  responsibility,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        height: 1.6,
                                        color: isDark
                                            ? AppColors.textSecondaryDark
                                            : AppColors.textSecondaryLight,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  const SizedBox(height: AppConstants.spacingMD),
                  Text(
                    'Technologies Used',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: AppConstants.spacingSM),
                  Wrap(
                    spacing: AppConstants.spacingSM,
                    runSpacing: AppConstants.spacingSM,
                    children: experience.technologies
                        .map(
                          (tech) => SkillChip(
                            label: tech,
                            isSmall: true,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: Duration(milliseconds: 200 * index)).slideX(begin: 0.1),
          ),
        ),
      ],
    );
  }
}
