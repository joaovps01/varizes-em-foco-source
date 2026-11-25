import 'package:flutter/material.dart';

import '../theme/brand_theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/theme_toggle_button.dart';
import 'about_screen.dart';
import 'disclaimer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(gradient: BrandGradients.heroFor(context)),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const _BrandMark(),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                BrandCopy.appName,
                                style: textTheme.titleLarge?.copyWith(
                                  color: BrandColors.text(context),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                BrandCopy.descriptor,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: BrandColors.secondaryText(context),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const ThemeToggleButton(),
                        const SizedBox(width: 8),
                        IconButton.filledTonal(
                          tooltip: 'Sobre',
                          onPressed: () => Navigator.pushNamed(
                            context,
                            AboutScreen.routeName,
                          ),
                          icon: const Icon(Icons.info_outline),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Coloque os sinais das suas pernas em foco.',
                      style: textTheme.displaySmall?.copyWith(
                        color: BrandColors.text(context),
                        fontWeight: FontWeight.w900,
                        height: 1.04,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Uma triagem rápida, local e orientativa para organizar sintomas, sinais visíveis e possíveis estágios clínicos relacionados a varizes.',
                      style: textTheme.titleMedium?.copyWith(
                        color: BrandColors.secondaryText(context),
                        height: 1.42,
                      ),
                    ),
                    const SizedBox(height: 26),
                    const _TrustStrip(),
                    const SizedBox(height: 18),
                    const _HowItWorks(),
                    const SizedBox(height: 28),
                    PrimaryButton(
                      label: 'Começar triagem',
                      icon: Icons.arrow_forward,
                      onPressed: () => Navigator.pushNamed(
                        context,
                        DisclaimerScreen.routeName,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Leva cerca de 2 minutos. Não é diagnóstico médico.',
                      style: textTheme.bodyMedium?.copyWith(
                        color: BrandColors.secondaryText(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 34),
                    const _PpgFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PpgFooter extends StatelessWidget {
  const _PpgFooter();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: BrandColors.isDark(context) ? 0.82 : 0.68,
        child: Image.asset(
          'assets/ppg/ppg_footer.png',
          height: 38,
          fit: BoxFit.contain,
          semanticLabel: 'Programa de Pós-Graduação',
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: BrandColors.isDark(context)
            ? const Color(0xFF7ED4CD)
            : BrandColors.primaryDark,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.water_drop_outlined,
        color: BrandColors.isDark(context)
            ? const Color(0xFF08201F)
            : Colors.white,
        size: 30,
      ),
    );
  }
}

class _TrustStrip extends StatelessWidget {
  const _TrustStrip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: BrandColors.card(context).withValues(alpha: 0.86),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrandColors.line(context)),
      ),
      child: const Column(
        children: [
          _TrustItem(
            icon: Icons.psychology_alt_outlined,
            label: 'Linguagem simples para pacientes',
          ),
          SizedBox(height: 10),
          _TrustItem(
            icon: Icons.lock_outline,
            label: 'Respostas processadas no dispositivo',
          ),
          SizedBox(height: 10),
          _TrustItem(
            icon: Icons.health_and_safety_outlined,
            label: 'Orientação para buscar avaliação quando necessário',
          ),
        ],
      ),
    );
  }
}

class _TrustItem extends StatelessWidget {
  const _TrustItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: BrandColors.text(context),
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}

class _HowItWorks extends StatelessWidget {
  const _HowItWorks();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: BrandColors.subtleCard(context),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrandColors.line(context)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StepRow(number: '1', text: 'Você responde perguntas objetivas.'),
          SizedBox(height: 10),
          _StepRow(
            number: '2',
            text: 'O app organiza os sinais por gravidade.',
          ),
          SizedBox(height: 10),
          _StepRow(
            number: '3',
            text: 'Você recebe um resumo para se orientar.',
          ),
        ],
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({required this.number, required this.text});

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 26,
          height: 26,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: BrandColors.text(context),
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}
