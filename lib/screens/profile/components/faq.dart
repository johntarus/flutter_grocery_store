import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sg_grocery/theme/app_colors.dart';

import '../../../components/custom_header.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  String? selectedCategory;
  final TextEditingController questionController = TextEditingController();
  final List<Map<String, String>> faqs = [
    {
      'question': 'Where do you Deliver?',
      'answer':
          'We deliver to multiple locations across the city. Please check our delivery areas on the website or app.',
    },
    {
      'question': 'How can I order at SG Grocery?',
      'answer':
          'Placing an order is very simple. Just register on the SG Grocery website/mobile application, pick your choice of products, and proceed to checkout or call customer care at 1800-123-1947.',
    },
    {
      'question': 'How do I know at what time I will receive my Delivery?',
      'answer':
          'You will receive an estimated delivery time during checkout and via order confirmation.',
    },
    {
      'question': 'What is minimum order value?',
      'answer': 'Our minimum order value is KES 500.',
    },
    {
      'question': 'What if I want to return something?',
      'answer':
          'You can request a return within 24 hours of delivery. Terms and conditions apply.',
    },
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeGreen,
      appBar: CommonHeader(
        title: 'FAQ',
        titleColor: AppColors.white,
        backgroundColor: AppColors.themeGreen,
        titleAlignment: TextAlign.start,
        bottomPadding: 22,
        backIconAsset: 'assets/icons/white_back.png',
        onBackPressed: () => Navigator.of(context).pop(),
        showBackButton: true,
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              _buildCategoryDropdown(),
              const SizedBox(height: 16),
              ..._buildFaqList(),
              const SizedBox(height: 24),
              Text(
                'Not Listed Your Question/Query?',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              _buildQuestionInput(),
              const SizedBox(height: 24),
              _buildSubmitButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      hint: Text(
        'Select Category',
        style: GoogleFonts.montserrat(
          color: AppColors.darkColor,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      items: [
        'Orders',
        'Delivery',
        'Payments',
        'Returns',
      ].map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
      onChanged: (value) {
        setState(() {
          selectedCategory = value;
        });
      },
    );
  }

  List<Widget> _buildFaqList() {
    return List.generate(faqs.length, (index) {
      final faq = faqs[index];
      final isExpanded = expandedIndex == index;

      return Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isExpanded ? Colors.green.withOpacity(0.05) : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          title: Text(
            faq['question']!,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF707070),
            ),
          ),
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              expandedIndex = expanded ? index : null;
            });
          },
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                faq['answer']!,
                style: GoogleFonts.montserrat(
                  color: Color(0xFF707070),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildQuestionInput() {
    return TextField(
      controller: questionController,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: 'Write Your Question/Query Here',
        hintStyle: const TextStyle(
          color: Color(0xFF898989),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle submit action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeGreen,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          'Submit',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
