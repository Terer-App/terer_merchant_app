// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_zoom_drawer/config.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import '../../domain/core/constants/string_constants.dart';
// import '../../domain/core/extensions/string_extensions.dart';
// import './widgets/product_card.dart';
// import '../../application/shop_products/shop_products_bloc.dart';
// import '../../domain/core/config/app_config.dart';
// import '../../domain/core/config/injection.dart';
// import '../../domain/core/constants/asset_constants.dart';
// import '../../domain/core/services/navigation_service/navigation_service.dart';
// import '../../domain/core/services/navigation_service/routers/route_names.dart';
// import 'widgets/search_field.dart';

// class ShopProducts extends StatelessWidget {
//   final ZoomDrawerController zoomDrawerController;
//   const ShopProducts({Key? key, required this.zoomDrawerController})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context);

//     final String serverUrl = AppConfig.of(context)!.serverUrl;

//     return BlocProvider(
//       create: (context) => ShopProductsBloc(ShopProductsState.initial(
//           serverUrl: serverUrl,
//           appStateNotifier: appStateNotifier,
//           zoomDrawerController: zoomDrawerController))
//         ..add(const ShopProductsEvent.initial()),
//       child: const ShopProductsConsumer(),
//     );
//   }
// }

// class ShopProductsConsumer extends StatelessWidget {
//   const ShopProductsConsumer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopProductsBloc, ShopProductsState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Container(
//           color: Colors.transparent,
//           height: 100.h,
//           child: Stack(children: [
//             SizedBox(
//               child: Stack(children: [
//                 Column(
//                   children: [
//                     Container(
//                       height: 20.h,
//                       width: double.maxFinite,
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).colorScheme.primary,
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(0.w),
//                             bottomRight: Radius.circular(8.w),
//                             topLeft: Radius.circular(0.w),
//                             bottomLeft: Radius.circular(8.w)),
//                       ),
//                       child: Row(
//                         children: <Widget>[
//                           IconButton(
//                             onPressed: () async {
//                               if (state.zoomDrawerController.isOpen!()) {
//                                 state.zoomDrawerController.close!();
//                               } else {
//                                 state.zoomDrawerController.open!();
//                               }
//                             },
//                             icon: SvgPicture.asset(
//                               AssetConstants.burgerSvg,
//                               width: 7.w,
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                                 height: 12.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(25),
//                                   color: Theme.of(context).colorScheme.tertiary,
//                                 ),
//                                 child: SearchField(
//                                   onChanged: (searchKeyword) {
//                                     context.read<ShopProductsBloc>().add(
//                                         ShopProductsEvent.searchShopProducts(
//                                             searchKeyword: searchKeyword));
//                                   },
//                                 )),
//                           ),
//                           Stack(
//                             children: [
//                               IconButton(
//                                 onPressed: () async {
//                                   await navigator<NavigationService>()
//                                       .navigateTo(CoreRoute.myCartRoute)
//                                       .then((value) {
//                                     context
//                                         .read<ShopProductsBloc>()
//                                         .add(const ShopProductsEvent.initial());
//                                   });
//                                 },
//                                 icon: SvgPicture.asset(
//                                   AssetConstants.cartSvg,
//                                   width: 8.w,
//                                 ),
//                               ),
//                               if (state.cartDto != null &&
//                                   state.cartDto!.items.isNotEmpty)
//                                 Positioned(
//                                   top: 0.8.h,
//                                   right: 0,
//                                   child: CircleAvatar(
//                                     backgroundColor: Colors.white,
//                                     radius: 2.w,
//                                     child: Center(
//                                       child: Text(
//                                         state.cartDto!.items.length.toString(),
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall!
//                                             .copyWith(
//                                               fontSize: 8.sp,
//                                               color: Theme.of(context)
//                                                   .primaryColor,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                             ],
//                           ),
//                           SizedBox(
//                             width: 2.w,
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     Expanded(
//                       child: Container(
//                         width: double.maxFinite,
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.background,
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(7.w),
//                               bottomRight: Radius.circular(0.w),
//                               topLeft: Radius.circular(7.w),
//                               bottomLeft: Radius.circular(0.w)),
//                         ),
//                         child: !state.isLoading && state.lsOfProducts.isEmpty
//                             ? Center(
//                                 child: Text(
//                                   ShopConstants.noProductsFound,
//                                   style: TextStyle(
//                                       color: Theme.of(context).primaryColor),
//                                 ),
//                               )
//                             : RefreshIndicator(
//                                 onRefresh: () async {
//                                   context.read<ShopProductsBloc>().add(
//                                       ShopProductsEvent.searchShopProducts(
//                                           searchKeyword: state.searchKeyword));
//                                 },
//                                 child: StaggeredGridView.countBuilder(
//                                     physics: const BouncingScrollPhysics(),
//                                     padding: EdgeInsets.only(
//                                       top: 5.h,
//                                       bottom: 12.h,
//                                       right: 4.w,
//                                       left: 4.w,
//                                     ),
//                                     staggeredTileBuilder: (index) {
//                                       return StaggeredTile.count(
//                                           2, index.isEven ? 3.5 : 3.5);
//                                     },
//                                     crossAxisCount: 4,
//                                     shrinkWrap: true,
//                                     controller: state.scrollController,
//                                     scrollDirection: Axis.vertical,
//                                     crossAxisSpacing: 12,
//                                     mainAxisSpacing: 12,
//                                     itemCount: state.lsOfProducts.length +
//                                         (state.isLoading ? 6 : 0),
//                                     itemBuilder: ((context, index) {
//                                       if (state.isLoading ||
//                                           index >= state.lsOfProducts.length) {
//                                         return const ProductCardWidgetShimmer();
//                                       } else if (state.isFailed) {
//                                         return const Center(
//                                           child: Text(ShopConstants
//                                               .failedToFetchOrders),
//                                         );
//                                       } else {
//                                         return ProductCardWidget(
//                                           product: state.lsOfProducts[index],
//                                         );
//                                       }
//                                     })),
//                               ),
//                       ),
//                     ),
//                   ],
//                 )
//               ]),
//             ),
//             Positioned(
//               left: 10.w,
//               top: 17.h,
//               child: Container(
//                 height: 13.h,
//                 width: 80.w,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.secondary,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(10.w),
//                       bottomRight: Radius.circular(0.w),
//                       topLeft: Radius.circular(10.w),
//                       bottomLeft: Radius.circular(0.w)),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
//                       child: Text(
//                         AppConstants.hello,
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.primary,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20.sp),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
//                       child: Text(
//                         state.appStateNotifier.customer!.firstName
//                             .capitalizeCamel,
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.tertiary,
//                             fontWeight: FontWeight.w100,
//                             fontSize: 20.sp),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ]),
//         );
//       },
//     );
//   }
// }
