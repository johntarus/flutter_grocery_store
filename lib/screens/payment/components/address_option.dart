import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class AddressOption extends StatelessWidget {
  final String title;
  final String address;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  const AddressOption({
    super.key,
    required this.title,
    required this.address,
    required this.icon,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(title),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: Row(
          children: [
            Radio<String>(
              value: title,
              groupValue: isSelected ? title : '',
              onChanged: (value) => onSelected(value!),
              activeColor: AppColors.themeGreen,
            ),
            const SizedBox(width: 12),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      address,
                      style: GoogleFonts.montserrat(
                        color: AppColors.darkColor,
                        height: 1.82,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(Icons.edit_outlined, color: Colors.grey, size: 18),
                const SizedBox(width: 8),
                Icon(Icons.delete_outline, color: Colors.grey, size: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
