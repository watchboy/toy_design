
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedAvatar extends StatelessWidget {

  final double? size;
  final String? asset;
  const RoundedAvatar({
    Key? key,this.size, required this.asset
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: ClipOval( //이미지를 동그랗게 만들어준다.
        child: Image.asset(asset!,
          width: size,
          height: size,
        ),
      ),
    );
  }
}