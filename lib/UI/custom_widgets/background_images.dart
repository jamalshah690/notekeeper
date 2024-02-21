import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:notekeeper/Core/Constants/colors.dart';
import 'package:notekeeper/Core/Constants/images_urls.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kWhite,
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              ImagesUrls.mainTop,
              width: kIsWeb ? 90 : size.width * 0.35,
              color: kSecondaryColor,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              ImagesUrls.bottomLogin,
              width: kIsWeb ? 90 : size.width * 0.4,
              color: kSecondaryColor,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
