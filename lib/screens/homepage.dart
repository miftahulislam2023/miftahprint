import 'package:flutter/material.dart';
import 'package:miftahprint/utils/app_routes.dart';
import 'package:miftahprint/widgets/button.dart';
import 'package:miftahprint/widgets/input_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialize TextEditingControllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bwPageController = TextEditingController();
  final TextEditingController colorPageController = TextEditingController();

  String result = "Total cost: ৳0.00";
  void showResult() {
    // Parse the inputs, defaulting to 0 if input is empty
    int bwPages = int.tryParse(bwPageController.text) ?? 0;
    int colorPages = int.tryParse(colorPageController.text) ?? 0;
    double totalCost = (bwPages * 1.75) + (colorPages * 2.5);
    setState(() {
      result = "Total cost: ৳${totalCost.toStringAsFixed(2)}";
    });
  }

  void showMemo() {
    String name = nameController.text.toString();
    int bwPages = int.tryParse(bwPageController.text) ?? 0;
    int colorPages = int.tryParse(colorPageController.text) ?? 0;
    double totalCost = (bwPages * 1.75) + (colorPages * 2.5);
    Navigator.pushNamed(context, AppRoutes.memo, arguments: {
      'name': name,
      'blackAndWhitePages': bwPages,
      'colorPages': colorPages,
      'totalCost': totalCost,
    });
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    nameController.dispose();
    bwPageController.dispose();
    colorPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "MiftahPrint",
          style: TextStyle(color: Colors.white60),
        ),
        backgroundColor: Colors.teal[500],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Printing Your Ideas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 15),
            InputText(hint: "Enter your name", controller: nameController),
            InputText(
              controller: bwPageController,
              hint: "B&W pages",
              keyBoardType: TextInputType.number,
            ),
            InputText(
              hint: "Color pages",
              controller: colorPageController,
              keyBoardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Button(
                  onPressed: showResult,
                  buttonText: 'Show Total',
                ),
                Expanded(child: Container()),
                Button(
                  onPressed: showMemo,
                  buttonText: 'Show Memo',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
