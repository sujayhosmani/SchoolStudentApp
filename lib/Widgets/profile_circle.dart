import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ProfileCircle extends StatelessWidget {
  final double height;
  final double width;
  final String url;

  const ProfileCircle({Key key, this.height, this.width, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular((height + width + height) / 2),
      child: CachedNetworkImage(height: height,width: width, fit: BoxFit.cover, imageUrl: url,),
    );
  }
}
