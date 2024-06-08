import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newlivestock/components/colors.dart';

class BirthWeight extends StatefulWidget {
  final String cowId;

  const BirthWeight({Key? key, required this.cowId}) : super(key: key);

  @override
  State<BirthWeight> createState() => _BirthWeightState();
}

class _BirthWeightState extends State<BirthWeight> {
  // Lists to store weight records
  final _birthweightDates = <DateTime>[];
  final _birthweights = <double>[];

  // TextEditingController for weight input
  final TextEditingController weightController = TextEditingController();

  // Function to add a new weight record
  Future<void> _addBirthWeightDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      // Show weight input dialog after selecting a date
      showDialog(
        context: context,
        builder: (context) {
          weightController.text = ""; // Clear weight field before showing
          return AlertDialog(
            title: const Text("Enter Birthweight"),
            content: TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Enter Birthweight (kg)",
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // Cancel
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  // Add weight record on confirmation
                  final weight = double.tryParse(weightController.text);
                  if (weight != null) {
                    setState(() {
                      _birthweightDates.add(selectedDate);
                      _birthweights.add(weight);
                      Navigator.pop(context); // Close weight input dialog
                    });
                  } else {
                    // Show error message if weight is invalid
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please enter a valid weight.'),
                        backgroundColor: AllColors.secondaryColor,
                      ),
                    );
                  }
                },
                child: const Text("Add"),
              ),
            ],
          );
        },
      );
    }
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
          "Weight Records",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.save),
        //     color: const Color.fromRGBO(77, 119, 34, 1),
        //     onPressed: () {},
        //   ),
        // ],
      ),

      // Display weight records in a ListView builder
      body: ListView.builder(
        itemCount: _birthweightDates.length,
        itemBuilder: (context, index) {
          final birthweightDate = _birthweightDates[index];
          final formattedDate =
              DateFormat('dd MMM yyyy').format(birthweightDate);
          final formattedDay = DateFormat('EE').format(birthweightDate);
          final birthweight = _birthweights[index];

          // Customize the ListTile to display weight information in a column
          return ListTile(
            tileColor: index % 2 == 0
                ? Color.fromRGBO(235, 235, 235, 1)
                : const Color.fromARGB(255, 255, 255, 255),
            title: Column(
              // Use Column for vertical layout
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align content to the left
              children: [
                Text(
                  "Record ${index + 1}", // Display index starting from 1
                  style: const TextStyle(
                      fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  // Use Row for horizontal layout within the Column
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date:",
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  // Another Row for weight display
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weight:",
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${birthweight.toStringAsFixed(2)} kg", // Display weight with 2 decimal places
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: AllColors
                  .secondaryColor, // Set a distinct color for delete icon
              onPressed: () => _deleteBirthWeightDate(
                  index), // Call delete function (assuming you have it)
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(77, 119, 34, 1),
        onPressed:
            _addBirthWeightDate, // Call the function to initiate weight record addition
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
    );
  }

  // Function to delete a weight record (implementation not provided)
  void _deleteBirthWeightDate(int index) {
    // Your logic to remove the weight record at index from the lists
    setState(() {
      _birthweightDates.removeAt(index);
      _birthweights.removeAt(index);
    });
  }
}
