import 'package:flutter/material.dart';

import 'Pantalla_Biblioteca.dart';
import 'Pantalla_Principal.dart';
import 'barra_navegacion.dart';
import 'menu_perfil.dart';
import 'pantalla_crear.dart';

class PantallaBuscar extends StatefulWidget {
  const PantallaBuscar({super.key});

  @override
  State<PantallaBuscar> createState() => _PantallaBuscarState();
}

class _PantallaBuscarState extends State<PantallaBuscar> {
  bool _menuCrearAbierto = false;
  final TextEditingController _controladorBusqueda = TextEditingController();

  final List<_Categoria> _categorias = const [
    _Categoria(
      'Música',
      Color(0xFFE91486),
      Icons.music_note,
      imagen: 'assets/images/mujer_mariposa.png',
    ),
    _Categoria(
      'Bienestar',
      Color(0xFF006450),
      Icons.mic,
      imagen: 'assets/images/dias_contigo.jpg',
    ),
    _Categoria(
      'Worship',
      Color(0xFF1E3264),
      Icons.auto_stories,
      imagen: 'assets/images/kintsugi.jpg',
    ),
    _Categoria(
      'Creado\npara ti',
      Color(0xFF8400E7),
      Icons.podcasts,
      imagen: 'assets/images/morning_glory.jpg',
    ),
    _Categoria(
      'Classic\nRock',
      Color(0xFF8D67AB),
      Icons.favorite,
      imagen: 'assets/images/abbey_road.jpg',
    ),
    _Categoria(
      'Pop Rock',
      Color(0xFF007F5F),
      Icons.schedule,
      imagen: 'assets/images/reckless.webp',
    ),
    _Categoria(
      'Pop/Soul',
      Color(0xFF608108),
      Icons.new_releases,
      imagen: 'assets/images/adele_21.jpg',
    ),
    _Categoria(
      'Pop',
      Color(0xFFE11178),
      Icons.headphones,
      imagen: 'assets/images/thriller.jpg',
    ),
    _Categoria(
      'Prog Rock',
      Color(0xFF477D95),
      Icons.album,
      imagen: 'assets/images/dark_side_of_the_moon.jpg',
    ),
    _Categoria(
      'Classical\nCrossover',
      Color(0xFFBA5D07),
      Icons.electric_bolt,
      imagen: 'assets/images/dimash_id.jpg',
    ),
  ];

  List<_Categoria> get _categoriasFiltradas {
    final texto = _controladorBusqueda.text.trim().toLowerCase();
    if (texto.isEmpty) return _categorias;
    return _categorias
        .where((categoria) => categoria.nombre.toLowerCase().contains(texto))
        .toList();
  }

  @override
  void dispose() {
    _controladorBusqueda.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawerScrimColor: sombraMenuPerfil,
      drawer: const MenuPerfil(),
      backgroundColor: Color.fromARGB(255, 25, 20, 20),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 25, 20, 20),
        foregroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 14,
        title: const Row(
          children: [
            BotonPerfil(),
            SizedBox(width: 8),
            Text(
              'Buscar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Buscar con la cámara',
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined, size: 30),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            20,
            18,
            20,
            kBottomNavigationBarHeight +
                MediaQuery.viewPaddingOf(context).bottom +
                24,
          ),
          children: [
            TextField(
              controller: _controladorBusqueda,
              onChanged: (_) => setState(() {}),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: '¿Qué quieres escuchar?',
                hintStyle: const TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                suffixIcon: _controladorBusqueda.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () {
                          _controladorBusqueda.clear();
                          setState(() {});
                        },
                        icon: const Icon(Icons.close, color: Colors.black),
                      ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Explorar todo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (_categoriasFiltradas.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 32),
                child: Center(
                  child: Text(
                    'No encontramos esa categoría',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
              )
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _categoriasFiltradas.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.5, //tamaño de las tarjetas (ancho/alto)
                ),
                itemBuilder: (context, indice) {
                  final categoria = _categoriasFiltradas[indice];
                  return Card(
                    margin: EdgeInsets.zero,
                    color: categoria.color,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              categoria.nombre,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize:
                                    16, //tamaño de las letras de las categorías
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (categoria.imagen != null)
                            Positioned(
                              right: -10, //
                              bottom: -30, //posición de la imagen
                              child: Transform.rotate(
                                angle: 0.60, //ángulo
                                child: SizedBox(
                                  width: 105, //tamaño de la imagen
                                  height: 105, //tamaño de la imagen
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ), //bordes
                                    child: Image.asset(
                                      categoria.imagen!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            Positioned(
                              right: -8,
                              bottom: -10,
                              child: Transform.rotate(
                                angle: -0.25,
                                child: Icon(
                                  categoria.icono,
                                  color: Colors.white.withValues(alpha: 0.85),
                                  size: 65,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
      bottomNavigationBar: BarraNavegacion(
        indiceActual: 1,
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
          } else if (indice == 2) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const PantallaBiblioteca()),
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
}

class _Categoria {
  final String nombre;
  final Color color;
  final IconData icono;
  final String? imagen;

  const _Categoria(this.nombre, this.color, this.icono, {this.imagen});
}
