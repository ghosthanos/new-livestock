import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newlivestock/components/colors.dart';

class Treatment extends StatefulWidget {
  final String cowId;

  const Treatment({Key? key, required this.cowId}) : super(key: key);

  @override
  State<Treatment> createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
  // Lists to store treatment records (strings for simplicity)
  final _diagnosis = <String>[];
  final _medicines = <String>[];
  final _labreport = <String>[];

  // TextEditingControllers for user input
  final TextEditingController diagnosisController = TextEditingController();
  final TextEditingController medicinesController = TextEditingController();
  final TextEditingController labreportController = TextEditingController();

  // Function to add a new treatment record
  Future<void> _addTreatmentRecord() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Treatment Record'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: diagnosisController,
                decoration: const InputDecoration(labelText: 'Diagnosis'),
              ),
              TextField(
                controller: medicinesController,
                decoration: const InputDecoration(labelText: 'Medicines'),
              ),
              TextField(
                controller: labreportController,
                decoration: const InputDecoration(labelText: 'Lab Report'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Cancel
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final diagnosis = diagnosisController.text;
                final medicines = medicinesController.text;
                final labreport = labreportController.text;

                if (diagnosis.isNotEmpty &&
                    medicines.isNotEmpty &&
                    labreport.isNotEmpty) {
                  setState(() {
                    _diagnosis.add(diagnosis);
                    _medicines.add(medicines);
                    _labreport.add(labreport);
                    diagnosisController.clear();
                    medicinesController.clear();
                    labreportController.clear();
                  });
                  Navigator.pop(context, true); // Close dialog after adding
                } else {
                  // Show error message if any field is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Please fill all fields (Diagnosis, Medicines, Lab Report).'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Function to delete a treatment record
  void _deleteTreatmentRecord(int index) {
    setState(() {
      _diagnosis.removeAt(index);
      _medicines.removeAt(index);
      _labreport.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.primaryColor,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(157, 208, 104, 1),
        shadowColor: const Color.fromRGBO(128, 45, 83, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromRGBO(77, 119, 34, 1),
          iconSize: 37,
        ),
        centerTitle: true,
        title: const Text(
          "Treatment Records",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),

      // Display treatment records in a ListView builder
      body: ListView.builder(
        itemCount: _diagnosis.length,
        itemBuilder: (context, index) {
          final diagnosis = _diagnosis[index];
          final medicines = _medicines[index];
          final labreport = _labreport[index];

          // Customize the ListTile to display information
          return ListTile(
            tileColor: index % 2 == 0
                ? const Color.fromRGBO(235, 235, 235, 1)
                : const Color.fromARGB(255, 255, 255, 255),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Record ${index + 1}",
                  style: const TextStyle(
                      fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Diagnosis:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Text(diagnosis),
                const Text(
                  "Medicines:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Text(medicines),
                const Text(
                  "Lab Report:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Text(labreport),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: AllColors.secondaryColor,
              onPressed: () => _deleteTreatmentRecord(index),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(77, 119, 34, 1),
        onPressed: _addTreatmentRecord, // Call the function to add a new record
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
    );
  }
}
