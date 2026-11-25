import 'package:flutter/material.dart';

import '../theme/brand_theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/theme_toggle_button.dart';
import 'questionnaire_screen.dart';

class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({super.key});

  static const routeName = '/aviso';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Uso seguro'),
        actions: const [ThemeToggleButton(), SizedBox(width: 8)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: BrandColors.info(context),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: BrandColors.line(context)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.verified_user_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 36,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Antes da triagem, alguns combinados importantes.',
                          style: textTheme.headlineSmall?.copyWith(
                            color: BrandColors.text(context),
                            fontWeight: FontWeight.w900,
                            height: 1.12,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'O app ajuda você a organizar sinais e sintomas, mas a decisão clínica continua sendo de um profissional de saúde.',
                          style: textTheme.bodyLarge?.copyWith(
                            color: BrandColors.secondaryText(context),
                            height: 1.38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const _NoticeItem(
                    icon: Icons.rule_outlined,
                    title: 'Resultado orientativo',
                    text:
                        'A classificação é calculada somente a partir das suas respostas.',
                  ),
                  const _NoticeItem(
                    icon: Icons.medical_services_outlined,
                    title: 'Não substitui consulta',
                    text:
                        'A avaliação profissional, o exame físico e a investigação complementar continuam indispensáveis quando houver dúvida ou sinal importante.',
                  ),
                  const _NoticeItem(
                    icon: Icons.priority_high_rounded,
                    title: 'Sinais de atenção',
                    text:
                        'Feridas, inchaço intenso, dor forte, sangramento ou alterações relevantes na pele devem ser avaliados por profissional de saúde.',
                  ),
                  const _NoticeItem(
                    icon: Icons.lock_outline,
                    title: 'Privacidade',
                    text:
                        'A triagem funciona localmente e usa as respostas apenas para montar o resultado.',
                  ),
                  const SizedBox(height: 28),
                  PrimaryButton(
                    label: 'Entendi e quero continuar',
                    icon: Icons.check_circle_outline,
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const QuestionnaireScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NoticeItem extends StatelessWidget {
  const _NoticeItem({
    required this.icon,
    required this.title,
    required this.text,
  });

  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: BrandColors.card(context),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrandColors.line(context)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: BrandColors.text(context),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.35,
                    color: BrandColors.secondaryText(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
