import 'package:flutter/material.dart';

import '../theme/brand_theme.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    required this.title,
    required this.children,
    this.icon,
    this.highlight = false,
    super.key,
  });

  final String title;
  final List<Widget> children;
  final IconData? icon;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final color = highlight
        ? BrandColors.warning(context)
        : BrandColors.card(context);
    final borderColor = highlight
        ? const Color(0xFFE5A542)
        : BrandColors.line(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: highlight
                      ? const Color(0xFFB45309)
                      : Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: BrandColors.text(context),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}
