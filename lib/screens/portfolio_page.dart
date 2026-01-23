import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/constants/app_constants.dart';
import '../widgets/common/nav_bar.dart';
import '../widgets/common/footer.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/skills_section.dart';
import '../widgets/sections/experience_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/contact_section.dart';

class PortfolioPage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const PortfolioPage({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentSection = 0;

  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    int newSection = 0;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final key = _sectionKeys[i];
      if (key.currentContext != null) {
        final box = key.currentContext!.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        if (position.dy <= 100) {
          newSection = i;
        }
      }
    }

    if (newSection != _currentSection) {
      setState(() {
        _currentSection = newSection;
      });
    }
  }

  void _scrollToSection(int index) {
    final key = _sectionKeys[index];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: AppConstants.mediumAnimation,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: Stack(
        children: [
          // Background Gradient Orbs
          _buildBackgroundOrbs(isDark),
          // Main Content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Sticky NavBar
              SliverAppBar(
                pinned: true,
                floating: false,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                expandedHeight: 0,
                toolbarHeight: 70,
                flexibleSpace: NavBar(
                  currentIndex: _currentSection,
                  onItemTapped: _scrollToSection,
                  onThemeToggle: widget.onThemeToggle,
                  isDarkMode: widget.isDarkMode,
                ),
              ),
              // Sections
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // Hero Section
                    Container(
                      key: _sectionKeys[0],
                      child: HeroSection(
                        onContactTap: () => _scrollToSection(5),
                        onProjectsTap: () => _scrollToSection(4),
                      ),
                    ),
                    // About Section
                    Container(
                      key: _sectionKeys[1],
                      child: const AboutSection(),
                    ),
                    // Skills Section
                    Container(
                      key: _sectionKeys[2],
                      child: const SkillsSection(),
                    ),
                    // Experience Section
                    Container(
                      key: _sectionKeys[3],
                      child: const ExperienceSection(),
                    ),
                    // Projects Section
                    Container(
                      key: _sectionKeys[4],
                      child: const ProjectsSection(),
                    ),
                    // Contact Section
                    Container(
                      key: _sectionKeys[5],
                      child: const ContactSection(),
                    ),
                    // Footer
                    const Footer(),
                  ],
                ),
              ),
            ],
          ),
          // Scroll to Top Button
          _buildScrollToTopButton(),
        ],
      ),
    );
  }

  Widget _buildBackgroundOrbs(bool isDark) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: isDark ? 0.15 : 0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 500,
              left: -150,
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.secondary.withValues(alpha: isDark ? 0.1 : 0.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 300,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.accent.withValues(alpha: isDark ? 0.1 : 0.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollToTopButton() {
    return AnimatedPositioned(
      duration: AppConstants.shortAnimation,
      bottom: _scrollController.hasClients && _scrollController.offset > 500
          ? AppConstants.spacingXL
          : -60,
      right: AppConstants.spacingXL,
      child: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: AppConstants.mediumAnimation,
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.keyboard_arrow_up,
          color: Colors.white,
        ),
      ),
    );
  }
}
