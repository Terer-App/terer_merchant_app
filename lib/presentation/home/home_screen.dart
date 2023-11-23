import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sizer/sizer.dart';
import '../deals/manage_deals_screen.dart';
import '../place_order/place_order_screen.dart';
import '../scan/scan_screen.dart';

import '../../application/home_screen/home_screen_bloc.dart';
import '../auth/getting_started_screen.dart';

import '../core/custom_navbar/custom_navbar.dart';
import '../core/menu_widget.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final int startPage;
  const HomeScreen({Key? key, required this.startPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeScreenBloc(HomeScreenState.initial(currentPage: startPage)),
      child: HomeScreenConsumer(),
    );
  }
}

class HomeScreenConsumer extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  HomeScreenConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            GettingStartedScreen(
              asBackground: true,
              buttonHeight: 60.h,
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
              child: ZoomDrawer(
                controller: zoomDrawerController,
                borderRadius: 24,
                style: DrawerStyle.defaultStyle,
                showShadow: false,
                moveMenuScreen: false,
                mainScreenTapClose: true,
                shrinkMainScreen: false,
                menuScreenWidth: 75.w,
                openCurve: Curves.fastOutSlowIn,
                slideWidth: 75.w,
                mainScreenScale: 0.2,
                duration: const Duration(milliseconds: 500),
                angle: 0.0,
                mainScreen: Scaffold(
                  body: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: state.currentPage == 0
                        ? ManageDealsScreen(
                            zoomDrawerController: zoomDrawerController,
                          )
                        : state.currentPage == 1
                            ? ScanScreen(
                                zoomDrawerController: zoomDrawerController,
                              ) :
                             state.currentPage == 2
                                ? ProfileScreen(
                                    zoomDrawerController: zoomDrawerController,
                                  )
                                : Container(),
                  ),
                  bottomNavigationBar: const CustomNavbar(),
                  resizeToAvoidBottomInset: false,
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: CustomBottomActionBar(
                    navCallBack: (moveTo) {
                      context
                          .read<HomeScreenBloc>()
                          .add(HomeScreenEvent.changePage(currentPage: moveTo));
                    },
                  ),
                ),
                menuScreen: MenuWidget(
                  zoomDrawerController: zoomDrawerController,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
