/// Ejemplos de diferentes tipos de funciones en Dart

class DartFunctions {
  // 1. FUNCIÓN SIMPLE (sin parámetros)
  static String saludar() {
    return "¡Hola, mundo!";
  }

  // 2. FUNCIÓN CON PARÁMETROS POSICIONALES
  static int sumar(int a, int b) {
    return a + b;
  }

  // 3. FUNCIÓN CON PARÁMETROS OPCIONALES
  static String saludarPersona(String nombre, [String? apellido]) {
    return apellido != null 
        ? "Hola, $nombre $apellido" 
        : "Hola, $nombre";
  }

  // 4. FUNCIÓN CON PARÁMETROS NOMBRADOS
  static String crearMensaje({
    required String nombre,
    String saludo = "Hola",
    int edad = 0,
  }) {
    return "$saludo $nombre, tienes $edad años";
  }

  // 5. FUNCIÓN ANÓNIMA (guardada en variable)
  static Function multiplicar = (int a, int b) => a * b;

  // 6. FUNCIÓN DE ORDEN SUPERIOR
  static List<int> aplicarOperacion(
    List<int> numeros, 
    int Function(int) operacion
  ) {
    return numeros.map((num) => operacion(num)).toList();
  }

  // 7. FUNCIÓN RECURSIVA
  static int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }

  // 8. FUNCIÓN ASÍNCRONA
  static Future<String> obtenerDatos() async {
    await Future.delayed(Duration(seconds: 2));
    return "Datos obtenidos después de 2 segundos";
  }

  // 9. FUNCIÓN GENERADORA
  static Iterable<int> generarNumeros(int max) sync* {
    for (int i = 1; i <= max; i++) {
      yield i;
    }
  }

  // 10. FUNCIÓN CON MÚLTIPLES TIPOS DE RETORNO (usando typedef)
  static ResultadoOperacion dividir(double a, double b) {
    if (b == 0) {
      return ResultadoOperacion(
        exito: false, 
        mensaje: "Error: División por cero",
        resultado: 0,
      );
    }
    return ResultadoOperacion(
      exito: true, 
      mensaje: "División exitosa",
      resultado: a / b,
    );
  }

  // 11. FUNCIÓN CURRY (función que retorna otra función)
  static Function(int) crearMultiplicador(int factor) {
    return (int numero) => numero * factor;
  }

  // 12. FUNCIÓN CON CALLBACK
  static void procesarLista(
    List<String> items, 
    void Function(String) callback
  ) {
    for (String item in items) {
      callback(item);
    }
  }

  // 13. FUNCIÓN DE EXTENSIÓN (simulada con clase helper)
  static String capitalizar(String texto) {
    if (texto.isEmpty) return texto;
    return texto[0].toUpperCase() + texto.substring(1).toLowerCase();
  }

  // 14. FUNCIÓN CON MANEJO DE ERRORES
  static String dividirSeguro(String a, String b) {
    try {
      double numA = double.parse(a);
      double numB = double.parse(b);
      if (numB == 0) throw ArgumentError("División por cero");
      return (numA / numB).toStringAsFixed(2);
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }

  // 15. FUNCIÓN ESTÁTICA DE CLASE
  static List<String> obtenerTiposFunciones() {
    return [
      "Función Simple",
      "Parámetros Posicionales", 
      "Parámetros Opcionales",
      "Parámetros Nombrados",
      "Función Anónima",
      "Función de Orden Superior",
      "Función Recursiva",
      "Función Asíncrona",
      "Función Generadora",
      "Función con Múltiples Retornos",
      "Función Curry",
      "Función con Callback",
      "Función de Extensión",
      "Función con Manejo de Errores",
      "Función Estática"
    ];
  }
}

// Clase helper para el ejemplo de función con múltiples tipos de retorno
class ResultadoOperacion {
  final bool exito;
  final String mensaje;
  final double resultado;

  ResultadoOperacion({
    required this.exito,
    required this.mensaje,
    required this.resultado,
  });
}

// Extensiones para String (ejemplo de función de extensión real)
extension StringExtension on String {
  String get capitalizado {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}