import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive_helper.dart';
import '../../data/portfolio_data/portfolio_data.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTapped;
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isMobile) {
      return _buildMobileNav(context, isDark);
    }
    return _buildDesktopNav(context, isDark);
  }

  Widget _buildDesktopNav(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingXL,
        vertical: AppConstants.spacingMD,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.backgroundDark.withValues(alpha: 0.9)
            : AppColors.backgroundLight.withValues(alpha: 0.9),
        border: Border(
          bottom: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          _buildLogo(context),
          // Nav Items
          Row(
            children: [
              ...List.generate(
                PortfolioData.navItems.length,
                (index) => _buildNavItem(
                  context,
                  PortfolioData.navItems[index]['label'] as String,
                  index,
                  isDark,
                ),
              ),
              const SizedBox(width: AppConstants.spacingMD),
              _buildThemeToggle(isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNav(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingMD,
        vertical: AppConstants.spacingSM,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.backgroundDark.withValues(alpha: 0.95)
            : AppColors.backgroundLight.withValues(alpha: 0.95),
        border: Border(
          bottom: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(context, isSmall: true),
          Row(
            children: [
              _buildThemeToggle(isDark, isSmall: true),
              const SizedBox(width: AppConstants.spacingSM),
              _buildMenuButton(context, isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context, {bool isSmall = false}) {
    return GestureDetector(
      onTap: () => widget.onItemTapped(0),
      child: Row(
        children: [
          Container(
            width: isSmall ? 36 : 44,
            height: isSmall ? 36 : 44,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.primaryGradient,
              ),
              borderRadius: BorderRadius.circular(AppConstants.radiusSM),
            ),
            child: Center(
              child: Text(
                'S',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmall ? 18 : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppConstants.spacingSM),
          if (!isSmall)
            Text(
              'Saiprakash',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, String label, int index, bool isDark) {
    final isSelected = widget.currentIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacingSM),
      child: TextButton(
        onPressed: () => widget.onItemTapped(index),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingMD,
            vertical: AppConstants.spacingSM,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppColors.primary
                    : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: AppConstants.shortAnimation,
              height: 2,
              width: isSelected ? 20 : 0,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle(bool isDark, {bool isSmall = false}) {
    return GestureDetector(
      onTap: widget.onThemeToggle,
      child: AnimatedContainer(
        duration: AppConstants.shortAnimation,
        width: isSmall ? 36 : 44,
        height: isSmall ? 36 : 44,
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(AppConstants.radiusSM),
        ),
        child: Center(
          child: Icon(
            widget.isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
            size: isSmall ? 20 : 22,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, bool isDark) {
    return GestureDetector(
      onTap: () => _showMobileMenu(context, isDark),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(AppConstants.radiusSM),
        ),
        child: Icon(
          Icons.menu,
          color: isDark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
          size: 20,
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppConstants.spacingLG),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppConstants.radiusXL),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.3)
                    : Colors.black.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppConstants.spacingLG),
            ...List.generate(
              PortfolioData.navItems.length,
              (index) => _buildMobileMenuItem(
                context,
                PortfolioData.navItems[index]['label'] as String,
                PortfolioData.navItems[index]['icon'] as IconData,
                index,
                isDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenuItem(
    BuildContext context,
    String label,
    IconData icon,
    int index,
    bool isDark,
  ) {
    final isSelected = widget.currentIndex == index;

    return ListTile(
      onTap: () {
        Navigator.pop(context);
        widget.onItemTapped(index);
      },
      leading: Icon(
        icon,
        color: isSelected
            ? AppColors.primary
            : (isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight),
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? AppColors.primary
              : (isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight),
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
      trailing: isSelected
          ? Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
  }
}
