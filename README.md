# Covid 19 App

## Introducción

### Descripción del Proyecto
En este documento encontrara la información sobre el proyecto "Covid 19 app", una solución diseñada dar solución a la prueba técnica de Evertec para el puesto de Ingenierop de Software Flutter

La aplicación agrupa funcionalidades basicas para un login, ademas de un dashboard completo sobre información sobre pacientes del covid 19 en Estados Unidos y sus diferentes estados.

### Para empezar

Para compilar y correr este projecto:
  1. Obtener e instalar Flutter si aún no lo tienes
  2. Clonar el repositorio
  3. Ejecutar el comando `flutter pub get`
  4. Y para correr el proyecto ejecutar el comando `flutter run`

Los requisitos requeridos para desarrollar en este proyecto son:
- Flutter versión > 3.1.0 
- Visual Studio Code (recomendado) o en su defecto Android Studio

## Contexto General

### Arquitectura Front-End

Riverpod Clean Architecture 
 
- **Widgets:** Componentes gráficos desarrollados para el Proyecto.  
- **States:** Diferentes estados que puede tener un componente. 
- **Controllers:** Controladores que permiten actualizar el estado de cada componente. 
- **Servicios:** Capa que se encarga de la conexión con servicios externos. Protocolos HTTP o FirebaseServices. 
- **Models:** Capa intermedia que mapea los datos obtenidos del consumo de servicios o los datos locales.
- **Repositorios o DataSources:** Capa de datos.

### Sobre la aplicación
Splash Screen de la palicación que simula una barra de carga, que cuando termina pasa a la siguiente pantalla

<img src= "https://i.postimg.cc/fR6dZGZy/Screenshot-1707360869.png" height ="500">

En el formulario de Login, el usuario tiene que digitar su numero de documento y una contraseña, estos campos son obligatorios, excepto el campo de tipo de documento.

<img src= "https://i.postimg.cc/Dzxcr2XZ/Screenshot-1707360875.png" height ="500">

Si el usuario no esta registrado, automaticamente se agregara a la base de datos y luego lo dejara iniciar sesión en la aplicación.

<img src= "https://i.postimg.cc/NGSpCfP2/Screenshot-1707360889.png" height ="500">

Una vez ingrese a la plataforma, se le mostrara el siguiente dashboard donde podra visulizar los datos de su dispositivo, datos sobre el Covid 19 en estados unidos y la hora que se actualiza en tiempo real.

<img src= "https://i.postimg.cc/nzMGT641/Screenshot-1707360903.png" height ="500">

Tambien encontrara un switch con el cual podra alternar entre el tema claro u oscuro de la aplicación.

<img src= "https://i.postimg.cc/sg9m2Pf5/Screenshot-1707360907.png" height ="500">

Al darle en el boton flotante con el signo +, el usuario podra acceder a la lista de detalles por estado 

<img src= "https://i.postimg.cc/sxh9C70Q/Screenshot-1707360936.png" height ="500">

Y si selecciona alguna opción del listado, lo llevara a una pantalla donde podra ver un carrusel de imagenes, junto con un grafico dinamico que le mostrara los datos referentes al estado seleccionado, ademas de otras cosas que se pueden ver desplazando la pantalla hacia la parte inferior o dando click en el botón de información

<img src= "https://i.postimg.cc/xdjL6Wv4/Screenshot-1707360940.png" height ="500">
 
