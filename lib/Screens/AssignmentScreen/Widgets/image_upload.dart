import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_guardian/Model/Assignment.dart';
import 'package:my_guardian/Model/AssignmentFiles.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/Model/SubmitAssignment.dart';
import 'package:my_guardian/NetworkModule/api_base.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/Providers/student_provider.dart';
import 'package:my_guardian/Screens/AssignmentScreen/Widgets/view_images.dart';
import 'package:provider/provider.dart';



class SingleImageUpload extends StatelessWidget {
  final List<Object> images;
  final Function onAddImage;
  final Function onRemoveImage;
  final Function onRetryImage;
  final bool isSubmitted;


  const SingleImageUpload({Key key, this.images, this.onAddImage, this.onRemoveImage, this.onRetryImage, this.isSubmitted = false}) : super(key: key);


  void open(BuildContext context, final int index) {
    List<String> af = [];
    for(int i = 0; i < images.length; i++){
      if(images[i] is AssignmentFiles){
        AssignmentFiles uploadModel = images[i];
        af.add(uploadModel.ImgUrl);
      }
    }
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return GalleryPhotoViewWrapper(
          galleryItems: af,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: false ? Axis.vertical : Axis.horizontal,
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) =>
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is AssignmentFiles) {
          AssignmentFiles uploadModel = images[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                uploadModel.isUploaded ? InkWell(
                  onTap: (){ open(context, index); },
                  child: CachedNetworkImage(
                    imageUrl: uploadModel.ImgUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 300.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => Center(child: Container(width: 50, height: 50, child: CircleAvatar(child: CupertinoActivityIndicator(),backgroundColor: Colors.grey.withOpacity(0.2), ))),
                    errorWidget: (context, url, error) => Container(width: 50, height: 50, child: CircleAvatar(child: Text("SS"))),
                  ),
                ): Image.file(
                  uploadModel.AssigFile,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 5,
                    left: 5,
                    child: uploadModel.isUploaded ?  Text("*") : uploadModel.isUploading ? Text("Loading") : SizedBox.shrink()
                ),
                uploadModel.isUploaded ?
                isSubmitted ? SizedBox.shrink() : Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: Colors.red,
                    ),
                    onTap: () {
                      onRemoveImage(index);
                      // setState(() {
                        // images.replaceRange(index, index + 1, ['Add Image']);
                        // images.removeAt(images.length);
                      // });
                    },
                  ),
                ): uploadModel.isUploading ? Center(child: Center(child: Container(width: 50, height: 50, child: CircleAvatar(child: CupertinoActivityIndicator(),backgroundColor: Colors.grey.withOpacity(0.2), ))),) : Center(
                  child: Column(
                    children: [
                      ElevatedButton(onPressed: (){onRetryImage(index, uploadModel);}, child: Text("Retry"),),
                      ElevatedButton(onPressed: (){ onRemoveImage(index); }, child: Text("Delete"),),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                onAddImage(index);
              },
            ),
          );
        }
      }),
    );
  }
}
