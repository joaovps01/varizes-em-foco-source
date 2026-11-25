import 'package:flutter/material.dart';

import '../theme/brand_theme.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    required this.current,
    required this.total,
    super.key,
  });

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    final value = current / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Pergunta $current de $total',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: BrandColors.secondaryText(context),
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Text(
              '${(value * 100).round()}%',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: BrandColors.isDark(context)
                    ? const Color(0xFFBDECE7)
                    : BrandColors.primaryDark,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            color: BrandColors.isDark(context)
                ? const Color(0xFF7ED4CD)
                : BrandColors.primary,
            backgroundColor: BrandColors.line(context),
          ),
        ),
      ],
    );
  }
}
