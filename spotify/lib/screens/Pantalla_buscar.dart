import 'package:flutter/material.dart';

import 'Pantalla_Principal.dart';

class PantallaBuscar extends StatefulWidget {
  const PantallaBuscar({super.key});

  @override
  State<PantallaBuscar> createState() => _PantallaBuscarState();
}

class _PantallaBuscarState extends State<PantallaBuscar> {
  final TextEditingController _controladorBusqueda = TextEditingController();

  final List<_Categoria> _categorias = const [
    _Categoria(
      'Música',
      Color(0xFFE91486),
      Icons.music_note,
      imagen: 'assets/images/mujer_mariposa.png',
    ),
    _Categoria('Podcasts', Color(0xFF006450), Icons.mic),
    _Categoria('Audiolibros', Color(0xFF1E3264), Icons.auto_stories),
    _Categoria('Eventos en vivo', Color(0xFF8400E7), Icons.podcasts),
    _Categoria('Creado para ti', Color(0xFF8D67AB), Icons.favorite),
    _Categoria('Próximos lanzamientos', Color(0xFF007F5F), Icons.schedule),
    _Categoria('Nuevos lanzamientos', Color(0xFF608108), Icons.new_releases),
    _Categoria('Spotify Sessions', Color(0xFFE11178), Icons.headphones),
    _Categoria('Pop', Color(0xFF477D95), Icons.album),
    _Categoria('Rock', Color(0xFFBA5D07), Icons.electric_bolt),
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
      backgroundColor: Color.fromARGB(255, 25, 20, 20),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 25, 20, 20),
        foregroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Color.fromARGB(255, 30, 255, 108),
              foregroundColor: Colors.black,
              child: Text('I', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 14),
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
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
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
                  childAspectRatio: 3.0, //tamaño de las tarjetas (ancho/alto)
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
                                    30, //tamaño de las letras de las categorías
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (categoria.imagen != null)
                            Positioned(
                              right: -18, //
                              bottom: -60, //posición de la imagen
                              child: Transform.rotate(
                                angle: 0.50, //ángulo
                                child: SizedBox(
                                  width: 250, //tamaño de la imagen
                                  height: 250, //tamaño de la imagen
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF121212),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (indice) {
          if (indice == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const PantallaPrincipal()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_outlined),
            label: 'Tu biblioteca',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Más'),
        ],
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
