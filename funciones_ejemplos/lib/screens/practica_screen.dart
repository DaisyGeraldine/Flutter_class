import 'package:flutter/material.dart';

class PracticeView extends StatefulWidget {
  const PracticeView({super.key});

  @override
  State<PracticeView> createState() => _PracticeViewState();
}

class _PracticeViewState extends State<PracticeView> {
  TextEditingController _numeroController = TextEditingController();
  double? _resultado;

  // 🔹 Función 1: calcular el cuadrado de un número
  double calcularCuadrado(double numero) {
    return numero * numero;
  }

  // 🔹 Función 2: calcular el área de un círculo
  double calcularAreaCirculo(double radio) {
    return 3.14159 * radio * radio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funciones Simples en Dart'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.functions, size: 80, color: Colors.deepPurple),
              SizedBox(height: 20),
              Text(
                '¡Explora y aprende!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Ingresa un número y elige una función:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Aquí irían los widgets para ingresar el número, botones y mostrar resultados.
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Número',
                ),
                controller: _numeroController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _resultado = calcularCuadrado(
                          double.parse(_numeroController.text),
                        );
                      });
                    },
                    child: Text('Calcular Cuadrado'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _resultado = calcularAreaCirculo(
                          double.parse(_numeroController.text),
                        );
                      });
                    },
                    child: Text('Calcular Área Círculo'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Resultado: ${_resultado != null ? _resultado!.toStringAsFixed(2) : '---'}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
