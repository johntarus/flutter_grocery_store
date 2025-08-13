import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final String? backIconAsset;
  final VoidCallback? onBackPressed;
  final bool? showBackButton;
  final Widget? trailing;
  final TextAlign? titleAlignment;
  final BorderRadius? borderRadius;
  final Widget? bottomWidget;
  final double additionalHeight;
  final double leftPadding;
  final double bottomPadding;

  const CommonHeader({
    super.key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.backIconAsset,
    this.onBackPressed,
    this.showBackButton,
    this.trailing,
    this.titleAlignment,
    this.borderRadius,
    this.bottomWidget,
    this.additionalHeight = 0.0,
    this.leftPadding = 0.0,
    this.bottomPadding = 0.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(80 + additionalHeight);

  bool _shouldShowBackButton() {
    if (showBackButton != null) return showBackButton!;
    return backIconAsset != null;
  }

  @override
  Widget build(BuildContext context) {
    final shouldShowBack = _shouldShowBackButton();

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Container(
        color: backgroundColor,
        child: SafeArea(
          bottom: false,
          child: _buildHeaderContent(context, shouldShowBack),
        ),
      ),
    );
  }

  Widget _buildHeaderContent(BuildContext context, bool shouldShowBack) {
    return Column(
      mainAxisSize: bottomWidget != null ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: bottomPadding, left: leftPadding),
          child: Row(
            children: [
              if (shouldShowBack)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: backIconAsset != null
                        ? Image.asset(backIconAsset!, height: 25)
                        : const Icon(Icons.arrow_back, size: 25),
                    onPressed:
                        onBackPressed ??
                        () {
                          Navigator.maybePop(context);
                        },
                  ),
                ),
              Expanded(
                child: Align(
                  alignment: titleAlignment == TextAlign.center
                      ? Alignment.center
                      : Alignment.centerLeft,
                  child: Text(
                    title,
                    textAlign: titleAlignment ?? TextAlign.start,
                    style: GoogleFonts.montserrat(
                      color: titleColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              if (trailing != null) trailing!,
              if (shouldShowBack && trailing == null)
                const Opacity(
                  opacity: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: null,
                  ),
                ),
            ],
          ),
        ),
        if (bottomWidget != null) const Spacer(),
        if (bottomWidget != null) bottomWidget!,
      ],
    );
  }
}
