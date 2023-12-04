import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/core/configs/injection.dart';
import '../../../domain/services/navigation_service/navigation_service.dart';
import '../../../domain/services/navigation_service/routers/route_names.dart';
import '../../../infrastructure/dtos/brand/brand_dto.dart';
import '../../../infrastructure/dtos/outlet/outlet_dto.dart';
import '../../core/custom_button.dart';

class SelectOutlet extends StatefulWidget {
  final List<OutletDto> outlets;
  final BrandDto brand;
  final bool isHome;
  final OutletDto? alreadySelectedOutlet;
  const SelectOutlet(
      {super.key,
      required this.isHome,
      required this.outlets,
      required this.brand,
      required this.alreadySelectedOutlet});

  @override
  State<SelectOutlet> createState() => _SelectOutletState();
}

class _SelectOutletState extends State<SelectOutlet> {
  OutletDto? selectedOutlet;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.w), topRight: Radius.circular(5.w))),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 20.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.brand.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        const Spacer(),
                        Text(
                          'Select location',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  )),
                  Image.network(
                    widget.brand.logo,
                    height: 20.w,
                    width: 20.w,
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 10.h),
                  itemCount: widget.outlets.length,
                  itemBuilder: (BuildContext context, int index) {
                    final outlet = widget.outlets[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: (selectedOutlet != null &&
                                  outlet == selectedOutlet!)
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300, // Border color
                          width: 2.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(12.0), // Border corner radius
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(outlet.logo ?? ''),
                        ),
                        title: Text(
                          outlet.name ?? '',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        onTap: () {
                          selectedOutlet = outlet;
                          setState(() {});
                          // Navigator.pop(context); // Close the bottom sheet
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryButton(
                  bgColor: Theme.of(context).colorScheme.primary,
                  btnTextColor: Theme.of(context).colorScheme.secondary,
                  btnText: 'Cancel',
                  textFontWeight: FontWeight.w900,
                  textFontSize: 12.sp,
                  btnBorderRadius: 12.w,
                  height: 50,
                  width: 42.w,
                  onPressedBtn: () {
                    if (widget.alreadySelectedOutlet == null) {
                      if (widget.isHome) {
                        Navigator.of(context).pop();

                        navigator<NavigationService>().navigateTo(
                            CoreRoutes.homeRoute,
                            isClearStack: true);
                      } else {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                SecondaryButton(
                  btnText: 'Confirm',
                  textFontWeight: FontWeight.w900,
                  textFontSize: 12.sp,
                  btnBorderRadius: 12.w,
                  height: 50,
                  width: 42.w,
                  onPressedBtn: () {
                    if (selectedOutlet != null) {
                      Navigator.of(context).pop(selectedOutlet);
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
