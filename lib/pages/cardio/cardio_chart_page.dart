import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';

class CardioChartPage extends StatefulWidget {
  const CardioChartPage({super.key});
  @override
  State<CardioChartPage> createState() => _CardioChartPageState();
}

class _CardioChartPageState extends State<CardioChartPage> {
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

  List<FlSpot> _generateSpots() {
    return cardioData.asMap().entries.map((entry) {
      return FlSpot(
        entry.key.toDouble(),
        (entry.value['distance'] as num).toDouble(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final spots = _generateSpots();
    return Scaffold(
      appBar: AppBar(title: const Text("Gráfico de Cárdio")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(show: true),
            borderData: FlBorderData(show: true),
            lineBarsData: [LineChartBarData(spots: spots, isCurved: true)],
          ),
        ),
      ),
    );
  }
}
