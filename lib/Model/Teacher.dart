import 'package:json_annotation/json_annotation.dart';

import 'Address.dart';

part 'Teacher.g.dart';

@JsonSerializable()
class Teacher{
  final String Id;
  final String TeacherId;
  final String FirstName;
  final String Gender;
  final String DateOfBirth;
  final String TeacherPh;
  final String DateOfJoining;
  final String Qualification;
  final String Experience;
  final bool isCTR;
  final String isCTRClass;
  final String isCTRSection;
  final Address PermanentAddress;
  final List<TeacherSubjects> TSubjects;
  final String ImageUrl;
  final Address CurrentAddress;
  final String Description;
  final String Email;
  final String Password;
  final String LastName;

  Teacher({this.Id, this.TeacherId, this.FirstName, this.Gender, this.DateOfBirth, this.TeacherPh, this.DateOfJoining, this.Qualification,
      this.Experience, this.isCTR, this.isCTRClass, this.isCTRSection, this.PermanentAddress, this.TSubjects, this.ImageUrl, this.CurrentAddress,
      this.Description, this.Email, this.Password, this.LastName});

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}

@JsonSerializable()
class TeacherSubjects
{
  final String subject;

  TeacherSubjects({this.subject});
// final List<TeacherClasses> classes;

  factory TeacherSubjects.fromJson(Map<String, dynamic> json) =>
      _$TeacherSubjectsFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherSubjectsToJson(this);
}

@JsonSerializable()
class TeacherClasses
{
  final String Std;
  final String Section;

  TeacherClasses({this.Std, this.Section});

  factory TeacherClasses.fromJson(Map<String, dynamic> json) =>
      _$TeacherClassesFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherClassesToJson(this);
}