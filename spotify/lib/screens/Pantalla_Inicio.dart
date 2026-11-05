import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pantalla_principal.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  double _opacidad = 1;

  @override
  void initState() {
    super.initState();
    _iniciar();
  }

  Future<void> _iniciar() async {
    // Mantiene visible el logo.
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    // Comienza a desvanecerlo.
    setState(() => _opacidad = 0);
  }

  void _abrirPrincipal() {
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const PantallaPrincipal(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacidad,
          duration: const Duration(milliseconds: 800),
          onEnd: _abrirPrincipal,
          child: const FaIcon(
            FontAwesomeIcons.spotify,
            color: Color(0xFF1DB954),
            size: 120,
          ),
        ),
      ),
    );
  }
}