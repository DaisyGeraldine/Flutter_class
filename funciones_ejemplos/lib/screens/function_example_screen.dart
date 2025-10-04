import 'package:flutter/material.dart';
import '../functions/dart_functions.dart';

class FunctionExampleScreen extends StatefulWidget {
  final String titulo;
  final int index;

  const FunctionExampleScreen({
    super.key,
    required this.titulo,
    required this.index,
  });

  @override
  State<FunctionExampleScreen> createState() => _FunctionExampleScreenState();
}

class _FunctionExampleScreenState extends State<FunctionExampleScreen> {
  String resultado = "";
  bool isLoading = false;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.shade50, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildDescriptionCard(),
                const SizedBox(height: 20),
                _buildExampleCard(),
                const SizedBox(height: 20),
                _buildResultCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: Colors.deepPurple, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Descripción',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _getDescription(),
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.code, color: Colors.green, size: 24),
                const SizedBox(width: 8),
                const Text(
                  'Ejemplo Interactivo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInteractiveExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.play_circle_outline, color: Colors.orange, size: 24),
                const SizedBox(width: 8),
                const Text(
                  'Resultado',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child:
                  isLoading
                      ? const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          SizedBox(width: 12),
                          Text("Ejecutando..."),
                        ],
                      )
                      : Text(
                        resultado.isEmpty
                            ? "Presiona el botón para ejecutar"
                            : resultado,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'monospace',
                          color:
                              resultado.isEmpty
                                  ? Colors.grey[600]
                                  : Colors.black,
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveExample() {
    switch (widget.index) {
      case 0: // Función Simple
        return ElevatedButton(
          onPressed: _ejecutarEjemplo,
          child: const Text("Ejecutar saludo"),
        );

      case 1: // Parámetros Posicionales
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Primer número",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Segundo número",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _ejecutarEjemplo,
              child: const Text("Sumar números"),
            ),
          ],
        );

      case 2: // Parámetros Opcionales
        return Column(
          children: [
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(
                labelText: "Apellido (opcional)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _ejecutarEjemplo,
              child: const Text("Saludar persona"),
            ),
          ],
        );

      case 7: // Función Asíncrona
        return ElevatedButton(
          onPressed: _ejecutarEjemploAsincrono,
          child: const Text("Obtener datos (2 segundos)"),
        );

      default:
        return ElevatedButton(
          onPressed: _ejecutarEjemplo,
          child: const Text("Ejecutar ejemplo"),
        );
    }
  }

  void _ejecutarEjemplo() {
    setState(() {
      switch (widget.index) {
        case 0: // Función Simple
          resultado = DartFunctions.saludar();
          break;

        case 1: // Parámetros Posicionales
          final a = int.tryParse(_controller1.text) ?? 0;
          final b = int.tryParse(_controller2.text) ?? 0;
          resultado = "Resultado: ${DartFunctions.sumar(a, b)}";
          break;

        case 2: // Parámetros Opcionales
          final nombre =
              _controller1.text.isEmpty ? "Usuario" : _controller1.text;
          final apellido = _controller2.text.isEmpty ? null : _controller2.text;
          resultado = DartFunctions.saludarPersona(nombre, apellido);
          break;

        case 3: // Parámetros Nombrados
          resultado = DartFunctions.crearMensaje(
            nombre: "Juan",
            saludo: "Buenos días",
            edad: 25,
          );
          break;

        case 4: // Función Anónima
          resultado = "5 × 3 = ${DartFunctions.multiplicar(5, 3)}";
          break;

        case 5: // Función de Orden Superior
          final numeros = [1, 2, 3, 4, 5];
          final cuadrados = DartFunctions.aplicarOperacion(
            numeros,
            (x) => x * x,
          );
          resultado = "Números: $numeros\nCuadrados: $cuadrados";
          break;

        case 6: // Función Recursiva
          resultado = "Factorial de 5: ${DartFunctions.factorial(5)}";
          break;

        case 8: // Función Generadora
          final numeros = DartFunctions.generarNumeros(5).toList();
          resultado = "Números generados: $numeros";
          break;

        case 9: // Función con Múltiples Retornos
          final resultadoDiv = DartFunctions.dividir(10, 3);
          resultado =
              "${resultadoDiv.mensaje}\nResultado: ${resultadoDiv.resultado.toStringAsFixed(2)}";
          break;

        case 10: // Función Curry
          final multiplicarPor3 = DartFunctions.crearMultiplicador(3);
          resultado = "7 × 3 = ${multiplicarPor3(7)}";
          break;

        case 11: // Función con Callback
          final items = ["Manzana", "Banana", "Cereza"];
          final resultados = <String>[];
          DartFunctions.procesarLista(items, (item) {
            resultados.add("Procesando: $item");
          });
          resultado = resultados.join("\n");
          break;

        case 12: // Función de Extensión
          resultado =
              "\"hola mundo\".capitalizado = \"${"hola mundo".capitalizado}\"";
          break;

        case 13: // Función con Manejo de Errores
          resultado = "10 ÷ 0 = ${DartFunctions.dividirSeguro("10", "0")}\n";
          resultado += "20 ÷ 4 = ${DartFunctions.dividirSeguro("20", "4")}";
          break;

        case 14: // Función Estática
          final tipos = DartFunctions.obtenerTiposFunciones();
          resultado =
              "Total de tipos: ${tipos.length}\nPrimeros 3: ${tipos.take(3).join(", ")}";
          break;

        default:
          resultado = "Ejemplo no implementado";
      }
    });
  }

  void _ejecutarEjemploAsincrono() async {
    setState(() {
      isLoading = true;
      resultado = "";
    });

    try {
      final datos = await DartFunctions.obtenerDatos();
      setState(() {
        resultado = datos;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        resultado = "Error: $e";
        isLoading = false;
      });
    }
  }

  String _getDescription() {
    switch (widget.index) {
      case 0:
        return "Una función simple que no recibe parámetros y retorna un valor fijo. Es la forma más básica de función en Dart.";
      case 1:
        return "Función que recibe parámetros posicionales obligatorios. Los argumentos deben pasarse en el orden exacto definido.";
      case 2:
        return "Función con parámetros opcionales entre corchetes []. Permite llamar la función con o sin ciertos argumentos.";
      case 3:
        return "Función con parámetros nombrados entre llaves {}. Permite pasar argumentos por nombre y definir valores por defecto.";
      case 4:
        return "Función anónima (lambda) almacenada en una variable. Útil para operaciones cortas y callbacks.";
      case 5:
        return "Función que recibe otra función como parámetro. Permite crear código más flexible y reutilizable.";
      case 6:
        return "Función que se llama a sí misma. Útil para problemas que se pueden dividir en subproblemas similares.";
      case 7:
        return "Función que retorna un Future y puede usar await. Permite operaciones no bloqueantes y asíncronas.";
      case 8:
        return "Función generadora que produce valores bajo demanda usando yield. Eficiente en memoria para secuencias grandes.";
      case 9:
        return "Función que puede retornar diferentes tipos de resultado encapsulados en una clase personalizada.";
      case 10:
        return "Función que retorna otra función. Permite crear funciones especializadas dinámicamente.";
      case 11:
        return "Función que recibe un callback para ejecutar una acción en cada elemento de una colección.";
      case 12:
        return "Extensión que añade funcionalidad a tipos existentes sin modificar su código fuente.";
      case 13:
        return "Función que maneja errores usando try-catch, proporcionando robustez al código.";
      case 14:
        return "Función estática de clase que pertenece a la clase y no a instancias específicas.";
      default:
        return "Descripción no disponible";
    }
  }
}
