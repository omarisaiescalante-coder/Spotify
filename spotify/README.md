# Spotify

- **Aplicación asignada** · Spotify
- **Plataforma seleccionada** · Móvil (Android)
- **Integrantes** · 
- Maria Jose Rivas Mejia
- Fabricio Josue Torrez
- Loany Nohelia Matamoros Mejia
- Omar Isai Escalante Rodriguez

## Descripción

Proyecto académico en Flutter que recrea la interfaz móvil de Spotify. Permite iniciar sesión con una cuenta de prueba, explorar estaciones y álbumes, buscar categorías y filtrar los elementos de una biblioteca simulada.

## Pantallas

1. **Inicio de sesión.** Valida el correo y la contraseña de prueba.
2. **Inicio.** Presenta carruseles de estaciones populares, mezclas diarias y álbumes.
3. **Buscar.** Muestra categorías para explorar y un campo para filtrarlas por nombre.
4. **Tu biblioteca.** Muestra playlists y artistas, con una lupa para buscar en la lista.

Al abrir la app, aparece brevemente el logotipo de Spotify antes de mostrar el inicio de sesión.

## Interacciones

- **Filtros de Inicio.** Al elegir Todas, Música, Podcasts o Audiolibros, cambia el filtro activo y se actualiza el contenido visible.
- **Búsqueda por categoría.** En Buscar, la cuadrícula se filtra mientras escribís.
- **Búsqueda en la biblioteca.** La lupa abre un campo que filtra por título o subtítulo. La **×** cierra el campo y restaura la lista.
- **Botón + de la biblioteca.** Muestra el mensaje «Creas» y mantiene visible la biblioteca.
- **Menú de cuenta.** El avatar abre el menú lateral en Inicio, Buscar y Tu biblioteca. Desde allí se puede cerrar sesión y volver al formulario de acceso.

## Credenciales de prueba

| Campo | Valor |
| --- | --- |
| Usuario (correo) | `spotify@gmail.com` |
| Contraseña | `123456` |

## Cómo ejecutar el proyecto

1. Instalá Flutter con Dart 3.13.5 o posterior dentro de la rama 3.x, y configurá el SDK de Android.
2. Iniciá un emulador Android o conectá un teléfono Android con la depuración USB habilitada.
3. Abrí una terminal en la subcarpeta `spotify`, donde está `pubspec.yaml`, y ejecutá estos comandos.

   ```sh
   flutter pub get
   flutter devices
   flutter run
   ```

**En caso de que no funcione de poner esto**:
   cd .\spotify
   dir pubspec.yaml
   flutter pub get
   flutter devices
   flutter run (F5)

4. Iniciá sesión con las credenciales de prueba.
