

import 'dart:io';

import 'AssignmentFiles.dart';

class SingleFileDoc{
  final String Id;
  final String FileName;
  final String From;
  final String UploadingDate;
  final String Subject;
  final String ClassSection;
  final String StudentName;
  final String Sid;
  final AssignmentFiles FilePath;
  final File Files;

  SingleFileDoc({this.Id, this.FileName, this.From, this.UploadingDate, this.Subject, this.ClassSection, this.StudentName, this.Sid, this.FilePath, this.Files});
}