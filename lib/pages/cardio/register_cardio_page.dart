import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RegisterCardioPage extends StatefulWidget {
  const RegisterCardioPage({super.key});
  @override
  State<RegisterCardioPage> createState() => _RegisterCardioPageState();
}

class _RegisterCardioPageState extends State<RegisterCardioPage> {
  final _formKey = GlobalKey<FormState>();
  String _exerciseType = "Corrida";
  double? _distance;
  int? _duration;
  Future<void> _saveCardio() async {
    final prefs = await SharedPreferences.getInstance();
    final cardios = prefs.getStringList('cardioSessions') ?? [];
    final entry = {
      "type": _exerciseType,
      "distance": _distance,
      "duration": _duration,
      "date": DateTime.now().toIso8601String(),
    };
    cardios.add(jsonEncode(entry));
    await prefs.setStringList('cardioSessions', cardios);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrar atividade de cárdio")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Tipo de exercício",
                ),
                value: _exerciseType,
                items: const [
                  DropdownMenuItem(value: "Corrida", child: Text("Corrida")),
                  DropdownMenuItem(
                    value: "Caminhada",
                    child: Text("Caminhada"),
                  ),
                  DropdownMenuItem(value: "Bike", child: Text("Bike")),
                  DropdownMenuItem(
                    value: "musculação",
                    child: Text("musculação"),
                  ),
                ],
                onChanged: (val) => setState(() => _exerciseType = val!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Distância (km)"),
                keyboardType: TextInputType.number,
                onSaved: (val) => _distance = double.tryParse(val!),
                validator: (val) => val!.isEmpty ? "Insira a distância" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Duração (minutos)",
                ),
                keyboardType: TextInputType.number,
                onSaved: (val) => _duration = int.tryParse(val!),
                validator: (val) => val!.isEmpty ? "Insira a duração" : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _saveCardio();
                  }
                },
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
