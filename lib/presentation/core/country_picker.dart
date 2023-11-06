import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';
import '../../../application/country_picker/country_picker_bloc.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import 'custom_text_field.dart';

class CountryPicker extends StatelessWidget {
  final String selectedCountryDialCode;

  const CountryPicker({Key? key, required this.selectedCountryDialCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        navigator<NavigationService>().goBack();
      }
      return BlocProvider(
        create: (context) => CountryPickerBloc(
          CountryPickerState.initial(
            selectedCountryDialCode: selectedCountryDialCode,
          ),
        ),
        child: const CountryPickerConsumer(),
      );
    });
  }
}

class CountryPickerConsumer extends StatelessWidget {
  const CountryPickerConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryPickerBloc, CountryPickerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 80.h,
          margin: EdgeInsets.all(6.sp),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              color: Theme.of(context).scaffoldBackgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.w,
                width: 7.w,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: GestureDetector(
                    onTap: () => navigator<NavigationService>().goBack(),
                    child: Icon(
                      Icons.cancel,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(.3),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: TernaryTextField(
                  labelText: '',
                  hintText: 'Search for your country',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: SvgPicture.asset(
                      AssetConstants.searchSvg,
                      height: 14.sp,
                      width: 14.sp,
                      fit: BoxFit.contain,
                    ),
                  ),
                  onChanged: (value) {
                    context.read<CountryPickerBloc>().add(
                          CountryPickerEvent.searchCountry(
                            value: value.toString().replaceAll('+', ''),
                          ),
                        );
                  },
                ),
              ),
              Flexible(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Theme.of(context).primaryColorDark,
                      thickness: 0.05,
                      height: 0.sp,
                    );
                  },
                  itemCount: state.tempCountryList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if ((index == 0 ||
                                (state.tempCountryList[index - 1]['name']
                                        .toString()
                                        .split('')
                                        .first !=
                                    state.tempCountryList[index]['name']
                                        .toString()
                                        .split('')
                                        .first)) &&
                            index != 0)
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 30.sp,
                            width: double.maxFinite,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.15),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                state.tempCountryList[index]['name']
                                    .toString()
                                    .split('')
                                    .first,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                              ),
                            ),
                          ),
                        GestureDetector(
                          onTap: () => Navigator.pop(
                            context,
                            state.tempCountryList[index],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 5.0.w,
                              bottom: 1.w,
                              left: 5.w,
                              right: 5.w,
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3.sp),
                                  child: SizedBox(
                                    height: 20.sp,
                                    width: 30.sp,
                                    child: Image.asset(
                                      "assets/flags/${state.tempCountryList[index]["locale"].toString().toLowerCase()}.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                SizedBox(
                                  width: 60.w,
                                  child: Text(
                                    state.tempCountryList[index]['name']
                                        .toString(),
                                    textScaleFactor: 1.0,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  state.tempCountryList[index]['dial_code']
                                      .toString(),
                                  textScaleFactor: 1.0,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 3.w),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
