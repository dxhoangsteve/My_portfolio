import 'package:flutter/material.dart';
import 'package:portfolio/styles/color.dart';

// about me
class AboutmeDesktop extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const AboutmeDesktop(
      {Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    // var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        color: CustomColor.aboutMeBG,
      ),
      height: screenHeight * (0.9),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // introduce
          Expanded(
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Xin chào, đây là trang portfolio của mình",
                      style: TextStyle(
                        color: CustomColor.tittle,
                        fontSize: 30,
                        height: 1.5,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColor.aboutMeBtn,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          onPressed: () {},
                          child: const Text("Tải CV"))
                    ],
                  )
                ]),
          ),
          // image
          Expanded(
              flex: 1,
              child: Center(
                  child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500.0),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/avt.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ))))
        ],
      ),
    );
  }
}
