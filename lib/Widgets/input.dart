import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String title;
  final bool isPassword;
  final IconData icon;
  final TextEditingController mCtrl;

  const InputText({Key key, this.title, this.isPassword = false, this.icon, this.mCtrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade200,
      ),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      child: TextField(
        obscureText: isPassword,
        controller: mCtrl,
        decoration: InputDecoration(
            hintText: title,
            prefixIcon: Icon(icon),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            border: InputBorder.none
        ),
      ),
    );
  }
}

class NormalInputText extends StatelessWidget {
  final String title, label;
  final int maxLine;
  final TextEditingController mCtrl;


  const NormalInputText({Key key, this.title, this.mCtrl, this.label, this.maxLine = 1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label == null ? SizedBox.shrink() : Text(label),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
            child: TextField(
              controller: mCtrl,
              maxLines: maxLine,
              decoration: InputDecoration(
                  hintText: title,
                  contentPadding: EdgeInsets.symmetric(horizontal: 19, vertical: 15),
                  border: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
}
