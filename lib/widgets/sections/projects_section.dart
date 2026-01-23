import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive_helper.dart';
import '../../data/models/project_model.dart';
import '../../data/portfolio_data/portfolio_data.dart';
import '../common/section_title.dart';
import '../common/glass_card.dart';
import '../common/skill_chip.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  ProjectCategory? _selectedCategory;

  List<Project> get _filteredProjects {
    if (_selectedCategory == null) {
      return PortfolioData.projects;
    }
    return PortfolioData.projects
        .where((p) => p.category == _selectedCategory)
        .toList();
  }

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
                title: 'Featured Projects',
                subtitle: 'A showcase of my best work and contributions',
              ).animate().fadeIn().slideY(begin: -0.2),
              const SizedBox(height: AppConstants.spacingXL),
              _buildCategoryFilter(context, isDark),
              const SizedBox(height: AppConstants.spacingXL),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: AppConstants.spacingLG,
                  crossAxisSpacing: AppConstants.spacingLG,
                  childAspectRatio: 0.85,
                ),
                itemCount: _filteredProjects.length,
                itemBuilder: (context, index) {
                  return _ProjectCard(
                    project: _filteredProjects[index],
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

  Widget _buildCategoryFilter(BuildContext context, bool isDark) {
    final categories = [
      {'label': 'All', 'value': null},
      {'label': 'Full Stack', 'value': ProjectCategory.fullStack},
      {'label': 'Mobile', 'value': ProjectCategory.mobile},
      {'label': 'Web', 'value': ProjectCategory.web},
    ];

    return Wrap(
      spacing: AppConstants.spacingMD,
      runSpacing: AppConstants.spacingSM,
      alignment: WrapAlignment.center,
      children: categories.map((category) {
        final isSelected = _selectedCategory == category['value'];

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedCategory = category['value'] as ProjectCategory?;
            });
          },
          child: AnimatedContainer(
            duration: AppConstants.shortAnimation,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacingMD,
              vertical: AppConstants.spacingSM,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : (isDark
                      ? Colors.white.withValues(alpha: 0.05)
                      : Colors.black.withValues(alpha: 0.03)),
              borderRadius: BorderRadius.circular(AppConstants.radiusSM),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : (isDark
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.black.withValues(alpha: 0.05)),
              ),
            ),
            child: Text(
              category['label'] as String,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    ).animate().fadeIn(delay: 100.ms);
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final int index;

  const _ProjectCard({
    required this.project,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with gradient
          Container(
            padding: const EdgeInsets.all(AppConstants.spacingMD),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _getGradientColors(),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppConstants.radiusLG - 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        project.name,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    _buildProjectTypeChip(context),
                  ],
                ),
                const SizedBox(height: AppConstants.spacingXS),
                Text(
                  project.subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.spacingMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (project.role != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.spacingSM,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        project.role!,
                        style:
                            Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    const SizedBox(height: AppConstants.spacingSM),
                  ],
                  Expanded(
                    child: Text(
                      project.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                            height: 1.5,
                          ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacingSM),
                  Wrap(
                    spacing: AppConstants.spacingXS,
                    runSpacing: AppConstants.spacingXS,
                    children: project.technologies
                        .take(4)
                        .map(
                          (tech) => SkillChip(
                            label: tech,
                            isSmall: true,
                          ),
                        )
                        .toList(),
                  ),
                  if (project.userCount != null) ...[
                    const SizedBox(height: AppConstants.spacingSM),
                    Row(
                      children: [
                        const Icon(
                          Icons.people_outline,
                          size: 14,
                          color: AppColors.success,
                        ),
                        const SizedBox(width: AppConstants.spacingXS),
                        Text(
                          '${project.userCount} users',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: AppColors.success,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          // Footer with links
          Container(
            padding: const EdgeInsets.all(AppConstants.spacingMD),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.black.withValues(alpha: 0.05),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (project.playStoreUrl != null)
                  _buildLinkButton(
                    context,
                    FontAwesomeIcons.googlePlay,
                    project.playStoreUrl!,
                    'Play Store',
                  ),
                if (project.websiteUrl != null)
                  _buildLinkButton(
                    context,
                    FontAwesomeIcons.globe,
                    project.websiteUrl!,
                    'Website',
                  ),
                if (project.githubUrl != null)
                  _buildLinkButton(
                    context,
                    FontAwesomeIcons.github,
                    project.githubUrl!,
                    'GitHub',
                  ),
                _buildDetailsButton(context),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: 100 * index)).slideY(begin: 0.1);
  }

  List<Color> _getGradientColors() {
    switch (project.category) {
      case ProjectCategory.mobile:
        return [AppColors.flutterColor, AppColors.primary];
      case ProjectCategory.web:
        return [AppColors.laravelColor, AppColors.accent];
      case ProjectCategory.fullStack:
        return AppColors.primaryGradient;
    }
  }

  Widget _buildProjectTypeChip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingSM,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        project.type == ProjectType.individual ? 'Solo' : 'Team',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildLinkButton(
    BuildContext context,
    IconData icon,
    String url,
    String tooltip,
  ) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        onPressed: () => _launchUrl(url),
        icon: FaIcon(
          icon,
          size: 16,
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
        ),
        splashRadius: 20,
      ),
    );
  }

  Widget _buildDetailsButton(BuildContext context) {
    return TextButton(
      onPressed: () => _showProjectDetails(context),
      child: const Text('Details'),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showProjectDetails(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 600),
          padding: const EdgeInsets.all(AppConstants.spacingXL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      project.name,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              Text(
                project.subtitle,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
              const SizedBox(height: AppConstants.spacingMD),
              const Divider(),
              const SizedBox(height: AppConstants.spacingMD),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1.6,
                            ),
                      ),
                      const SizedBox(height: AppConstants.spacingLG),
                      Text(
                        'Key Features',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: AppConstants.spacingSM),
                      ...project.features.map(
                        (feature) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppConstants.spacingSM,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: AppColors.success,
                                size: 18,
                              ),
                              const SizedBox(width: AppConstants.spacingSM),
                              Expanded(
                                child: Text(
                                  feature,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppConstants.spacingLG),
                      Text(
                        'Technologies',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: AppConstants.spacingSM),
                      Wrap(
                        spacing: AppConstants.spacingSM,
                        runSpacing: AppConstants.spacingSM,
                        children: project.technologies
                            .map(
                              (tech) => SkillChip(label: tech),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
