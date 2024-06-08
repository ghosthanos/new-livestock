import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newlivestock/components/colors.dart';

class Insemination extends StatefulWidget {
  final String cowId;

  const Insemination({Key? key, required this.cowId}) : super(key: key);

  @override
  State<Insemination> createState() => _InseminationState();
}

class _InseminationState extends State<Insemination> {
  // Lists to store insemination records
  final _semenType = <String>[];
  final _inseminationDates = <DateTime>[];
  final _handledBy = <String>[];
  final _remarks = <String>[];
  final _breed = <String>[];
  final _inseminatedBy = <String>[];

  // TextEditingControllers for user input
  final TextEditingController semenTypeController = TextEditingController();
  final TextEditingController handledByController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController inseminatedByController = TextEditingController();

  // Function to add a new insemination record
  Future<void> _addInseminationRecord() async {
    DateTime? selectedDate;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Insemination Date'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Insemination Date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020, 1, 1),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    selectedDate = date;
                    Navigator.pop(
                        context); // Close the dialog after selecting the date
                  }
                },
                child: const Text('Select Date'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Cancel
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );

    if (selectedDate != null) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Insemination Record'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: semenTypeController,
                  decoration: const InputDecoration(labelText: 'Semen Type'),
                ),
                TextField(
                  controller: handledByController,
                  decoration: const InputDecoration(labelText: 'Handled By'),
                ),
                TextField(
                  controller: remarksController,
                  decoration: const InputDecoration(labelText: 'Remarks'),
                ),
                TextField(
                  controller: breedController,
                  decoration: const InputDecoration(labelText: 'Breed'),
                ),
                TextField(
                  controller: inseminatedByController,
                  decoration:
                      const InputDecoration(labelText: 'Inseminated By'),
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
                  final semenType = semenTypeController.text;
                  final handledBy = handledByController.text;
                  final remarks = remarksController.text;
                  final breed = breedController.text;
                  final inseminatedBy = inseminatedByController.text;

                  if (semenType.isNotEmpty &&
                      handledBy.isNotEmpty &&
                      remarks.isNotEmpty &&
                      breed.isNotEmpty &&
                      inseminatedBy.isNotEmpty) {
                    setState(() {
                      _semenType.add(semenType);
                      _inseminationDates.add(selectedDate!);
                      _handledBy.add(handledBy);
                      _remarks.add(remarks);
                      _breed.add(breed);
                      _inseminatedBy.add(inseminatedBy);
                      semenTypeController.clear();
                      handledByController.clear();
                      remarksController.clear();
                      breedController.clear();
                      inseminatedByController.clear();
                    });
                    Navigator.pop(context, true); // Close dialog after adding
                  } else {
                    // Show error message if any field is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Please fill all fields (Semen Type, Handled By, Remarks, Breed, Inseminated By).'),
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
  }

  // Function to delete an insemination record
  void _deleteInseminationRecord(int index) {
    setState(() {
      _semenType.removeAt(index);
      _inseminationDates.removeAt(index);
      _handledBy.removeAt(index);
      _remarks.removeAt(index);
      _breed.removeAt(index);
      _inseminatedBy.removeAt(index);
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
          "Insemination",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),

      // Display insemination records in a ListView builder
      body: ListView.builder(
        itemCount: _semenType.length,
        itemBuilder: (context, index) {
          final semenType = _semenType[index];
          final inseminationDate = _inseminationDates[index];
          final handledBy = _handledBy[index];
          final remarks = _remarks[index];
          final breed = _breed[index];
          final inseminatedBy = _inseminatedBy[index];
          final formattedDate =
              DateFormat('dd MMM yyyy').format(inseminationDate);

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
                  "Semen Type:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Text(semenType),
                const Text(
                  "Insemination Date:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Text(formattedDate),
                const Text(
                  "Handled By:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Text(handledBy),
                const Text(
                  "Remarks:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Text(remarks),
                const Text(
                  "Breed:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Text(breed),
                const Text(
                  "Inseminated By:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Text(inseminatedBy),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: AllColors.secondaryColor,
              onPressed: () => _deleteInseminationRecord(index),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(77, 119, 34, 1),
        onPressed:
            _addInseminationRecord, // Call the function to add a new record
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
    );
  }
}
