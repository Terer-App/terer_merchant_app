import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../domain/extensions/generic_helper.dart';
import '../../../infrastructure/dtos/place_order/outlet_product/product_variant/product_variant_dto.dart';

class PlaceOrderDealWidget extends StatelessWidget {
  final String dealName;
  final String assetImage;
  final int quantity;
  final bool showAdd;
  final bool variantAvailable;
  final Function() increment;
  final Function() decrement;
  final List<ProductVariantDto> products;
  final Function(List<ProductVariantDto>) onProductSelectionChanged;

  const PlaceOrderDealWidget(
      {super.key,
      required this.dealName,
      required this.assetImage,
      required this.increment,
      required this.decrement,
      required this.products,
      required this.onProductSelectionChanged,
      this.quantity = 0,
      this.showAdd = true,
      this.variantAvailable = false});

  @override
  Widget build(BuildContext context) {
    final ProductVariantDto selectedProduct = products.firstWhere(
      (element) => element.isSelected,
      orElse: () => products.first,
    );
    final String currencyCode = selectedProduct.compareAtPrice.currencyCode;
    final String actualPrice =
        calculatePrice(selectedProduct.compareAtPrice.amount, quantity);
    final String discountedPrice =
        calculatePrice(selectedProduct.price.amount, quantity);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.2))),
      height: 25.h,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.sp),
                bottomLeft: Radius.circular(15.sp)),
            child: Image.network(
              assetImage,
              fit: BoxFit.cover,
              height: 25.h,
              width: 20.h,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(2.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Flexible(
                child: Text(
                  dealName,
                  maxLines: showAdd ? 2 : 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Expanded(
                  flex: showAdd ? 0 : 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      variantAvailable
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  showAdd
                                      ? 'Select coupons'
                                      : 'Selected coupons',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 11.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Container(
                                  width: 100.w,
                                  padding: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: showAdd
                                      ? DropdownButton2<ProductVariantDto>(
                                          isDense: true,
                                          iconStyleData: IconStyleData(
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                          menuItemStyleData: MenuItemStyleData(
                                            height: 7.h,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                          ),
                                          dropdownStyleData: DropdownStyleData(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primaryContainer
                                                    .withOpacity(0.4),
                                              ),
                                            ),
                                          ),
                                          isExpanded: true,
                                          value: products.firstWhere(
                                            (element) => element.isSelected,
                                            orElse: () => products.first,
                                          ),
                                          onChanged: (val) {
                                            if (val != null) {
                                              final updatedProducts =
                                                  products.map((product) {
                                                return product.copyWith(
                                                  isSelected:
                                                      product.id == val.id,
                                                );
                                              }).toList();
                                              onProductSelectionChanged(
                                                  updatedProducts);
                                            }
                                          },
                                          underline: const SizedBox(),
                                          items: products.map<
                                                  DropdownMenuItem<
                                                      ProductVariantDto>>(
                                              (product) {
                                            return DropdownMenuItem<
                                                ProductVariantDto>(
                                              value: product,
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.w),
                                                      width: 100.w,
                                                      decoration:
                                                          product.isSelected
                                                              ? BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary,
                                                                )
                                                              : null,
                                                      child: Text(
                                                        '${product.title} -  (${GenericHelper.formatSku(sku: product.sku, redemptionDuration: product.redemptionDuration ?? '')} )',
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: product
                                                                  .isSelected
                                                              ? Colors.white
                                                              : Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary,
                                                          fontSize: 11.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          selectedItemBuilder:
                                              (BuildContext context) {
                                            return products
                                                .map<Widget>((product) {
                                              return Text(
                                                '${product.title} -  (${GenericHelper.formatSku(sku: product.sku, redemptionDuration: product.redemptionDuration ?? '')} )',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 11.sp,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                              );
                                            }).toList();
                                          },
                                        )
                                      : Text(
                                          '${selectedProduct.title} -  (${GenericHelper.formatSku(sku: selectedProduct.sku, redemptionDuration: selectedProduct.redemptionDuration ?? '')} )',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 4.h,
                            ),
                      SizedBox(height: showAdd ? 0.5.h : 2.h),
                      Center(
                        child: Text(
                          '$currencyCode $discountedPrice',
                          maxLines: 1,
                          softWrap: false,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
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
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor:
                                      Theme.of(context).primaryColor,
                                  fontSize: 10.sp,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
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
                            'Quantity : $quantity',
                            maxLines: 2,
                            softWrap: false,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    decorationColor:
                                        Theme.of(context).primaryColor,
                                    fontSize: 10.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ))
            ]),
          )),
        ],
      ),
    );
  }

  String calculatePrice(String priceString, int quantity) {
    double price = double.tryParse(priceString) ?? 0.0;

    if (quantity == 0) {
      return (price * 1).toString();
    } else {
      double totalPrice = quantity * price;
      return totalPrice.toStringAsFixed(1);
    }
  }
}
