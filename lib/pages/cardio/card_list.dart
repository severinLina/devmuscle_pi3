import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CardioListPage extends StatefulWidget {
  const CardioListPage({super.key});
  @override
  State<CardioListPage> createState() => _CardioListPageState();
}

class _CardioListPageState extends State<CardioListPage> {
  List<Map<String, dynamic>> cardioData = [];
  @override
  void initState() {
    super.initState();
    _loadCardioData();
  }

  Future<void> _loadCardioData() async {
    final prefs = await SharedPreferences.getInstance();
    final cardios = prefs.getStringList('cardioSessions') ?? [];
    setState(() {
      cardioData = cardios
          .map((e) => jsonDecode(e) as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Histórico de Cárdio")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cardioData.length,
        itemBuilder: (context, index) {
          final item = cardioData[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.directions_run),
              title: Text("${item['type']} - ${item['distance']} km"),
              subtitle: Text("Duração: ${item['duration']} min"),
              trailing: Text(item['date'].toString().split('T').first),
            ),
          );
        },
      ),
    );
  }
}
