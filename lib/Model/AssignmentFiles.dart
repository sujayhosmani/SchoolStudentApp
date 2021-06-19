import 'dart:io';

class AssignmentFiles{
   String ImgUrl;
   String UploadedDate;
   String Type;
   File AssigFile;
   int Key;
   bool isUploaded;
   bool isUploading;

  AssignmentFiles({this.ImgUrl, this.UploadedDate, this.Type, this.Key, this.AssigFile, this.isUploaded, this.isUploading});

  factory AssignmentFiles.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFilesFromJson(json);
  Map<String, dynamic> toJson() => _$AssignmentFilesToJson(this);
}


AssignmentFiles _$AssignmentFilesFromJson(Map<String, dynamic> json) {
  return AssignmentFiles(
    ImgUrl: json['ImgUrl'] as String,
    UploadedDate: json['UploadedDate'] as String,
    Type: json['Type'] as String,
    Key: json['Key'] as int,
    AssigFile: json['AssigFile'] as File,
    isUploaded: json['isUploaded'] as bool,
    isUploading: json['isUploading'] as bool,
  );
}

Map<String, dynamic> _$AssignmentFilesToJson(AssignmentFiles instance) => <String, dynamic>{
  'ImgUrl': instance.ImgUrl,
  'UploadedDate': instance.UploadedDate,
  'Type': instance.Type,
  'Key': instance.Key,
  'AssigFile': instance.AssigFile,
  'isUploaded': instance.isUploaded,
  'isUploading': instance.isUploading,
};