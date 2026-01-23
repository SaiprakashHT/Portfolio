import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';

class SocialButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String? tooltip;
  final double size;
  final Color? color;

  const SocialButton({
    super.key,
    required this.icon,
    required this.url,
    this.tooltip,
    this.size = 44,
    this.color,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Tooltip(
      message: widget.tooltip ?? '',
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: AppConstants.shortAnimation,
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.primary
                : (isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.05)),
            borderRadius: BorderRadius.circular(AppConstants.radiusSM),
            border: Border.all(
              color: _isHovered
                  ? AppColors.primary
                  : (isDark
                      ? Colors.white.withValues(alpha: 0.2)
                      : Colors.black.withValues(alpha: 0.1)),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _launchUrl,
              borderRadius: BorderRadius.circular(AppConstants.radiusSM),
              child: Center(
                child: Icon(
                  widget.icon,
                  color: _isHovered
                      ? Colors.white
                      : (widget.color ??
                          (isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight)),
                  size: widget.size * 0.45,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
