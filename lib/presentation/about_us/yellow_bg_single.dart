import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class YellowBgSingle extends StatelessWidget {
  final String title;

  const YellowBgSingle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.loose, children: <Widget>[
      Container(
        height: 25.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0.w),
              bottomRight: Radius.circular(10.w),
              topLeft: Radius.circular(0.w),
              bottomLeft: Radius.circular(10.w)),
        ),
      ),
      Column(
        children: [
          SizedBox(
            height: 7.h,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(2.h, 0, 2.h, 0),
                child: Row(
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: const CircleBorder(),
                          primary: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withOpacity(0.7),
                          onPrimary: Theme.of(context).colorScheme.primary,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          size: 4.h,
                        )),
                  ],
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      )
    ]);
  }
}
