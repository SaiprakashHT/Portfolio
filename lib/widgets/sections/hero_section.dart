import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive_helper.dart';
import '../common/gradient_text.dart';
import '../common/gradient_button.dart';
import '../common/social_button.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;

  const HeroSection({
    super.key,
    required this.onContactTap,
    required this.onProjectsTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    final screenHeight = ResponsiveHelper.getScreenHeight(context);

    return Container(
      constraints: BoxConstraints(
        minHeight: screenHeight - 80,
      ),
      padding: ResponsiveHelper.getScreenPadding(context).copyWith(
        top: AppConstants.spacingXXXL,
        bottom: AppConstants.spacingXXXL,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: isDesktop
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context, isMobile),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: _buildContent(context, false),
        ),
        const SizedBox(width: AppConstants.spacingXXL),
        Expanded(
          flex: 2,
          child: _buildAvatar(context, false),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvatar(context, true),
        const SizedBox(height: AppConstants.spacingXL),
        _buildContent(context, true),
      ],
    );
  }

  Widget _buildContent(BuildContext context, bool isCentered) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Greeting
        Text(
          'Hello, I\'m',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
        ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.2),
        const SizedBox(height: AppConstants.spacingSM),

        // Name
        GradientText(
          text: AppConstants.name,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2),
        const SizedBox(height: AppConstants.spacingMD),

        // Animated Role
        SizedBox(
          height: 40,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'Full Stack Flutter Developer',
                textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                textAlign: isCentered ? TextAlign.center : TextAlign.start,
                speed: const Duration(milliseconds: 80),
              ),
              TypewriterAnimatedText(
                'Mobile App Developer',
                textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                textAlign: isCentered ? TextAlign.center : TextAlign.start,
                speed: const Duration(milliseconds: 80),
              ),
              TypewriterAnimatedText(
                'Laravel Developer',
                textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                textAlign: isCentered ? TextAlign.center : TextAlign.start,
                speed: const Duration(milliseconds: 80),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 300.ms),
        const SizedBox(height: AppConstants.spacingLG),

        // Description
        Text(
          AppConstants.tagline,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
              ),
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
        ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2),
        const SizedBox(height: AppConstants.spacingXL),

        // Location
        Row(
          mainAxisSize: isCentered ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment:
              isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.primary,
              size: 20,
            ),
            const SizedBox(width: AppConstants.spacingSM),
            Text(
              AppConstants.location,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ).animate().fadeIn(delay: 500.ms),
        const SizedBox(height: AppConstants.spacingXL),

        // Buttons
        Wrap(
          alignment: isCentered ? WrapAlignment.center : WrapAlignment.start,
          spacing: AppConstants.spacingMD,
          runSpacing: AppConstants.spacingMD,
          children: [
            GradientButton(
              text: 'View Projects',
              icon: Icons.folder_outlined,
              onPressed: onProjectsTap,
            ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2),
            GradientButton(
              text: 'Contact Me',
              icon: Icons.mail_outline,
              onPressed: onContactTap,
              isOutlined: true,
            ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.2),
          ],
        ),
        const SizedBox(height: AppConstants.spacingXL),

        // Social Links
        Row(
          mainAxisSize: isCentered ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment:
              isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            SocialButton(
              icon: FontAwesomeIcons.linkedin,
              url: AppConstants.linkedInUrl,
              tooltip: 'LinkedIn',
            ).animate().fadeIn(delay: 800.ms).scale(),
            const SizedBox(width: AppConstants.spacingMD),
            SocialButton(
              icon: FontAwesomeIcons.github,
              url: AppConstants.githubUrl,
              tooltip: 'GitHub',
            ).animate().fadeIn(delay: 900.ms).scale(),
            const SizedBox(width: AppConstants.spacingMD),
            SocialButton(
              icon: FontAwesomeIcons.envelope,
              url: 'mailto:${AppConstants.email}',
              tooltip: 'Email',
            ).animate().fadeIn(delay: 1000.ms).scale(),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context, bool isMobile) {
    final size = isMobile ? 200.0 : 350.0;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.3),
            AppColors.secondary.withValues(alpha: 0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 60,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Ring
          Container(
            width: size - 20,
            height: size - 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.5),
                width: 2,
              ),
            ),
          ),
          // Inner Circle with Initial
          Container(
            width: size - 60,
            height: size - 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                'SP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 60 : 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Floating Elements
          ..._buildFloatingElements(size),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).scale(begin: const Offset(0.8, 0.8));
  }

  List<Widget> _buildFloatingElements(double size) {
    final icons = [
      FontAwesomeIcons.flutter,
      FontAwesomeIcons.laravel,
      FontAwesomeIcons.database,
      FontAwesomeIcons.mobile,
    ];

    final positions = [
      Offset(-size / 2 + 20, -20),
      Offset(size / 2 - 20, -40),
      Offset(-size / 2 + 30, 60),
      Offset(size / 2 - 30, 80),
    ];

    final colors = [
      AppColors.flutterColor,
      AppColors.laravelColor,
      AppColors.mysqlColor,
      AppColors.primary,
    ];

    return List.generate(
      4,
      (index) => Positioned(
        left: size / 2 + positions[index].dx - 20,
        top: size / 2 + positions[index].dy - 20,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colors[index],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: colors[index].withValues(alpha: 0.5),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: FaIcon(
              icons[index],
              color: Colors.white,
              size: 18,
            ),
          ),
        )
            .animate(
              onPlay: (controller) => controller.repeat(reverse: true),
            )
            .moveY(
              begin: -5,
              end: 5,
              duration: Duration(milliseconds: 1500 + index * 200),
              curve: Curves.easeInOut,
            ),
      ),
    );
  }
}
