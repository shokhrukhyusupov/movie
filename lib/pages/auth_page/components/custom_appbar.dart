import 'package:flutter/material.dart';
import 'package:movie/pages/register_page/register_page.dart';
import 'package:movie/styles/images.dart';
import 'package:sizer/sizer.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Hero(
          tag: 'logo',
          child: Image.asset(Images.logo, height: 6.h),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contetx) => RegisterPage(),
              ),
            );
          },
          child: Text(
            'REGISTER',
            style: Theme.of(context).textTheme.headline1,
            textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(1, 1),
          ),
        ),
      ],
    );
  }
}
