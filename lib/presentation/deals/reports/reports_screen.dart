import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../../application/reports/reports_bloc.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/custom_localization.dart';
import '../../../infrastructure/enums/deal_type.dart';
import '../widgets/balance_deal_item.dart';

import '../../../domain/constants/asset_constants.dart';
import '../../../domain/constants/string_constants.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/services/navigation_service/navigation_service.dart';
import '../../core/report_filter_tab.dart';
import '../widgets/redeemed_item.dart';

class ReportsScreen extends StatelessWidget {
  final int tabIndex;
  final String tabName;
  const ReportsScreen({
    super.key,
    required this.tabIndex,
    required this.tabName,
  });

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    String serverUrl = AppConfig.of(context)!.serverUrl;

    return BlocProvider(
      create: (context) => ReportsBloc(ReportsState.initial(
        appStateNotifier: appStateNotifier,
        serverUrl: serverUrl,
        currentTab: tabIndex,
        currentTabName: tabName,
      ))
        ..add(const ReportsEvent.init()),
      child: const ReportsConsumer(),
    );
  }
}

class ReportsConsumer extends StatelessWidget {
  const ReportsConsumer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportsBloc, ReportsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0))),
            toolbarHeight: 8.h,
            backgroundColor: Theme.of(context).primaryColor,
            leadingWidth: 20.w,
            leading: Padding(
              padding: EdgeInsets.only(
                left: 5.w,
              ),
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      navigator<NavigationService>().goBack();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: const CircleBorder(),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.7),
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: SvgPicture.asset(
                      AssetConstants.backSvg,
                      width: 14.w,
                    )),
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Text(
                  state.currentTab == 0
                      ? DealsConstants.balanceReport
                      : state.currentTab == 1
                          ? DealsConstants.redeemedReport
                          : DealsConstants.verifyReport,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            elevation: 0,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReportFilterTab(
                    title: DealsConstants.balance,
                    isActive: state.currentTab == 0,
                    onClick: () {
                      context.read<ReportsBloc>().add(
                            ReportsEvent.onTabChange(
                                tabIndex: 0, tabName: DealType.BALANCE.name),
                          );
                    },
                  ),
                  ReportFilterTab(
                    title: DealsConstants.redeemed,
                    onClick: () {
                      context.read<ReportsBloc>().add(
                            ReportsEvent.onTabChange(
                                tabIndex: 1, tabName: DealType.REDEEMED.name),
                          );
                    },
                    isActive: state.currentTab == 1,
                  ),
                  ReportFilterTab(
                    title: DealsConstants.verified,
                    onClick: () {
                      context.read<ReportsBloc>().add(
                            ReportsEvent.onTabChange(
                                tabIndex: 2, tabName: DealType.VERIFIED.name),
                          );
                    },
                    isActive: state.currentTab == 2,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              if (state.currentTab == 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<ReportsBloc>().add(
                            const ReportsEvent.onDateChange(
                                isNext: false, isSelectedParticular: false));
                      },
                      child: Icon(
                        Icons.arrow_left_outlined,
                        size: 12.w,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: state.currentDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary:
                                        Theme.of(context).colorScheme.primary,
                                    onPrimary: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    onSurface:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  dialogTheme: DialogTheme(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            }).then((value) {
                          if (value != null) {
                            context
                                .read<ReportsBloc>()
                                .add(ReportsEvent.emitFromAnywhere(
                                    state: state.copyWith(
                                  currentDate: value,
                                )));
                            context.read<ReportsBloc>().add(
                                const ReportsEvent.onDateChange(
                                    isNext: false, isSelectedParticular: true));
                          }
                        });
                      },
                      child: Text(
                        DateFormat('dd MMM yyyy').format(state.currentDate),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                    ),
                    (DateFormat('yyyy-dd-MM').format(state.currentDate) !=
                            DateFormat('yyyy-dd-MM').format(DateTime.now()))
                        ? GestureDetector(
                            onTap: () {
                              context
                                  .read<ReportsBloc>()
                                  .add(const ReportsEvent.onDateChange(
                                    isNext: true,
                                    isSelectedParticular: false,
                                  ));
                            },
                            child: Icon(
                              Icons.arrow_right_outlined,
                              size: 12.w,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : SizedBox(
                            width: 12.w,
                          ),
                  ],
                ),
              Expanded(
                child: state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state.lsOfDeals.isEmpty
                        ? const Center(
                            child: Text('No Deals Available!'),
                          )
                        : ListView.separated(
                            controller: state.scrollController,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 2.h,
                            ),
                            separatorBuilder: ((context, index) {
                              return SizedBox(
                                height: 2.h,
                              );
                            }),
                            itemBuilder: (ctx, i) {
                              final mainIndex = i;

                              if (mainIndex < state.lsOfDeals.length) {
                                return state.currentTab == 0
                                    ? BalanceItem(
                                        dealDto: state.lsOfDeals[i],
                                      )
                                    : RedeemedOrVerifyItem(
                                        dealDto: state.lsOfDeals[i],
                                      );
                              } else {
                                return SizedBox(
                                  height: 15.h,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[400]!,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.w),
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                            itemCount: state.lsOfDeals.length +
                                (state.hasMoreDocs ? 2 : 0),
                          ),
              )
            ],
          ),
        );
      },
    );
  }
}
