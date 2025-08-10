import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/theme/app_colors.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final bool asAppBar;
  final Widget? trailing;
  final double elevation;
  final double? toolbarHeight;

  const CommonHeader({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.backgroundColor = Colors.white,
    this.asAppBar = true,
    this.trailing,
    this.elevation = 0,
    this.toolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);

  Widget _buildHeaderContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Image.asset('assets/icons/back.png', width: 20, height: 20),
              onPressed: onBackPressed,
            ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  color: AppColors.darkColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          if (trailing != null) trailing!,
          if (showBackButton && trailing == null)
            const Opacity(
              opacity: 0,
              child: IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (asAppBar) {
      return AppBar(
        backgroundColor: backgroundColor,
        elevation: elevation,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: toolbarHeight,
        title: _buildHeaderContent(),
      );
    }

    return _buildHeaderContent();
  }
}
