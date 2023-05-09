import 'package:alawneh/view/components/components/size_config/size_config.dart';
import 'package:alawneh/view/components/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/assets_res.dart';
import '../../chat_page/chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 130,
            right: 30,
            left: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Channels',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.3,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Get.to(() => const ChatPage());
                      },
                      leading: const Icon(
                        Icons.lock_open,
                      ),
                      title: const Text('Sales Team'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Direct Messages',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight -
                      (SizeConfig.screenHeight * 0.3) -
                      250,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Get.to(() => const ChatPage());
                      },
                      leading: const Icon(
                        Icons.person,
                      ),
                      title: const Text('Mahmoud Al-khdour'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Image(
                    height: 85,
                    image: AssetImage(AssetsRes.ALAWNEH_LOGO),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 120,
          decoration: const BoxDecoration(
            color: AppColor.globalDefaultColor,
          ),
          child: Center(
            child: ListTile(
              leading: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.person,
                    color: AppColor.globalDefaultColor,
                    size: 35,
                  ),
                ),
              ),
              title: const Text(
                'Mahmoud Al-khdour',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: RichText(
                text: const TextSpan(text: 'Employee ID :', children: [
                  TextSpan(
                    text: ' 54545',
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
