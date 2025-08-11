import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final String backIconAsset;
  final VoidCallback? onBackPressed;
  final bool showBackButton;
  final Widget? trailing;
  final TextAlign titleAlignment;

  const CommonHeader({
    super.key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    required this.backIconAsset,
    this.onBackPressed,
    this.showBackButton = true,
    this.trailing,
    this.titleAlignment = TextAlign.left,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: SafeArea(bottom: false, child: _buildHeaderContent()),
    );
  }

  Widget _buildHeaderContent() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          if (showBackButton)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Image.asset(backIconAsset, height: 25),
                onPressed: onBackPressed,
              ),
            ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: titleAlignment,
                style: GoogleFonts.montserrat(
                  color: titleColor,
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
}
