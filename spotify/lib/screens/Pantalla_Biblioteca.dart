import 'package:flutter/material.dart';

import 'Pantalla_buscar.dart';
import 'Pantalla_Principal.dart';
import 'barra_navegacion.dart';
import 'menu_perfil.dart';
import 'pantalla_crear.dart';

class PantallaBiblioteca extends StatefulWidget {
  const PantallaBiblioteca({super.key});

  @override
  State<PantallaBiblioteca> createState() => _PantallaBibliotecaState();
}

class _PantallaBibliotecaState extends State<PantallaBiblioteca> {
  bool _menuCrearAbierto = false;
  static const _elementos = [
    (
      titulo: 'Tus canciones que te gustan',
      subtitulo: 'Playlist • 142 canciones',
      icono: Icons.favorite,
      colorFondo: Color.fromARGB(255, 234, 6, 150),
      esCircular: false,
      imagen: null,
    ),
    (
      titulo: 'Aitana',
      subtitulo: 'Artista',
      icono: Icons.person,
      colorFondo: Color.fromARGB(255, 21, 111, 33),
      esCircular: true,
      imagen: 'assets/images/aitana.jpeg',
    ),
    (
      titulo: 'Barak',
      subtitulo: 'Artista',
      icono: Icons.person,
      colorFondo: Colors.grey,
      esCircular: true,
      imagen: 'assets/images/Barak.jpg',
    ),
    (
      titulo: 'Verano',
      subtitulo: 'Playlist • Rauw Alejandra, maluma, sabastian yatra',
      icono: Icons.headset,
      colorFondo: Color.fromARGB(255, 3, 111, 253),
      esCircular: false,
      imagen: 'assets/images/verano.jpeg',
    ),
    (
      titulo: 'Sebastian Yatra',
      subtitulo: 'Artista',
      icono: Icons.person,
      colorFondo: Color.fromARGB(255, 21, 111, 33),
      esCircular: true,
      imagen: 'assets/images/1900x1900-000000-80-0-0.jpg',
    ),
    (
      titulo: 'Tu Top de canciones 2026',
      subtitulo: 'Playlist • 102 canciones',
      icono: Icons.headset,
      colorFondo: Color.fromARGB(255, 3, 111, 253),
      esCircular: true,
      imagen: 'assets/images/topcanciones2026.jpeg',
    ),
    (
      titulo: 'Las mas escuchadas 2023',
      subtitulo: 'Playlist • 94 canciones',
      icono: Icons.headset,
      colorFondo: Color.fromARGB(255, 3, 111, 253),
      esCircular: false,
      imagen: null,
    ),
    (
      titulo: 'GYM/ALEGRIA/SUDOR',
      subtitulo: 'Playlist • Creado por Loany',
      icono: Icons.headset,
      colorFondo: Color.fromARGB(255, 3, 111, 253),
      esCircular: true,
      imagen: 'assets/images/GYM.jpeg',
    ),
    (
      titulo: 'WORSHIP EN ESPAÑOL 2024',
      subtitulo: 'Playlist • Mich.Mazua',
      icono: Icons.headset,
      colorFondo: Color.fromARGB(255, 3, 111, 253),
      esCircular: false,
      imagen: 'assets/images/worship.jpeg',
    ),
    (
      titulo: 'Rock Clásico 80s',
      subtitulo: 'Playlist • Tu usuario',
      icono: Icons.music_note,
      colorFondo: Colors.blueGrey,
      esCircular: false,
      imagen: 'assets/images/rockclasico.jpg',
    ),
  ];

  bool _buscando = false;
  String _consulta = '';

  static String _normalizar(String texto) {
    return texto.toLowerCase().replaceAllMapped(
      RegExp('[áéíóúü]'),
      (letra) => 'aeiouu'['áéíóúü'.indexOf(letra[0]!)],
    );
  }

  @override
  Widget build(BuildContext context) {
    final consulta = _normalizar(_consulta.trim());
    final resultados = _elementos.where(
      (elemento) =>
          _normalizar(elemento.titulo).contains(consulta) ||
          _normalizar(elemento.subtitulo).contains(consulta),
    );

    return Scaffold(
      extendBody: true,
      drawerScrimColor: sombraMenuPerfil,
      drawer: const MenuPerfil(),
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: const BotonPerfil(),
        title: _buscando
            ? TextField(
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: 'Buscar en tu biblioteca',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                onChanged: (valor) => setState(() => _consulta = valor),
              )
            : const Text(
                'Tu biblioteca',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        actions: [
          IconButton(
            tooltip: _buscando ? 'Cerrar búsqueda' : 'Buscar en tu biblioteca',
            icon: Icon(
              _buscando ? Icons.close : Icons.search,
              color: Colors.white,
            ),
            onPressed: () => setState(() {
              _buscando = !_buscando;
              _consulta = '';
            }),
          ),
          IconButton(
            tooltip: 'Crear',
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _crearBotonFiltro('Playlists'),
                const SizedBox(width: 8),
                _crearBotonFiltro('Artistas'),
                const SizedBox(width: 8),
                _crearBotonFiltro('Álbumes'),
                const SizedBox(width: 8),
                _crearBotonFiltro('Podcasts'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.swap_vert, color: Colors.white70, size: 18),
                    SizedBox(width: 4),
                    Text(
                      'Recientes',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
                Icon(Icons.grid_view_rounded, color: Colors.white70, size: 18),
              ],
            ),
          ),
          Expanded(
            child: resultados.isEmpty
                ? const Center(
                    child: Text(
                      'No hay resultados',
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                : ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      for (final elemento in resultados)
                        _crearElementoLista(
                          titulo: elemento.titulo,
                          subtitulo: elemento.subtitulo,
                          icono: elemento.icono,
                          colorFondo: elemento.colorFondo,
                          esCircular: elemento.esCircular,
                          imagen: elemento.imagen,
                          fijada:
                              elemento.titulo ==
                                  'Tus canciones que te gustan' ||
                              elemento.titulo == 'Aitana',
                        ),
                    ],
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BarraNavegacion(
        indiceActual: 2,
        menuCrearAbierto: _menuCrearAbierto,
        onTap: (indice) {
          if (_menuCrearAbierto) {
            Navigator.of(context).pop();
            if (indice == 3) return;
          }
          if (indice == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const PantallaPrincipal()),
            );
          } else if (indice == 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const PantallaBuscar()),
            );
          } else if (indice == 3) {
            // ABRIR MENÚ CREAR DE SPOTIFY
            mostrarMenuCrear(context, (abierto) {
              setState(() => _menuCrearAbierto = abierto);
            });
          }
        },
      ),
    );
  }

  //Clase que sera llamada arriba
  static Widget _crearBotonFiltro(String texto) {
    return Material(
      color: const Color(0xFF282828),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            texto,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    );
  }

  //Clase que sera llamada arriba
  static Widget _crearElementoLista({
    required String titulo,
    required String subtitulo,
    required IconData icono,
    required Color colorFondo,
    required bool esCircular,
    String? imagen,
    bool fijada = false,
  }) {
    return ListTile(
      leading: Container(
        width: 58,
        height: 68,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: colorFondo,
          shape: esCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: esCircular ? null : BorderRadius.circular(4),
        ),
        child: imagen == null
            ? Icon(icono, color: Colors.white)
            : Image.asset(imagen, fit: BoxFit.cover),
      ),
      title: Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        titulo,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      subtitle: Row(
        children: [
          if (fijada)
            Transform.rotate(
              angle: 0.6,
              child: const Icon(
                Icons.push_pin,
                color: Color(0xFF1DB954),
                size: 15,
              ),
            ),
          Expanded(
            child: Text(
              subtitulo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
