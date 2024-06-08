// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:newlivestock/providers/cow_provider.dart';
// import 'package:newlivestock/models/cow.dart';

// class AddCowForm extends StatefulWidget {
//   const AddCowForm({Key? key}) : super(key: key);

//   @override
//   _AddCowFormState createState() => _AddCowFormState();
// }

// class _AddCowFormState extends State<AddCowForm> {
//   final _formKey = GlobalKey<FormState>();
//   final Map<String, String> _formData = {};

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Add Cow'),
//       content: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Status'),
//               onSaved: (value) => _formData['status'] = value ?? '',
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter a status';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Status 2'),
//               onSaved: (value) => _formData['status2'] = value ?? '',
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter status 2';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'ID'),
//               onSaved: (value) => _formData['id'] = value ?? '',
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter an ID';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Breed'),
//               onSaved: (value) => _formData['breed'] = value ?? '',
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter a breed';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Age'),
//               onSaved: (value) => _formData['age'] = value ?? '',
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter an age';
//                 }
//                 return null;
//               },
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             if (_formKey.currentState!.validate()) {
//               _formKey.currentState!.save();
//               final newCow = Cow(
//                 status: _formData['status']!,
//                 status2: _formData['status2']!,
//                 id: _formData['id']!,
//                 breed: _formData['breed']!,
//                 age: _formData['age']!,
//                 gender: "", // Provide a default value for unused arguments
//                 weight: "0.0", // Provide a default value
//                 puberty: "false", // Provide a default value
//                 dateOfCulling: "null", // Provide a default value
//                 birthDate: "null", // Provide a default value
//                 remarks: "",
//                 dewormingDate: null,
//               );
//               Provider.of<CowProvider>(context, listen: false).addCow(newCow);
//               Navigator.of(context).pop();
//             }
//           },
//           child: Text('Save'),
//         ),
//       ],
//     );
//   }
// }
