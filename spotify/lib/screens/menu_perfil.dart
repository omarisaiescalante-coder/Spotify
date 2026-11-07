import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:spotify/screens/Pantalla_Inicio.dart';

import 'Pantalla_Login.dart';

const nombrePerfil = 'Omar Escalante';
const sombraMenuPerfil = Color(0xB8000000);
const _fondo = Color(0xFF121212);
const _verde = Color(0xFF1ED760);
const _textoSecundario = Color(0xFFB3B3B3);

class BotonPerfil extends StatelessWidget {
  const BotonPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Abrir menú de perfil',
      padding: EdgeInsets.zero,
      onPressed: () => Scaffold.of(context).openDrawer(),
      icon: const _AvatarPerfil(radio: 17),
    );
  }
}

class _AvatarPerfil extends StatelessWidget {
  const _AvatarPerfil({required this.radio, this.color = _verde});

  final double radio;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radio,
      backgroundColor: color,
      foregroundColor: _fondo,
      child: Text(
        nombrePerfil[0],
        style: TextStyle(fontSize: radio, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class MenuPerfil extends StatelessWidget {
  const MenuPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Drawer(
        width: math.min(MediaQuery.sizeOf(context).width * 0.9, 400.0),
        shape: const RoundedRectangleBorder(),
        backgroundColor: const Color(0xFF202020),
        surfaceTintColor: Colors.transparent,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 20),
            children: [
              Card(
                margin: EdgeInsets.zero,
                color: const Color(0xFF282828),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      leading: const _AvatarPerfil(radio: 25),
                      title: const Text(
                        nombrePerfil,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      subtitle: const Text(
                        'Ver perfil',
                        style: TextStyle(color: _textoSecundario),
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFF444444)),
                    ListTile(
                      onTap: () {},
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      leading: const CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.white12,
                        child: Icon(
                          Icons.add,
                          size: 18,
                          color: _textoSecundario,
                        ),
                      ),
                      title: const Text(
                        'Agregar cuenta',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.show_chart, color: Colors.white),
                title: const Text('Estadísticas de reproducción'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.history, color: Colors.white),
                title: const Text('Recientes'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.campaign_outlined,
                  color: Colors.white,
                ),
                title: const Text('Tus avisos'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
                title: const Text('Configuración y privacidad'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 68,
                      child: InkWell(
                        onTap: () {},
                        child: const Column(
                          children: [
                            CircleAvatar(
                              radius: 29,
                              backgroundColor: _textoSecundario,
                              child: CircleAvatar(
                                radius: 27,
                                backgroundColor: Color(0xFF202020),
                                child: _AvatarPerfil(
                                  radio: 25,
                                  color: Color(0xFF198754),
                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            Text('Actividad', textAlign: TextAlign.center),
                            Text(
                              'Activar',
                              style: TextStyle(color: _textoSecundario),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 68,
                      child: InkWell(
                        onTap: () {},
                        child: const Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xFF282828),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Invitar a amigos',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: const Row(
                  children: [
                    Text(
                      'Mensajes',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
                trailing: IconButton(
                  tooltip: 'Nuevo mensaje',
                  onPressed: () {},
                  icon: const Icon(Icons.edit_square, color: _textoSecundario),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 14),
                child: Text(
                  'Comparte lo que te gusta con tus personas favoritas en Spotify.',
                  style: TextStyle(color: _textoSecundario, fontSize: 13),
                ),
              ),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white12,
                  child: Icon(Icons.edit_square, color: _textoSecundario),
                ),
                title: const Text(
                  'Nuevo mensaje',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              const Divider(height: 24, color: Color(0xFF444444)),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text('Cerrar sesión'),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<void>(
                      builder: (_) => const PantallaInicio(),
                    ),
                    (_) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
