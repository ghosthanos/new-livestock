import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newlivestock/components/colors.dart';
import 'package:newlivestock/models/cow.dart';
import 'package:newlivestock/providers/cow_provider.dart';

class PregnancyPage extends StatefulWidget {
  final String cowId;

  const PregnancyPage({Key? key, required this.cowId}) : super(key: key);

  @override
  State<PregnancyPage> createState() => _PregnancyPageState();
}

class _PregnancyPageState extends State<PregnancyPage> {
  final _PregnancyDiagnosisDates =
      <DateTime>[]; // List to store deworming dates

  // Function to add a new deworming date
  void _addPregnancyDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        _PregnancyDiagnosisDates.add(selectedDate);
      });
    }
  }

  // Function to delete a deworming date at a specific index
  void _deletePregnancyDate(int index) {
    setState(() {
      _PregnancyDiagnosisDates.removeAt(index);
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
          "Pregnancy",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(77, 119, 34, 1),
        onPressed: _addPregnancyDate, // Call the function to add a new date
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
      body: ListView.builder(
        itemCount: _PregnancyDiagnosisDates.length,
        itemBuilder: (context, index) {
          final pubertyDate = _PregnancyDiagnosisDates[index];
          final formattedDate = DateFormat('dd MMM yyyy').format(pubertyDate);
          final formattedDay = DateFormat('EE').format(pubertyDate);

          return Dismissible(
            key: ValueKey(pubertyDate), // Unique key for dismissible
            confirmDismiss: (direction) =>
                confirmDelete(context), // Confirm deletion
            child: ListTile(
              tileColor: index % 2 == 0
                  ? const Color.fromRGBO(235, 235, 235, 1)
                  : const Color.fromARGB(255, 255, 255, 255),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width > 600
                            ? 16.0
                            : 30.0,
                      ),
                      child: Text(
                        "${index + 1}", // Display index starting from 1
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                      child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "$formattedDate,",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: "$formattedDay",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 74, 74, 74)),
                      ),
                    ]),
                  )),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: AllColors
                    .secondaryColor, // Set a distinct color for delete icon
                onPressed: () =>
                    _deletePregnancyDate(index), // Call delete function
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to confirm deletion before dismissing the ListTile
  Future<bool> confirmDelete(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content:
            const Text('Are you sure you want to delete this deworming date?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), // Cancel deletion
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true), // Confirm deletion
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
