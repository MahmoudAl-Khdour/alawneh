import 'dart:async';

import 'package:flutter/material.dart';
import 'package:starlight_popup_menu/starlight_popup_menu.dart';

import '../../constants/app_color.dart';

class StateM {
  Stream<bool> get stream => _streamController.stream;

  final StreamController<bool> _streamController = StreamController.broadcast();

  void onChange(bool value) {
    _streamController.sink.add(value);
  }
}

final StateM _state = StateM();

class Menu extends StarlightPopupMenuBase {
  const Menu({Key? key}) : super(key: key);

  @override
  void onChange(bool value) {
    _state.onChange(value);
    super.onChange(value);
  }

  @override
  StarlightPressType pressType() => StarlightPressType.onTap;

  @override
  StarlightPopupMenuTheme stylee() => StarlightPopupMenuTheme(
        position: StarlightPreferredPosition.bottom,
        horizontalMargin: 20,
        verticalMargin: 10,
        indicatorSize: 15,
        indicatorColor: Colors.white,
        // customIndicator: StarClipper(),
      );

  @override
  Widget builder(
      BuildContext context, StarlightPopupMenuController controller) {
    return StreamBuilder<bool>(
        initialData: false,
        stream: _state.stream,
        builder: (_, snapshot) {
          return AnimatedIcon(
            icon: snapshot.data == true
                ? AnimatedIcons.menu_close
                : AnimatedIcons.event_add,
            progress: kAlwaysCompleteAnimation,
          );
        });
  }

  @override
  Widget menu(BuildContext context, StarlightPopupMenuController controller) {
    return Container(
      width: 210,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColor.globalBackgroundTextFormFieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColor.globalBackgroundTextFormFieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.video_library_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColor.globalBackgroundTextFormFieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.ios_share_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColor.globalBackgroundTextFormFieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.attach_file,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
