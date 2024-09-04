import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/constants/asset_constants.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.w,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 10.w
          )
        ]
      ),
    );
  }
}

class CustomBottomActionBar extends StatelessWidget {
  final Function(int moveTo)? navCallBack;
  const CustomBottomActionBar({Key? key, this.navCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 13.8.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavbarItem(
            icon: AssetConstants.homeIcon,
            title: 'Home',
            onPressed: () {
              if (navCallBack != null) {
                navCallBack!(0);
              }
            },
          ),
          NavbarItem(
            icon: AssetConstants.scanIcon,
            title: 'Scan',
            onPressed: () {
              if (navCallBack != null) {
                navCallBack!(1);
              }
            },
          ),
          NavbarItem(
            icon: AssetConstants.profileIcon,
            title: 'Profile',
            onPressed: () {
              if (navCallBack != null) {
                navCallBack!(2);
              }
            },
          )
        ],
      ),
    );
  }
}

class NavbarItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function onPressed;

  const NavbarItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          CircleAvatar(
            radius: 3.5.h,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Image.asset(
              icon,
              height: 6.h,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
