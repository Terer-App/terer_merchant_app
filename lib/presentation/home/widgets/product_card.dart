// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sizer/sizer.dart';

// import '../../../domain/core/config/injection.dart';
// import '../../../domain/core/services/navigation_service/navigation_service.dart';
// import '../../../domain/core/services/navigation_service/routers/route_names.dart';
// import '../../../infrastructure/shop/shop_product/shop_product_dto.dart';
// import '../../core/custom_button.dart';

// class ProductCardWidget extends StatelessWidget {
//   final ShopProductDto product;

//   const ProductCardWidget({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         navigator<NavigationService>()
//             .navigateTo(CoreRoute.productDetailsRoute, queryParams: {
//           'productId': product.id,
//         });
//       },
//       child: Container(
//         // padding: EdgeInsets.all(4.w),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Theme.of(context)
//                     .colorScheme
//                     .primaryContainer
//                     .withOpacity(0.3),
//                 offset: const Offset(
//                   5.0,
//                   5.0,
//                 ),
//                 blurRadius: 10.0,
//                 spreadRadius: 2.0,
//               )
//             ]
//             // border: Border.all()
//             ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//                 child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30)),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: CachedNetworkImageProvider(
//                       product.featuredImage,
//                     ),
//                   )),
//             )),
//             SizedBox(
//               height: 0.4.h,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 4.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product.sellerName,
//                     maxLines: 1,
//                     softWrap: false,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).colorScheme.secondary,
//                         ),
//                   ),
//                   Text(
//                     product.title,
//                     maxLines: 2,
//                     softWrap: false,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                           color: Theme.of(context).colorScheme.secondary,
//                         ),
//                   ),
//                   Center(
//                     child: Text(
//                       '${product.priceRange.currencyCode} ${product.priceRange.amount}',
//                       maxLines: 2,
//                       softWrap: false,
//                       style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                             color:
//                                 Theme.of(context).colorScheme.primaryContainer,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 0.2.h,
//                   ),
//                   Center(
//                     child: Text(
//                       '${product.compareAtPriceRange.currencyCode} ${product.compareAtPriceRange.amount}',
//                       maxLines: 2,
//                       softWrap: false,
//                       style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                           decoration: TextDecoration.lineThrough,
//                           decorationColor: Theme.of(context).primaryColor,
//                           fontSize: 10.sp,
//                           color: Theme.of(context).colorScheme.secondary),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 0.2.h,
//                   ),
//                   SecondaryButton(
//                     height: 5.w,
//                     width: 100.w,
//                     textFontSize: 12.sp,
//                     btnText: 'More Info',
//                     onPressedBtn: () {
//                       navigator<NavigationService>().navigateTo(
//                           CoreRoute.productDetailsRoute,
//                           queryParams: {
//                             'productId': product.id,
//                           });
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProductCardWidgetShimmer extends StatelessWidget {
//   const ProductCardWidgetShimmer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Shimmer.fromColors(
//         baseColor: Theme.of(context).colorScheme.background,
//         highlightColor: Colors.white,
//         child: Container(
//           padding: EdgeInsets.all(4.w),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                   child: Container(
//                 decoration: const BoxDecoration(color: Colors.white),
//               )),
//               SizedBox(
//                 height: 0.4.h,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Flexible(
//                     child: Text(
//                       '',
//                       maxLines: 2,
//                       softWrap: false,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                           color: Theme.of(context).colorScheme.secondary),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   width: 4.w,
//                   // ),
//                   // SvgPicture.asset(
//                   //   AssetConstants.shareSvg,
//                   //   width: 5.w,
//                   // )
//                 ],
//               ),
//               SizedBox(
//                 height: 2.w,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                     child: Text(
//                       '',
//                       maxLines: 2,
//                       softWrap: false,
//                       style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                             color: Theme.of(context).colorScheme.secondary,
//                             fontSize: 12.sp,
//                           ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 2.w,
//                   ),
//                   Text(
//                     '  ',
//                     maxLines: 2,
//                     softWrap: false,
//                     style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                         decoration: TextDecoration.lineThrough,
//                         decorationColor: Theme.of(context).primaryColor,
//                         fontSize: 8.sp,
//                         color: Theme.of(context).colorScheme.secondary),
//                     overflow: TextOverflow.ellipsis,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 0.4.h,
//               ),
//               SecondaryButton(
//                 height: 5.w,
//                 width: 100.w,
//                 btnText: 'terer',
//                 onPressedBtn: () {},
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
