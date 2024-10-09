
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const IdadeApp());
}

class IdadeApp extends StatelessWidget {
  const IdadeApp({super.key});

  @override
  Widget build(BuildContext 
 context) {
    return MaterialApp( 
      
      title: 
        'Fase da Vida',
        
      
      
      theme: ThemeData(

        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 163, 105, 255)),
      
        colorScheme: ColorScheme.dark(),
      ),
    
      home: const MyHomePage(title: 'Fase de vida!'),
      

      
    );
  }
}

String determinarFaseDaVida(int idade) {
  if (idade < 3) {
    return "Infância";
  } else if (idade >= 3 && idade <= 12) {
    return "Pré-adolescência";
  } else if (idade >= 13 && idade <= 19) {
    return "Adolescência";
  } else if (idade >= 20 && idade <= 35) {
    return "Juventude";
  } else if (idade >= 36 && idade <= 55) {
    return "Meia-idade";
  } else {
    return "Terceira idade";
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController 
 _idadeController = TextEditingController();
  String _resultado = '';

  void _calcularFaseDaVida() {
    final idadeString = _idadeController.text;
    if (int.tryParse(idadeString) != null) {
      final idade = int.parse(idadeString);
      setState(() {
        _resultado = determinarFaseDaVida(idade);
      });
    } else {
      setState(() {
        _resultado = 'insira uma idade válida';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: 
        
 Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 

            const Text('Digite sua idade: '),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              controller: _idadeController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 42),
            ElevatedButton(
              
              onPressed: _calcularFaseDaVida,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              
            ),
          ],
        ),
      ),
    );
  }
}