import 'package:flutter/material.dart';

class Cow {
  String status;
  String status2;
  String id;
  String breed;
  String age;
  String gender;
  String weight;
  String puberty;
  String dateOfCulling;
  String birthDate;
  String remarks;
  DateTime? dewormingDate;

  Cow({
    required this.status,
    required this.status2,
    required this.id,
    required this.breed,
    required this.age,
    required this.gender,
    required this.weight,
    required this.puberty,
    required this.dateOfCulling,
    required this.birthDate,
    required this.remarks,
    required this.dewormingDate,
  });

  Cow copyWith({
    String? status,
    String? status2,
    String? id,
    String? breed,
    String? age,
    String? gender,
    String? weight,
    String? puberty,
    String? dateOfCulling,
    String? birthDate,
    String? remarks,
    DateTime? dewormingDate,
  }) {
    return Cow(
      status: status ?? this.status,
      status2: status2 ?? this.status2,
      id: id ?? this.id,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      puberty: puberty ?? this.puberty,
      dateOfCulling: dateOfCulling ?? this.dateOfCulling,
      birthDate: birthDate ?? this.birthDate,
      remarks: remarks ?? this.remarks,
      dewormingDate: dewormingDate ?? this.dewormingDate,
    );
  }
}
