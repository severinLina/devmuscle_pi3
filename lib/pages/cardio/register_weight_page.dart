import 'package:flutter/material.dart';

class RegisterWeightPage extends StatefulWidget {
  const RegisterWeightPage({super.key});

  @override
  State<RegisterWeightPage> createState() => _RegisterWeightPageState();
}

class _RegisterWeightPageState extends State<RegisterWeightPage> {
  final _controller = TextEditingController();

  Future<void> _saveWeight() async {
    final weight = double.tryParse(_controller.text);
    if (weight != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Peso $weight kg registrado com sucesso!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrar Peso")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Peso (kg)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _saveWeight, child: const Text("Salvar")),
          ],
        ),
      ),
    );
  }
}
