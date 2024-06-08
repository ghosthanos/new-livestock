// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:newlivestock/providers/cow_provider.dart';

// class AddDewormingForm extends StatefulWidget {
//   final String cowId;

//   const AddDewormingForm({Key? key, required this.cowId}) : super(key: key);

//   @override
//   _AddDewormingFormState createState() => _AddDewormingFormState();
// }

// class _AddDewormingFormState extends State<AddDewormingForm> {
//   final _formKey = GlobalKey<FormState>();
//   DateTime? _dewormingDate;
//   String _formattedDate = ""; // String to hold formatted date

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text("Add De-worming Date"),
//       content: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Date Picker Field
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'De-worming Date',
//               ),
//               readOnly: true, // Disable text editing
//               onTap: () async {
//                 final selectedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2023), // Adjust minimum date if needed
//                   lastDate: DateTime.now(), // Adjust maximum date if needed
//                 );
//                 if (selectedDate != null) {
//                   setState(() {
//                     _dewormingDate = selectedDate;
//                     _formattedDate =
//                         DateFormat('yyyy-MM-dd').format(selectedDate);
//                   });
//                 }
//               },
//               validator: (value) {
//                 if (_dewormingDate == null) {
//                   return 'Please select a de-worming date';
//                 }
//                 return null;
//               },
//             ),
//             // Display the selected date (optional)
//             Text(
//               'Selected Date: $_formattedDate',
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
//               final selectedDate = _dewormingDate;
//               if (selectedDate != null) {
//                 // Update cow data in CowProvider using cowId and selectedDate
//                 Provider.of<cowProvider>(context, listen: false)
//                     .updateCowDewormingDate(widget.cowId, selectedDate);

//                 Navigator.of(context).pop(); // Close the dialog
//               }
//             }
//           },
//           child: Text('Save'),
//         ),
//       ],
//     );
//   }
// }
