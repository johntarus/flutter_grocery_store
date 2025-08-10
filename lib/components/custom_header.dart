import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final String backIconAsset;
  final VoidCallback? onBackPressed;
  final bool showBackButton;
  final bool showCurvedBottom;
  final Widget? trailing;
  final TextAlign titleAlignment;

  const CommonHeader({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    required this.backIconAsset,
    this.onBackPressed,
    this.showBackButton = true,
    this.showCurvedBottom = false,
    this.trailing,
    this.titleAlignment = TextAlign.left,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(90); // taller for more padding

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: showCurvedBottom
            ? const BorderRadius.vertical(bottom: Radius.circular(20))
            : BorderRadius.zero,
      ),
      child: SafeArea(bottom: false, child: _buildHeaderContent()),
    );
  }

  Widget _buildHeaderContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
      // main vertical space
      child: Row(
        children: [
          if (showBackButton)
            Padding(
              padding: const EdgeInsets.only(top: 4.0), // fine-tune back icon
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Image.asset(backIconAsset, width: 30, height: 30),
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
