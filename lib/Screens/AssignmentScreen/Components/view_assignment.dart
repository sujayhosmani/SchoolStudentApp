import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_guardian/Model/Assignment.dart';
import 'package:my_guardian/Model/AssignmentFiles.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/Model/SubmitAssignment.dart';
import 'package:my_guardian/NetworkModule/api_base.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/Providers/assignment_provider.dart';
import 'package:my_guardian/Providers/global_provider.dart';
import 'package:my_guardian/Providers/student_provider.dart';
import 'package:my_guardian/Screens/AssignmentScreen/Widgets/image_upload.dart';
import 'package:my_guardian/Widgets/input.dart';
import 'package:provider/provider.dart';

class ViewAssignment extends StatefulWidget {
  final Assignment assig;
  final int index;

  const ViewAssignment({Key key, this.assig, this.index}) : super(key: key);

  @override
  _ViewAssignmentState createState() => _ViewAssignmentState();
}

class _ViewAssignmentState extends State<ViewAssignment> {
  TextEditingController mRemark = TextEditingController();
  bool isSubmitted = false;
  List<AssignmentFiles> networkAssignmentFiles = [];
  File _imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    Provider.of<AssignmentProvider>(context, listen: false).addInitialFromNetwork(context, widget.assig);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment"),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,20,10, 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.assig.Title),
                        Text(widget.assig.Std + "th " + widget.assig.Section)
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(widget.assig.SubjectName),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(widget.assig.Description),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("End Date: " + widget.assig.EndDate),
                        Text(widget.assig.Status)
                      ],
                    ),
                  ),
                  Divider(),

                  Consumer<AssignmentProvider>(builder: (context, imgPro, child){
                    return imgPro.images.length > 0 ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        imgPro.isSubmitted && imgPro.subAss.StudentRemark != null ? imgPro.subAss.StudentRemark != "" ?
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Text("Student: ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                                  Text(imgPro.subAss.StudentRemark),
                                ],
                              ),
                            ),
                            Divider()
                          ],
                        ) : SizedBox.shrink()  : NormalInputText(title: "Enter Remarks",label: "Remarks",mCtrl: mRemark,),
                        imgPro.isSubmitted && imgPro.subAss.Remark != null ?
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text("Teacher Remark: ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),),
                                  Text(imgPro.subAss.Remark),
                                ],
                              ),
                            ),
                            Divider()
                          ],
                        ) : imgPro.isSubmitted ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text("Teacher not corrected your assignment yet..", style: TextStyle(color: Colors.red),),
                            ),
                            Divider()
                          ],
                        ): SizedBox.shrink(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Assignment Files", style: TextStyle(fontSize: 15),),
                            SizedBox(height: 5,),
                            SingleImageUpload(images: imgPro.images,onAddImage: _onAddImageClick, onRemoveImage: removeImage, onRetryImage: uploadImage, isSubmitted: imgPro.isSubmitted,),
                          ],
                        ),
                      ],
                    ):
                            LinearProgressIndicator();
                  },)

                ],
              ),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              // margin: const EdgeInsets.only(bottom: 30),
              child: Consumer2<GlobalProvider, AssignmentProvider>(builder: (context, global,assig, child){
                bool isUploading = false;
                for (var af in assig.images){
                  if(af is AssignmentFiles){
                    if (af.isUploading){
                      isUploading = true;
                    }
                  }
                }
                return assig.isSubmitted ? SizedBox.shrink() :  Container(
                  height: 100,
                  padding: const EdgeInsets.only(bottom: 30),
                  color: Colors.grey.shade100,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      global.isBusy || isUploading ? Text("Please wait while ..."): SizedBox.shrink() ,
                      assig.isSubmitted ? SizedBox.shrink() : ElevatedButton(onPressed: (global.isBusy || isUploading) ? null : submitAssignment,  child: Text("Submit Assignment")),
                    ],
                  ),
                );
              },)
          )

        ],
      ),
    );
  }

  removeImage(int index){
    Provider.of<AssignmentProvider>(context, listen: false).onRemoveImage(index);
  }

  _onAddImageClick(int index) async {
    var pFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 25, maxWidth: 1000, maxHeight: 1000);
    _imageFile = File(pFile.path);
    AssignmentFiles imageUpload = new AssignmentFiles(AssigFile: _imageFile, ImgUrl: "", Key: index + 1, UploadedDate: "asiigDate",isUploaded: false, isUploading: true, Type: "jpg");
    Student stu = Provider.of<StudentProvider>(context, listen: false).student.Data;
    Provider.of<AssignmentProvider>(context, listen: false).onAddImage(index, imageUpload, widget.assig, stu, context);
  }

  uploadImage(int index, AssignmentFiles af) async {
    Student stu = Provider.of<StudentProvider>(context, listen: false).student.Data;
    Provider.of<AssignmentProvider>(context, listen: false).uploadImage(index, af, widget.assig, stu, true, context);
  }

  void submitAssignment() async{
    networkAssignmentFiles = [];
    List<Object> mainImages = Provider.of<AssignmentProvider>(context, listen: false).images;
    for(int i = 0; i < mainImages.length; i++){
      if(mainImages[i] is AssignmentFiles){
        networkAssignmentFiles.add(mainImages[i]);
      }
    }
    if(networkAssignmentFiles.length > 0){
      Student stu = Provider.of<StudentProvider>(context, listen: false).student.Data;
      SubmitAssignments submitAssignment = SubmitAssignments(Status: "Submitted", Section: stu.Section, Std: stu.Class, StudentName: stu.Name, Sid: stu.Id,
          ActualDate: widget.assig.StartDate, ActualEndDate: widget.assig.EndDate, AssignmentId: widget.assig.Id, FileUrls: networkAssignmentFiles,
          StudentRemark: mRemark.text, StuImg: stu.ImageUrl, TotalMarks: widget.assig.TotalMarks);
      int val = await Provider.of<AssignmentProvider>(context, listen: false).addSubmittedAssignment(context, submitAssignment);
      if (val == 1){
        Navigator.pop(context);
      }

    }else{

    }

  }
}
