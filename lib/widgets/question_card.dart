import 'package:flutter/material.dart';

import '../models/answer_model.dart';
import '../models/question_model.dart';
import '../theme/brand_theme.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required this.question,
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final QuestionModel question;
  final AnswerValue? selected;
  final ValueChanged<AnswerValue> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: BrandColors.selected(context),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: BrandColors.line(context)),
          ),
          child: Text(
            question.shortTitle,
            style: textTheme.labelLarge?.copyWith(
              color: BrandColors.isDark(context)
                  ? const Color(0xFFBDECE7)
                  : BrandColors.primaryDark,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          question.text,
          style: textTheme.headlineSmall?.copyWith(
            color: BrandColors.text(context),
            fontWeight: FontWeight.w800,
            height: 1.22,
          ),
        ),
        const SizedBox(height: 24),
        ...question.options.map(
          (option) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _AnswerTile(
              label: option.label,
              selected: selected == option.value,
              onTap: () => onChanged(option.value),
            ),
          ),
        ),
      ],
    );
  }
}

class _AnswerTile extends StatelessWidget {
  const _AnswerTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: selected
          ? BrandColors.selected(context)
          : BrandColors.card(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: selected ? BrandColors.primary : BrandColors.line(context),
          width: selected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            children: [
              Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: selected
                    ? scheme.primary
                    : BrandColors.secondaryText(context),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: BrandColors.text(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
