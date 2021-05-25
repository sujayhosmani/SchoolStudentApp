

import 'package:json_annotation/json_annotation.dart';

import 'Address.dart';
// part 'Student.g.dart';

// @JsonSerializable()
class Student{
  final String Id;
  final String StudentId;
  final String Name;
  final String Class;
  final String Section;
  final String Gender;
  final String AdmissionNo;
  final String RollNo;
  final String Email;
  final String FatherName;
  final String MotherName;
  final String FatherOccupation;
  final String MotherOccupation;
  final String MotherPh;
  final String FatherPh;
  final String TotalPaidFee;
  final String DateOfJoining;
  final String DateOfBirth;
  final String ImageUrl;
  final Address PermanentAddress;
  final Address CurrentAddress;
  final String AdmissionCopy;
  final String Password;

  Student({this.Id, this.StudentId, this.Name, this.Class, this.Section, this.Gender, this.AdmissionNo, this.RollNo, this.Email, this.FatherName,
      this.MotherName, this.FatherOccupation, this.MotherOccupation, this.MotherPh, this.FatherPh, this.TotalPaidFee, this.DateOfJoining,
      this.DateOfBirth, this.ImageUrl, this.PermanentAddress, this.CurrentAddress, this.AdmissionCopy, this.Password});

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);

}




Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    Id: json['Id'] as String,
    StudentId: json['StudentId'] as String,
    Name: json['Name'] as String,
    Class: json['Class'] as String,
    Section: json['Section'] as String,
    Gender: json['Gender'] as String,
    AdmissionNo: json['AdmissionNo'] as String,
    RollNo: json['RollNo'] as String,
    Email: json['Email'] as String,
    FatherName: json['FatherName'] as String,
    MotherName: json['MotherName'] as String,
    FatherOccupation: json['FatherOccupation'] as String,
    MotherOccupation: json['MotherOccupation'] as String,
    MotherPh: json['MotherPh'] as String,
    FatherPh: json['FatherPh'] as String,
    TotalPaidFee: json['TotalPaidFee'] as String,
    DateOfJoining: json['DateOfJoining'] as String,
    DateOfBirth: json['DateOfBirth'] as String,
    ImageUrl: json['ImageUrl'] as String,
    PermanentAddress: json['PermanentAddress'] == null
        ? null : Address.fromJson(json['PermanentAddress'] as Map<String, dynamic>),
    CurrentAddress: json['CurrentAddress'] == null
        ? null : Address.fromJson(json['CurrentAddress'] as Map<String, dynamic>),
    AdmissionCopy: json['AdmissionCopy'] as String,
    Password: json['Password'] as String,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
  'Id': instance.Id,
  'StudentId': instance.StudentId,
  'Name': instance.Name,
  'Class': instance.Class,
  'Section': instance.Section,
  'Gender': instance.Gender,
  'AdmissionNo': instance.AdmissionNo,
  'RollNo': instance.RollNo,
  'Email': instance.Email,
  'FatherName': instance.FatherName,
  'MotherName': instance.MotherName,
  'FatherOccupation': instance.FatherOccupation,
  'MotherOccupation': instance.MotherOccupation,
  'MotherPh': instance.MotherPh,
  'FatherPh': instance.FatherPh,
  'TotalPaidFee': instance.TotalPaidFee,
  'DateOfJoining': instance.DateOfJoining,
  'DateOfBirth': instance.DateOfBirth,
  'ImageUrl': instance.ImageUrl,
  'PermanentAddress': instance.PermanentAddress,
  'CurrentAddress': instance.CurrentAddress,
  'AdmissionCopy': instance.AdmissionCopy,
  'Password': instance.Password,
};


