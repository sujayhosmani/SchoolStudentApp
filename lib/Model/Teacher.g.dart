// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return Teacher(
    Id: json['Id'] as String,
    TeacherId: json['TeacherId'] as String,
    FirstName: json['FirstName'] as String,
    Gender: json['Gender'] as String,
    DateOfBirth: json['DateOfBirth'] as String,
    TeacherPh: json['TeacherPh'] as String,
    DateOfJoining: json['DateOfJoining'] as String,
    Qualification: json['Qualification'] as String,
    Experience: json['Experience'] as String,
    isCTR: json['isCTR'] as bool,
    isCTRClass: json['isCTRClass'] as String,
    isCTRSection: json['isCTRSection'] as String,
    PermanentAddress:
        Address.fromJson(json['PermanentAddress'] as Map<String, dynamic>),
    TSubjects: (json['TSubjects'] as List<dynamic>)
        .map((e) => TeacherSubjects.fromJson(e as Map<String, dynamic>))
        .toList(),
    ImageUrl: json['ImageUrl'] as String,
    CurrentAddress:
        Address.fromJson(json['CurrentAddress'] as Map<String, dynamic>),
    Description: json['Description'] as String,
    Email: json['Email'] as String,
    Password: json['Password'] as String,
    LastName: json['LastName'] as String,
  );
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'Id': instance.Id,
      'TeacherId': instance.TeacherId,
      'FirstName': instance.FirstName,
      'Gender': instance.Gender,
      'DateOfBirth': instance.DateOfBirth,
      'TeacherPh': instance.TeacherPh,
      'DateOfJoining': instance.DateOfJoining,
      'Qualification': instance.Qualification,
      'Experience': instance.Experience,
      'isCTR': instance.isCTR,
      'isCTRClass': instance.isCTRClass,
      'isCTRSection': instance.isCTRSection,
      'PermanentAddress': instance.PermanentAddress,
      'TSubjects': instance.TSubjects,
      'ImageUrl': instance.ImageUrl,
      'CurrentAddress': instance.CurrentAddress,
      'Description': instance.Description,
      'Email': instance.Email,
      'Password': instance.Password,
      'LastName': instance.LastName,
    };

TeacherSubjects _$TeacherSubjectsFromJson(Map<String, dynamic> json) {
  return TeacherSubjects(
    subject: json['subject'] as String,
  );
}

Map<String, dynamic> _$TeacherSubjectsToJson(TeacherSubjects instance) =>
    <String, dynamic>{
      'subject': instance.subject,
    };

TeacherClasses _$TeacherClassesFromJson(Map<String, dynamic> json) {
  return TeacherClasses(
    Std: json['Std'] as String,
    Section: json['Section'] as String,
  );
}

Map<String, dynamic> _$TeacherClassesToJson(TeacherClasses instance) =>
    <String, dynamic>{
      'Std': instance.Std,
      'Section': instance.Section,
    };
