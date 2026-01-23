import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive_helper.dart';
import '../../data/models/skill_model.dart';
import '../../data/portfolio_data/portfolio_data.dart';
import '../common/section_title.dart';
import '../common/glass_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final crossAxisCount = ResponsiveHelper.getGridCrossAxisCount(context);

    return Container(
      padding: ResponsiveHelper.getScreenPadding(context).copyWith(
        top: AppConstants.spacingXXXL,
        bottom: AppConstants.spacingXXXL,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.backgroundDarkSecondary
            : AppColors.backgroundLightSecondary,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            children: [
              const SectionTitle(
                title: 'Technical Skills',
                subtitle: 'Technologies and tools I work with',
              ).animate().fadeIn().slideY(begin: -0.2),
              const SizedBox(height: AppConstants.spacingXXL),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: AppConstants.spacingLG,
                  crossAxisSpacing: AppConstants.spacingLG,
                  childAspectRatio: 1.1,
                ),
                itemCount: PortfolioData.skillCategories.length,
                itemBuilder: (context, index) {
                  return _SkillCategoryCard(
                    category: PortfolioData.skillCategories[index],
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillCategoryCard extends StatelessWidget {
  final SkillCategory category;
  final int index;

  const _SkillCategoryCard({
    required this.category,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppConstants.spacingSM),
                decoration: BoxDecoration(
                  color: category.color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                ),
                child: Icon(
                  category.icon,
                  color: category.color,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppConstants.spacingMD),
              Expanded(
                child: Text(
                  category.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacingMD),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: AppConstants.spacingSM,
                runSpacing: AppConstants.spacingSM,
                children: category.skills.map((skill) {
                  return _SkillItem(
                    skill: skill,
                    color: category.color,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: 100 * index)).slideY(begin: 0.1);
  }
}

class _SkillItem extends StatefulWidget {
  final Skill skill;
  final Color color;

  const _SkillItem({
    required this.skill,
    required this.color,
  });

  @override
  State<_SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<_SkillItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: AppConstants.shortAnimation,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacingMD,
          vertical: AppConstants.spacingSM,
        ),
        decoration: BoxDecoration(
          color: _isHovered
              ? widget.color.withValues(alpha: 0.2)
              : (isDark
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.black.withValues(alpha: 0.03)),
          borderRadius: BorderRadius.circular(AppConstants.radiusSM),
          border: Border.all(
            color: _isHovered
                ? widget.color.withValues(alpha: 0.5)
                : (isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.05)),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.skill.name,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: _isHovered
                        ? widget.color
                        : (isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight),
                    fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                  ),
            ),
            if (_isHovered) ...[
              const SizedBox(width: AppConstants.spacingSM),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.grey.withValues(alpha: 0.3),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: widget.skill.proficiency,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: widget.color,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
