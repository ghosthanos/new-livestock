import 'package:flutter/material.dart';
import 'package:newlivestock/components/colors.dart';
import 'package:newlivestock/models/cow.dart';

class AboutPage extends StatefulWidget {
  final String cowId;

  const AboutPage({Key? key, required this.cowId}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // Cow object to store and update details
  Cow cow = Cow(
    id: '',
    gender: '',
    weight: '',
    puberty: '',
    dateOfCulling: '',
    birthDate: '',
    remarks: '',
    status: '', // Add default values or leave empty if not needed
    status2: '',
    breed: '',
    age: '',
    dewormingDate: null,
  );

  @override
  void initState() {
    super.initState();
    // Fetch cow details for the provided ID
    fetchCowDetails(widget.cowId); // Update cow details using cowId
  }

// Dummy function to fetch cow details
  void fetchCowDetails(String cowId) {
    // Example: Fetch details from a database or API
    // For now, we'll use dummy data
    // Replace this with your actual implementation
    setState(() {
      cow = Cow(
        id: cowId, // Update cow ID with the provided cowId
        gender: '',
        weight: '',
        puberty: '',
        dateOfCulling: '',
        birthDate: '',
        remarks: '',
        status: '',
        status2: '',
        breed: '',
        age: '',
        dewormingDate: null,
      );
    });
  }

  // Function to update cow details
  void updateCowDetails() {
    // Implement your logic to update cow details
    // For now, we'll print the updated values
    print('Updated ID: ${cow.id}');
    print('Updated Gender: ${cow.gender}');
    print('Updated Weight: ${cow.weight}');
    print('Updated Puberty: ${cow.puberty}');
    print('Updated Date of Culling: ${cow.dateOfCulling}');
    print('Updated Birth Date: ${cow.birthDate}');
    print('Updated Remarks: ${cow.remarks}');
    // Add more fields as needed
  }

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
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: const Color.fromRGBO(77, 119, 34, 1),
            iconSize: 37,
          ),
          centerTitle: true,
          title: Text(
            "About ${cow.id}",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(77, 119, 34, 1),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              color: const Color.fromRGBO(77, 119, 34, 1),
              onPressed: () {
                // Update cow details when Save button is pressed
                updateCowDetails();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                // ID
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ID',
                    border: UnderlineInputBorder(),
                  ),
                  initialValue: cow.id,
                  readOnly: false,
                ),
                SizedBox(height: 16),
                // Gender
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: UnderlineInputBorder(),
                  ),
                  initialValue: cow.gender,
                  onChanged: (value) {
                    setState(() {
                      cow.gender = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                // Weight
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Weight',
                    border: UnderlineInputBorder(),
                  ),
                  initialValue: cow.weight,
                  onChanged: (value) {
                    setState(() {
                      cow.weight = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                // Puberty
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Puberty',
                    border: UnderlineInputBorder(),
                  ),
                  initialValue: cow.puberty,
                  onChanged: (value) {
                    setState(() {
                      cow.puberty = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                // Date of Culling
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date of Culling',
                    border: UnderlineInputBorder(),
                  ),
                  initialValue: cow.dateOfCulling,
                  onChanged: (value) {
                    setState(() {
                      cow.dateOfCulling = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                // Birth Date
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Birth Date',
                    border: UnderlineInputBorder(),
                  ),
                  initialValue: cow.birthDate,
                  onChanged: (value) {
                    setState(() {
                      cow.birthDate = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                // Remarks
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Remarks',
                    border: UnderlineInputBorder(),
                  ),
                  initialValue: cow.remarks,
                  onChanged: (value) {
                    setState(() {
                      cow.remarks = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                // Add more fields as needed
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07,
          ),
          child: InkWell(
            onTap: () {
              updateCowDetails();
            },
            child: Container(
              decoration: BoxDecoration(
                color: AllColors.secondaryColor,
                borderRadius:
                    BorderRadius.circular(10), // Set border radius here
              ),
              width: MediaQuery.of(context).size.width *
                  0.9, // Adjust width as needed
              height: MediaQuery.of(context).size.width * 0.15,
              child: Center(
                child: Text(
                  'Save', // Replace with your desired text
                  style: TextStyle(
                      color: AllColors.backgroundColor,
                      fontSize: MediaQuery.of(context).size.width *
                          0.055), // Text color
                ),
              ),
            ),
          ),
        ));
  }
}
