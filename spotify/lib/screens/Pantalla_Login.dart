import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Pantalla_Principal.dart';

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final _formulario = GlobalKey<FormState>();
  bool _ocultarClave = true;

  void _entrar() {
    if (!_formulario.currentState!.validate()) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const PantallaPrincipal()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const verde = Color(0xFF1DB954);

    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  key: _formulario,
                  child: AutofillGroup(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Center(
                          child: FaIcon(
                            FontAwesomeIcons.spotify,
                            color: verde,
                            size: 64,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Inicia sesión en Spotify',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const SizedBox(height: 32),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Correo electrónico',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (valor) {
                            if (valor != 'spotify@gmail.com') {
                              return 'Correo incorrecto';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: _ocultarClave,
                          onFieldSubmitted: (_) => _entrar(),
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              tooltip: _ocultarClave
                                  ? 'Mostrar contraseña'
                                  : 'Ocultar contraseña',
                              icon: Icon(
                                _ocultarClave
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () => setState(
                                () => _ocultarClave = !_ocultarClave,
                              ),
                            ),
                          ),
                          validator: (valor) {
                            if (valor != '123456') {
                              return 'Contraseña incorrecta';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        FilledButton(
                          onPressed: _entrar,
                          style: FilledButton.styleFrom(
                            backgroundColor: verde,
                            foregroundColor: Colors.black,
                            minimumSize: const Size(0, 48),
                          ),
                          child: const Text('Iniciar sesión'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
