import 'package:flutter/material.dart';

const Color _fondoMenu = Color(0xFF212121);
const Color _grisIcono = Color(0xFF404040);
const Color _grisTexto = Color(0xFFB3B3B3);
const Color _verdeSpotify = Color(0xFF1ED760);

// ABRIR MENÚ CREAR DE SPOTIFY
Future<void> mostrarMenuCrear(
  BuildContext context,
  ValueChanged<bool> cambiarEstado,
) async {
  cambiarEstado(true);
  try {
    await showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Cerrar menú Crear',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 230),

      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned.fill(
                bottom:
                    MediaQuery.paddingOf(dialogContext).bottom +
                    kBottomNavigationBarHeight,
                child: const IgnorePointer(
                  child: ColoredBox(color: Color(0xAD000000)),
                ),
              ),
              Positioned.fill(
                child: SafeArea(
                  child: LayoutBuilder(
                    builder: (menuContext, constraints) {
                      return Stack(
                        children: [
                          // MENÚ FLOTANTE
                          Positioned(
                            left: 8,
                            right: 8,
                            bottom: kBottomNavigationBarHeight + 12,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: constraints.maxHeight * 0.60,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _fondoMenu,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // PLAYLIST
                                      _opcionCrear(
                                        icono: Icons.music_note,
                                        titulo: 'Playlist',
                                        descripcion:
                                            'Crea una playlist con canciones o episodios',
                                        onTap: () {
                                          Navigator.pop(dialogContext);
                                          _crearPlaylist(context);
                                        },
                                      ),

                                      // PLAYLIST COLABORATIVA
                                      _opcionCrear(
                                        icono: Icons.groups_rounded,
                                        titulo: 'Playlist colaborativa',
                                        descripcion:
                                            'Crea una playlist con tus personas favoritas',
                                        onTap: () {
                                          Navigator.pop(dialogContext);
                                          _crearPlaylist(
                                            context,
                                            colaborativa: true,
                                          );
                                        },
                                      ),

                                      // PLAYLIST MIXEADA
                                      _opcionCrear(
                                        icono: Icons.tune_rounded,
                                        titulo: 'Playlist mixeada',
                                        descripcion:
                                            'Mezcla canciones con transiciones fluidas',
                                        beta: true,
                                        onTap: () {
                                          Navigator.pop(dialogContext);
                                          _mostrarAviso(
                                            context,
                                            'Playlist mixeada',
                                          );
                                        },
                                      ),

                                      // FUSIÓN
                                      _opcionCrear(
                                        icono: Icons.join_inner_rounded,
                                        titulo: 'Fusión',
                                        descripcion:
                                            'Combina los gustos de tus personas favoritas en una playlist',
                                        onTap: () {
                                          Navigator.pop(dialogContext);
                                          _mostrarAviso(context, 'Fusión');
                                        },
                                      ),

                                      // JAM
                                      _opcionCrear(
                                        icono: Icons.sensors_rounded,
                                        titulo: 'Jam',
                                        descripcion:
                                            'Escuchen en conjunto, estén donde estén',
                                        onTap: () {
                                          Navigator.pop(dialogContext);
                                          _mostrarAviso(context, 'Jam');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 4,
                            child: FractionallySizedBox(
                              alignment: Alignment.centerRight,
                              widthFactor: .25,
                              child: Center(
                                child: SizedBox.square(
                                  dimension: 42,
                                  child: IconButton.filled(
                                    tooltip: 'Cerrar menú Crear',
                                    padding: EdgeInsets.zero,
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () =>
                                        Navigator.pop(dialogContext),
                                    icon: const Icon(Icons.close, size: 24),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation.drive(CurveTween(curve: Curves.easeOutCubic)),
          child: child,
        );
      },
    );
  } finally {
    if (context.mounted) cambiarEstado(false);
  }
}

// DISEÑO DE LAS OPCIONES
Widget _opcionCrear({
  required IconData icono,
  required String titulo,
  required String descripcion,
  required VoidCallback onTap,
  bool beta = false,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ICONO CIRCULAR
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: _grisIcono,
                shape: BoxShape.circle,
              ),
              child: Icon(icono, color: Colors.white70, size: 25),
            ),

            const SizedBox(width: 12),

            // TÍTULO Y DESCRIPCIÓN
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          titulo,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),

                      if (beta) ...[
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _grisIcono,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'Beta',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 5),

                  Text(
                    descripcion,
                    style: const TextStyle(
                      color: _grisTexto,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// CREAR UNA PLAYLIST
Future<void> _crearPlaylist(
  BuildContext context, {
  bool colaborativa = false,
}) async {
  if (!context.mounted) return;

  final controlador = TextEditingController();

  final nombre = await showDialog<String>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        backgroundColor: _fondoMenu,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          colaborativa ? 'Crear playlist colaborativa' : 'Crear playlist',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        content: TextField(
          controller: controlador,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Nombre de tu playlist',
            hintStyle: TextStyle(color: _grisTexto),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white54),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _verdeSpotify),
            ),
          ),
          onSubmitted: (valor) {
            final nombre = valor.trim();
            if (nombre.isNotEmpty) {
              Navigator.pop(dialogContext, nombre);
            }
          },
        ),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.white70),
            ),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _verdeSpotify,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              final texto = controlador.text.trim();

              if (texto.isNotEmpty) {
                Navigator.pop(dialogContext, texto);
              }
            },
            child: const Text('Crear'),
          ),
        ],
      );
    },
  );

  // LIBERAR RECURSOS DESPUÉS DEL DIÁLOGO
  WidgetsBinding.instance.addPostFrameCallback((_) {
    controlador.dispose();
  });

  if (!context.mounted) return;

  if (nombre != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Playlist "$nombre" creada'),
        backgroundColor: const Color(0xFF303030),
      ),
    );
  }
}

// MENSAJES DE LAS DEMÁS OPCIONES
void _mostrarAviso(BuildContext context, String opcion) {
  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$opcion: funcionalidad en desarrollo'),
      backgroundColor: const Color(0xFF303030),
    ),
  );
}
