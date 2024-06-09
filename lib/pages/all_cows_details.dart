import 'package:flutter/material.dart';
import 'package:newlivestock/models/cow.dart';
import 'package:newlivestock/pages/homepage.dart';
import 'package:newlivestock/pages/individual_cow_details.dart';

class AllCowsDetails extends StatefulWidget {
  @override
  _AllCowsDetailsState createState() => _AllCowsDetailsState();
}

class _AllCowsDetailsState extends State<AllCowsDetails> {
  final List<Cow> _cows = [];

  final _statusController = TextEditingController();
  final _status2Controller = TextEditingController();
  final _idController = TextEditingController();
  final _breedController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                final cow = _cows[index];

                return Dismissible(
                  key: Key(cow.id),
                  onDismissed: (direction) {
                    setState(() {
                      _cows.removeAt(index);
                    });
                  },
                  child: GestureDetector(
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
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _openEditCowForm(context, index, cow);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                _cows.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: _cows.length,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(77, 119, 34, 1),
        onPressed: () {
          _openAddCowForm(context);
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

  void _openAddCowForm(BuildContext context) {
    _statusController.clear();
    _status2Controller.clear();
    _idController.clear();
    _breedController.clear();
    _ageController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Cow'),
        content: Form(
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
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newCow = Cow(
                status: _statusController.text,
                status2: _status2Controller.text,
                id: _idController.text,
                breed: _breedController.text,
                age: _ageController.text,
                gender: "",
                weight: "",
                puberty: "false",
                dateOfCulling: "null",
                birthDate: "null",
                remarks: "null",
                dewormingDate: null,
              );
              setState(() {
                _cows.add(newCow);
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _openEditCowForm(BuildContext context, int index, Cow cow) {
    _statusController.text = cow.status;
    _status2Controller.text = cow.status2;
    _idController.text = cow.id;
    _breedController.text = cow.breed;
    _ageController.text = cow.age;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Cow'),
        content: Form(
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
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final editedCow = Cow(
                status: _statusController.text,
                status2: _status2Controller.text,
                id: _idController.text,
                breed: _breedController.text,
                age: _ageController.text,
                gender: cow.gender,
                weight: cow.weight,
                puberty: cow.puberty,
                dateOfCulling: cow.dateOfCulling,
                birthDate: cow.birthDate,
                remarks: cow.remarks,
                dewormingDate: cow.dewormingDate,
              );
              setState(() {
                _cows[index] = editedCow;
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
