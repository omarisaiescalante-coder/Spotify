import 'package:flutter/material.dart';

import 'screens/Pantalla_Inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegacion Flutter',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (final plataforma in TargetPlatform.values)
              plataforma: const _TransicionSuave(),
          },
        ),
      ),
      home: const PantallaInicio(),
    );
  }
}

class _TransicionSuave extends PageTransitionsBuilder {
  const _TransicionSuave();

  @override
  Duration get transitionDuration => const Duration(milliseconds: 260);

  @override
  Duration get reverseTransitionDuration => transitionDuration;

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (MediaQuery.disableAnimationsOf(context)) return child;

    final progreso = animation.drive(CurveTween(curve: Curves.easeOutCubic));
    return FadeTransition(
      opacity: progreso,
      child: SlideTransition(
        position: progreso.drive(
          Tween(begin: const Offset(0, 0.015), end: Offset.zero),
        ),
        child: child,
      ),
    );
  }
}
