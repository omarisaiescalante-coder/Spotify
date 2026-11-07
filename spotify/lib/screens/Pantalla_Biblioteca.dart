import 'package:flutter/material.dart';

import 'Pantalla_buscar.dart';
import 'Pantalla_Principal.dart';
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
      colorFondo: Colors.deepPurple,
      esCircular: false,
    ),
    (
      titulo: 'Nadie',
      subtitulo: 'Artista',
      icono: Icons.person,
      colorFondo: Colors.grey,
      esCircular: true,
    ),
    (
      titulo: 'Rock Clásico 80s',
      subtitulo: 'Playlist • Tu usuario',
      icono: Icons.music_note,
      colorFondo: Colors.blueGrey,
      esCircular: false,
    ),
    (
      titulo: 'Sebastian Yatra',
      subtitulo: 'Artista',
      icono: Icons.person,
      colorFondo: Color.fromARGB(255, 21, 111, 33),
      esCircular: true,
    ),
    (
      titulo: 'Las mas escuchadas 2023',
      subtitulo: 'Playlist • 94 canciones',
      icono: Icons.headset,
      colorFondo: Color.fromARGB(255, 3, 111, 253),
      esCircular: false,
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
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(const SnackBar(content: Text('Creas')));
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
                        ),
                    ],
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF121212),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,

        onTap: (indice) {
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

        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.library_music_outlined),
            label: 'Tu biblioteca',
          ),
          BottomNavigationBarItem(
            icon: Opacity(
              opacity: _menuCrearAbierto ? 0 : 1,
              child: const Icon(Icons.add),
            ),
            label: _menuCrearAbierto ? '' : 'Más',
          ),
        ],
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
  }) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: colorFondo,
          shape: esCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: esCircular ? null : BorderRadius.circular(4),
        ),
        child: Icon(icono, color: Colors.white),
      ),
      title: Text(
        titulo,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitulo,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
      onTap: () {},
    );
  }
}
