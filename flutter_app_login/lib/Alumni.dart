// To parse this JSON data, do
//
//     final alumni = alumniFromJson(jsonString);

import 'dart:convert';

List<Alumni> alumniFromJson(String str) => List<Alumni>.from(json.decode(str).map((x) => Alumni.fromJson(x)));

String alumniToJson(List<Alumni> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Alumni {
  Alumni({
    this.alumniCitizenship,
    this.alumniEmail,
    this.alumniName,
    this.batchName,
    this.eduLevel,
    this.gender,
    this.graduateYear,
    this.password,
    this.phoneNo,
    this.title,
  });

  String alumniCitizenship;
  String alumniEmail;
  String alumniName;
  String batchName;
  EduLevel eduLevel;
  Gender gender;
  int graduateYear;
  String password;
  int phoneNo;
  String title;

  factory Alumni.fromJson(Map<String, dynamic> json) => Alumni(
    alumniCitizenship: json["alumniCitizenship"],
    alumniEmail: json["alumniEmail"],
    alumniName: json["alumniName"],
    batchName: json["batchName"],
    eduLevel: eduLevelValues.map[json["eduLevel"]],
    gender: genderValues.map[json["gender"]],
    graduateYear: json["graduateYear"],
    password: json["password"],
    phoneNo: json["phoneNo"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "alumniCitizenship": alumniCitizenship,
    "alumniEmail": alumniEmail,
    "alumniName": alumniName,
    "batchName": batchName,
    "eduLevel": eduLevelValues.reverse[eduLevel],
    "gender": genderValues.reverse[gender],
    "graduateYear": graduateYear,
    "password": password,
    "phoneNo": phoneNo,
    "title": title,
  };
}

enum EduLevel { DIPLOMA }

final eduLevelValues = EnumValues({
  "Diploma": EduLevel.DIPLOMA
});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "Male": Gender.MALE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}