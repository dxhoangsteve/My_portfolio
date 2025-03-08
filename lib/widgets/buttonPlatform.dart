import 'package:flutter/material.dart';
import 'package:portfolio/styles/color.dart';

class Buttonplatform extends StatelessWidget {
  final String skillName;
  final String skillIcon;
  const Buttonplatform(
      {Key? key, required this.skillIcon, required this.skillName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 250,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(CustomColor.skillBtn),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: () {},
          child: Row(children: [
            SizedBox(
              height: 70,
              width: 50,
              child: Image.asset(
                skillIcon,
                cacheWidth: 45,
              ),
            ),
            const SizedBox(width: 10),
            Text(skillName,
                style: TextStyle(
                  color: CustomColor.bodyText,
                  fontSize: 15,
                )),
          ])),
    );
  }
}
