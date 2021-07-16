import 'package:flutter/material.dart';
import 'package:my_guardian/Helpers/Utils.dart';

class AttendanceCard extends StatelessWidget {
  final String number;
  final bool isPercentage;
  final bool isGradient;
  final Color titleColor;
  final String title;

  const AttendanceCard({Key key, @required this.number, this.isPercentage = false, this.isGradient = false, @required this.title, @required this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      decoration: isGradient ? BoxDecoration(
          color: Colors.white,
          gradient: Utils.btnGradient,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 2,
                offset: Offset(1,2)
            )
          ]
      ): BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 2,
                offset: Offset(1,2)
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(number, style: TextStyle(fontSize: 28, color: titleColor, fontWeight: FontWeight.w800),),
              isPercentage ? Text("%", style: TextStyle(color: Colors.white),): SizedBox.shrink()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(title, style: TextStyle(fontSize: 14, color: isGradient ? Colors.white : Colors.black54, fontWeight: FontWeight.w800),),
          ),
        ],
      ),
    );
  }
}
