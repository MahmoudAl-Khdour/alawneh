import 'package:alawneh/view/components/components/size_config/size_config.dart';
import 'package:alawneh/view/components/constants/app_color.dart';
import 'package:alawneh/view/components/widgets/header_widget/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets_res.dart';
import '../../components/components/menu/menu.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  GlobalKey _menuKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 102,
                  bottom: 50,
                ),
                child: Container(
                  color: Colors.white,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 60,
                      right: 15,
                      left: 15,
                    ),
                    reverse: true,
                    itemCount: 5,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (context, index) => Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: SizeConfig.screenWidth / 1.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 0.5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 2,
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    width: 0.2,
                                    color: Colors.grey,
                                  )),
                              child: const Image(
                                image: AssetImage(AssetsRes.ALAWNEH_LOGO),
                              ),
                            ),
                            title: const Text(
                              'Mahmoud Alkhdour\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            subtitle: RichText(
                                text: const TextSpan(
                                    text: '@mahmoudalkhdour \t',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                  TextSpan(
                                    text:
                                        'hi my name is mahmoud alkhdour i am flutter developer',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ])),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColor.globalWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 0.5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    width: SizeConfig.screenWidth,
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Menu(),
                        ),
                        Expanded(
                          child: TextField(
                            maxLines: 10000,
                            minLines: 1,
                            onTap: () {
                              // controller.showEmojiKeyboard.value = false;
                            },
                            style: Theme.of(context).textTheme.bodyText1,
                            // focusNode: controller.focusNode.value,
                            // controller: controller.messageController.value,
                            // onChanged: (value) => cubit.msgValidate(value),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(12, 5, 12, 5),
                              hintText: 'Message ',
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                              filled: true,
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                  bottom: Radius.circular(20),
                                ),
                                gapPadding: 0,
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                  bottom: Radius.circular(20),
                                ),
                                gapPadding: 0,
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                  bottom: Radius.circular(20),
                                ),
                                gapPadding: 0,
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.send_rounded,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          HeaderWidget(
            onPressed: () {
              Get.back();
            },
            centerTitle: true,
            containerSize: 100,
            title: 'Mahmoud Al-khdour',
            haveBack: true,
            haveLogo: false,
          ),
        ],
      ),
    );
  }
}
