import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Pantalla_Biblioteca.dart';
import 'Pantalla_buscar.dart';
import 'menu_perfil.dart';

const _fondo = Color(0xFF121212);
const _verde = Color(0xFF1ED760);
const _textoSecundario = Color(0xFFB3B3B3);

typedef _Tarjeta = ({String portada, String titulo, String descripcion});

const _estaciones = <_Tarjeta>[
  (
    portada: 'inicio_radio_camilo.png',
    titulo: 'Camilo Sesto',
    descripcion: 'Miguel Bosé, Camilo Sesto, Daniela Romo, Miguel Gallardo',
  ),
  (
    portada: 'inicio_radio_temerarios.png',
    titulo: 'Los Temerarios',
    descripcion:
        'Los Temerarios, Los Bukis, Grupo Bryndis, Liberación, Grupo Mojado',
  ),
  (
    portada: 'dias_contigo.jpg',
    titulo: 'Días contigo',
    descripcion: 'Días contigo y más',
  ),
];

const _mezclas = <_Tarjeta>[
  (
    portada: 'inicio_mix_1.png',
    titulo: 'Mix diario 1',
    descripcion: 'Gorillaz, Bizarrap, Rauw Alejandro y más',
  ),
  (
    portada: 'inicio_mix_2.png',
    titulo: 'Mix diario 2',
    descripcion: 'German Garmendia',
  ),
  (
    portada: 'mujer_mariposa.png',
    titulo: 'Mix diario 3',
    descripcion: 'Mujer Mariposa y más',
  ),
];

const _albumes = <_Tarjeta>[
  (
    portada: 'inicio_formula.png',
    titulo: 'Fórmula, Vol. 2 (Deluxe Edition)',
    descripcion: 'Romeo Santos',
  ),
  (
    portada: 'inicio_verano.png',
    titulo: 'Un Verano Sin Ti',
    descripcion: 'Bad Bunny',
  ),
  (portada: 'thriller.jpg', titulo: 'Thriller', descripcion: 'Michael Jackson'),
];

enum _Filtro {
  todas('Todas'),
  musica('Música'),
  podcasts('Podcasts'),
  audiolibros('Audiolibros');

  const _Filtro(this.nombre);
  final String nombre;
}

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  _Filtro _filtro = _Filtro.todas;

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.sizeOf(context).width;
    final anchoTarjeta = (ancho * 0.4).clamp(112.0, 200.0).toDouble();

    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        extendBody: true,
        backgroundColor: _fondo,
        drawerScrimColor: sombraMenuPerfil,
        drawer: const MenuPerfil(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: _fondo,
          surfaceTintColor: Colors.transparent,
          titleSpacing: 0,
          title: Row(
            children: [
              const SizedBox(width: 16),
              const BotonPerfil(),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    children: [
                      for (final filtro in _Filtro.values)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(filtro.nombre),
                            selected: _filtro == filtro,
                            onSelected: (_) => setState(() => _filtro = filtro),
                            showCheckmark: false,
                            backgroundColor: const Color(0xFF303030),
                            selectedColor: _verde,
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                            labelStyle: TextStyle(
                              color: _filtro == filtro
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: switch (_filtro) {
          _Filtro.todas || _Filtro.musica => ListView(
            padding: const EdgeInsets.only(top: 16, bottom: 88),
            children: [
              _Carrusel(
                titulo: 'Estaciones populares',
                tarjetas: _estaciones,
                ancho: anchoTarjeta,
              ),
              _Carrusel(
                titulo: 'Hecho para $nombrePerfil',
                tarjetas: _mezclas,
                ancho: anchoTarjeta,
              ),
              _Carrusel(
                titulo: 'Álbumes y sencillos populares',
                tarjetas: _albumes,
                ancho: anchoTarjeta,
                mostrarTitulo: true,
              ),
            ],
          ),
          _Filtro.podcasts || _Filtro.audiolibros => Center(
            child: Text(
              'Aún no hay ${_filtro.nombre.toLowerCase()} disponibles.',
              style: const TextStyle(color: _textoSecundario),
            ),
          ),
        },
        bottomNavigationBar: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black, Colors.black],
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: _textoSecundario,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            iconSize: 26,
            onTap: (indice) {
              switch (indice) {
                case 1:
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const PantallaBuscar()),
                  );
                case 2:
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const PantallaBiblioteca(),
                    ),
                  );
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Buscar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music_outlined),
                label: 'Tu biblioteca',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                    label: 'Crear'),
            ],
          ),
        ),
      ),
    );
  }
}

class _Carrusel extends StatelessWidget {
  const _Carrusel({
    required this.titulo,
    required this.tarjetas,
    required this.ancho,
    this.mostrarTitulo = false,
  });

  final String titulo;
  final List<_Tarjeta> tarjetas;
  final double ancho;
  final bool mostrarTitulo;

  @override
  Widget build(BuildContext context) {
    final escala = MediaQuery.textScalerOf(context);
    final altoTexto = escala.scale(14) * (mostrarTitulo ? 6 : 3);
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              titulo,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: ancho + altoTexto + 10,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: tarjetas.length,
              separatorBuilder: (_, _) => const SizedBox(width: 16),
              itemBuilder: (context, indice) {
                final tarjeta = tarjetas[indice];
                return SizedBox(
                  width: ancho,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Semantics(
                            image: !mostrarTitulo,
                            label: mostrarTitulo ? null : tarjeta.titulo,
                            child: Ink.image(
                              image: AssetImage(
                                'assets/images/${tarjeta.portada}',
                              ),
                              width: ancho,
                              height: ancho,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          if (mostrarTitulo) ...[
                            const Text(
                              'Álbum',
                              style: TextStyle(
                                color: _textoSecundario,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              tarjeta.titulo,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          Text(
                            tarjeta.descripcion,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: _textoSecundario,
                              fontSize: 13,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
