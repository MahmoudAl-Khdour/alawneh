import 'package:alawneh/view/components/constants/app_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 130,
            right: 20,
            left: 20,
          ),
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Channels',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.lock_open,
                ),
              ),
            ],
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
