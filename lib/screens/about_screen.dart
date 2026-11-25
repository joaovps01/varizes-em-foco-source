import 'package:flutter/material.dart';

import '../theme/brand_theme.dart';
import '../widgets/theme_toggle_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const routeName = '/sobre';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
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
                      color: BrandColors.card(context),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: BrandColors.line(context)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 36,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          BrandCopy.appName,
                          style: textTheme.headlineMedium?.copyWith(
                            color: BrandColors.text(context),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          BrandCopy.descriptor,
                          style: textTheme.titleMedium?.copyWith(
                            color: BrandColors.secondaryText(context),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const _AboutBlock(
                    title: 'Objetivo',
                    text:
                        'Ajudar pacientes adultos a organizar sinais e sintomas compatíveis com varizes e doença venosa crônica antes de buscar orientação profissional.',
                  ),
                  const _AboutBlock(
                    title: 'Classificação utilizada',
                    text:
                        'O resultado usa o componente clínico da classificação CEAP, de C0 a C6, com sufixo A para ausência de sintomas ou S para presença de sintomas.',
                  ),
                  const _AboutBlock(
                    title: 'Funcionamento local',
                    text:
                        'As respostas são processadas no próprio dispositivo por uma árvore de decisão. O app não precisa de conexão para realizar a triagem.',
                  ),
                  const _AboutBlock(
                    title: 'Limitação',
                    text:
                        'O aplicativo não fornece diagnóstico definitivo e não substitui consulta, exame físico ou conduta individualizada por profissional de saúde.',
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

class _AboutBlock extends StatelessWidget {
  const _AboutBlock({required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: BrandColors.card(context),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrandColors.line(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: BrandColors.isDark(context)
                  ? const Color(0xFFBDECE7)
                  : BrandColors.primaryDark,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              height: 1.42,
              color: BrandColors.secondaryText(context),
            ),
          ),
        ],
      ),
    );
  }
}
