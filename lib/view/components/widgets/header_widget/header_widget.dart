import 'package:flutter/material.dart';

import '../../../../res/assets_res.dart';
import '../../components/size_config/size_config.dart';
import '../../constants/app_color.dart';

class HeaderWidget extends StatefulWidget {
  String? title;
  double sizeIcon;
  var colorContainer;

  double containerSize;
  double sizeTitle;
  bool centerTitle;
  bool haveBack;
  bool haveLogo;
  int numNotification;
  Function()? onPressed;

  HeaderWidget({
    Key? key,
    this.centerTitle = false,
    this.containerSize = 50,
    this.colorContainer,
    this.sizeIcon = 22.0,
    this.haveLogo = true,
    this.haveBack = false,
    this.title,
    this.onPressed,
    this.numNotification = 0,
    this.sizeTitle = 18,
  }) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      elevation: 1,
      child: Container(
        color: Colors.white.withOpacity(0.4),
        height: widget.containerSize,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Center(
            child: AppBar(
              elevation: 0,
              centerTitle: widget.centerTitle,
              title: widget.haveLogo
                  ? const Image(
                      width: 80,
                      height: 70,
                      image: AssetImage(AssetsRes.ALAWNEH_LOGO))
                  : Text(
                      widget.title!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: widget.sizeTitle,
                      ),
                    ),
              leading: widget.haveBack
                  ? InkWell(
                      onTap: widget.onPressed,
                      child: Icon(
                        size: 21,
                        Icons.arrow_back_ios,
                        color: AppColor.globalIconColor,
                      ),
                    )
                  : null,
              backgroundColor: Colors.white.withOpacity(0.0),
            ),
          ),
        ),
      ),
    );
  }
}
