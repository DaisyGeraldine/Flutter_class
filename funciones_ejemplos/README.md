# Dart Functions App

Este proyecto es una mini aplicación en Dart que muestra el uso de diferentes funciones en varias categorías, incluyendo matemáticas, manipulación de cadenas y operaciones con listas.

## Estructura del Proyecto

```
dart-functions-app
├── lib
│   ├── main.dart
│   ├── functions
│   │   ├── math_functions.dart
│   │   ├── string_functions.dart
│   │   └── list_functions.dart
│   └── utils
│       └── helpers.dart
├── test
│   └── functions_test.dart
├── pubspec.yaml
└── README.md
```

## Archivos Principales

- **lib/main.dart**: Punto de entrada de la aplicación. Muestra ejemplos del uso de las funciones definidas en otros archivos.
- **lib/functions/math_functions.dart**: Contiene funciones matemáticas como `add`, `subtract`, `multiply` y `divide`.
- **lib/functions/string_functions.dart**: Incluye funciones para manipular cadenas de texto como `concatenate`, `toUpperCase` y `reverse`.
- **lib/functions/list_functions.dart**: Proporciona funciones para trabajar con listas, incluyendo `addElement`, `removeElement` y `findElement`.
- **lib/utils/helpers.dart**: Contiene funciones auxiliares como `printSeparator` para mejorar la legibilidad de la salida en consola.
- **test/functions_test.dart**: Contiene pruebas unitarias para asegurar que las funciones se comporten como se espera.
- **pubspec.yaml**: Configuración del proyecto Dart, incluyendo dependencias y metadatos.

## Instrucciones para Ejecutar la Aplicación

1. Asegúrate de tener Dart instalado en tu máquina.
2. Clona este repositorio o descarga los archivos.
3. Navega al directorio del proyecto.
4. Ejecuta el siguiente comando para correr la aplicación:

   ```
   dart run lib/main.dart
   ```

## Ejemplos de Uso

- Para realizar operaciones matemáticas, puedes usar las funciones del archivo `math_functions.dart`.
- Para manipular cadenas, utiliza las funciones definidas en `string_functions.dart`.
- Para trabajar con listas, accede a las funciones en `list_functions.dart`.

¡Disfruta explorando y utilizando las funciones de esta aplicación!