import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/constants/asset_constants.dart';

class PlaceOrderDealWidget extends StatelessWidget {
  final String dealName;
  final String currencyCode;
  final String assetImage;
  final double actualPrice;
  final double discountedPrice;
  final int quantity;
  final bool showAdd;
  final Function() increment;
  final Function() decrement;

  const PlaceOrderDealWidget(
      {super.key,
      required this.dealName,
      required this.currencyCode,
      required this.actualPrice,
      required this.assetImage,
      required this.discountedPrice,
      required this.increment,
      required this.decrement,
      this.quantity = 0,
      this.showAdd = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.2))),
      height: 20.h,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.sp),
                bottomLeft: Radius.circular(15.sp)),
            child: Image.asset(
              assetImage,
              fit: BoxFit.cover,
              height: 20.h,
              width: 120,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(2.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                dealName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w300),
              ),
              Center(
                child: Text(
                  '$currencyCode $discountedPrice',
                  maxLines: 1,
                  softWrap: false,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 0.5.h,
              ),
              Center(
                child: Text(
                  '$currencyCode $actualPrice',
                  maxLines: 2,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Theme.of(context).primaryColor,
                      fontSize: 10.sp,
                      color: Theme.of(context).colorScheme.secondary),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showAdd)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (quantity > 0)
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: decrement,
                      ),
                    if (quantity > 0) Text(quantity.toString()),
                    if (quantity > 0)
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: increment,
                      ),
                    if (quantity == 0)
                      ElevatedButton(
                        onPressed: increment,
                        child: const Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              if (!showAdd)
                Center(
                  child: Text(
                    'Qunatity : $quantity',
                    maxLines: 2,
                    softWrap: false,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decorationColor: Theme.of(context).primaryColor,
                        fontSize: 10.sp,
                        color: Theme.of(context).colorScheme.secondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ]),
          )),
        ],
      ),
    );
  }
}
