import 'package:flutter/material.dart';
import 'package:newlivestock/models/cow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newlivestock/pages/homepage.dart';
import 'package:newlivestock/pages/individual_cow_details.dart';
import 'package:newlivestock/providers/cow_provider.dart';

class AllCowsDetails extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cows = ref.watch(cowsProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(193, 215, 172, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(157, 208, 104, 1),
        shadowColor: const Color.fromRGBO(128, 45, 83, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromRGBO(77, 119, 34, 1),
          iconSize: 37,
        ),
        centerTitle: true,
        title: Text(
          "All Cattle",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                // Implement search functionality here
              },
              icon: const Icon(
                Icons.search,
                color: Color.fromRGBO(77, 119, 34, 1),
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Id",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Breed",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Age",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final cow = cows[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IndividualCowDetail(
                                cowId: cow.id,
                              )),
                    );
                  },
                  child: ListTile(
                    tileColor: index % 2 == 0
                        ? const Color.fromRGBO(235, 235, 235, 1)
                        : const Color.fromARGB(255, 255, 255, 255),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.height / 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: getStatusColor(cow.status),
                              ),
                              child: Center(
                                child: Text(
                                  cow.status,
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.height / 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: getStatusColor(cow.status2),
                              ),
                              child: Center(
                                child: Text(
                                  cow.status2,
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 28,
                          child: Center(
                            child: Text(
                              cow.id,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 28,
                          child: Center(
                            child: Text(
                              cow.breed,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 15,
                          height: MediaQuery.of(context).size.height / 28,
                          child: Center(
                            child: Text(
                              cow.age,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: cows.length,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(77, 119, 34, 1),
        onPressed: () {
          _openAddCowForm(context, ref);
        },
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        shape: const CircleBorder(),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Healthy':
        return Colors.green;
      case 'Sick':
        return Colors.red;
      case 'Pregnant':
        return Colors.blue;
      case 'Not Pregnant':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

  void _openAddCowForm(BuildContext context, WidgetRef ref) {
    showDialog<Map<String, String>>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Cow'),
        content: _AddCowForm(),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final _statusController = _AddCowForm._statusController.text;
              final _status2Controller = _AddCowForm._status2Controller.text;
              final _idController = _AddCowForm._idController.text;
              final _breedController = _AddCowForm._breedController.text;
              final _ageController = _AddCowForm._ageController.text;

              if (_statusController.isNotEmpty &&
                  _status2Controller.isNotEmpty &&
                  _idController.isNotEmpty &&
                  _breedController.isNotEmpty &&
                  _ageController.isNotEmpty) {
                final newCow = Cow(
                  status: _statusController,
                  status2: _status2Controller,
                  id: _idController,
                  breed: _breedController,
                  age: _ageController,
                  gender: "", // Provide a default value for unused arguments
                  weight: "", // Provide a default value
                  puberty:
                      "false", // Provide a default value (can be bool or DateTime)
                  dateOfCulling: "null", // Provide a default value
                  birthDate: "null", // Provide a default value
                  remarks: "null",
                  dewormingDate: null, // Provide a default value
                );
                ref.read(cowsProvider.notifier).addCow(newCow);
                Navigator.pop(context);
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _AddCowForm extends ConsumerWidget {
  static final _statusController = TextEditingController();
  static final _status2Controller = TextEditingController();
  static final _idController = TextEditingController();
  static final _breedController = TextEditingController();
  static final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _statusController,
            decoration: InputDecoration(labelText: 'Status'),
          ),
          TextFormField(
            controller: _status2Controller,
            decoration: InputDecoration(labelText: 'Status 2'),
          ),
          TextFormField(
            controller: _idController,
            decoration: InputDecoration(labelText: 'ID'),
          ),
          TextFormField(
            controller: _breedController,
            decoration: InputDecoration(labelText: 'Breed'),
          ),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(labelText: 'Age'),
          ),
        ],
      ),
    );
  }
}

final addCowFormProvider = StateProvider.autoDispose((ref) => {
      'status': '',
      'status2': '',
      'id': '',
      'breed': '',
      'age': '',
    });
