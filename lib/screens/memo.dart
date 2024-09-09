import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Memo extends StatefulWidget {
  const Memo({super.key});

  @override
  State<Memo> createState() => _MemoState();
}

class _MemoState extends State<Memo> {
  List<Map<String, dynamic>> memoList = [];
  String getFormattedDateTime() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String name = args['name'];
    final int blackAndWhitePages = args['blackAndWhitePages'];
    final int colorPages = args['colorPages'];
    final double totalCost = args['totalCost'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Memo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[500],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "MiftahPrint",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text("Name: $name", style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 5),
                Text(
                    "Black & White Pages: ${blackAndWhitePages}×1.75৳ = ${blackAndWhitePages * 1.75}৳",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 5),
                Text(
                    "Color Pages: ${colorPages}×2.5৳ = ${colorPages * 2.5}৳",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 5),
                Text("Total Cost: $totalCost৳",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                Text("Date & Time: ${getFormattedDateTime()}",
                    style: const TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {

                },
                child: const Text("Save memo")),
          ),
        ],
      ),
    );
  }
}
