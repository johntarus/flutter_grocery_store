import 'package:flutter/material.dart';

class ProfileMenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });
}

class ProfileMenu extends StatelessWidget {
  final List<ProfileMenuItem> menuItems;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const ProfileMenu({
    super.key,
    required this.menuItems,
    this.backgroundColor = const Color(0xFFF8F9FA),
    this.borderRadius = 30,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: menuItems
              .map(
                (item) => _buildMenuItem(
                  icon: item.icon,
                  title: item.title,
                  onTap: item.onTap,
                  isLogout: item.isLogout,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isLogout
                ? Colors.red.withOpacity(0.1)
                : const Color(0xFF4CAF50).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: isLogout ? Colors.red : const Color(0xFF4CAF50),
            size: 22,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isLogout ? Colors.red : Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[400],
          size: 16,
        ),
      ),
    );
  }
}
