import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../infrastructure/dtos/brand/brand_dto.dart';
import '../../infrastructure/dtos/deal_info_dto/deal_info_dto.dart';
import '../../infrastructure/dtos/outlet/outlet_dto.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';
import '../core/custom_button.dart';
import '../core/custom_toast.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../core/custom_alert.dart';
import 'widgets/select_outlet.dart';

class ScanScreen extends StatefulWidget {
  final ZoomDrawerController zoomDrawerController;

  const ScanScreen({Key? key, required this.zoomDrawerController})
      : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  bool isLoading = false;
  bool isResult = false;
  List<OutletDto> outlets = [];

  QRViewController? controller;

  void _onQRViewCreated(QRViewController qrViewController, String serverUrl) {
    setState(() {
      controller = qrViewController;
      controller!.resumeCamera();
    });
    qrViewController.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;

        if (!isResult && result != null) {
          isResult = true;
          isLoading = true;
          _verifyQRCode(serverUrl, json.decode(result!.code!), isItFreeDeal: 0);
        }
      });
    });
  }

  Future<void> _verifyQRCode(String serverUrl, Map<String, dynamic> data,
      {bool isAnywayDeal = false, required int isItFreeDeal}) async {
    data['outlet_update_id'] = selectedOutlet!.id!;
    isLoading = true;
    final res = await (isAnywayDeal
        ? IShopMerchantRepository(serverUrl: serverUrl)
            .verifyDealAnyways(data: data, isItFreeDeal: isItFreeDeal)
        : IShopMerchantRepository(serverUrl: serverUrl)
            .verifyCustomerDeal(data: data));

    res.fold((l) {
      setState(() {
        isLoading = false;
        isResult = false;
        result = null;
      });

      CustomToast.showToast(
        msg: l,
      );
    }, (r) {
      setState(() {
        isLoading = false;
        result = null;
      });
      Future.delayed(const Duration(seconds: 5)).then((value) {
        setState(() {
          isResult = false;
        });
      });
      String content = "${r['msg'] ?? ''}\n${r['desc'] ?? ''}";

      showDialog(
          barrierColor: Colors.white,
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return CustomAlert(
              maxTitleIndex: r['type'] == 0 ? 19 : null,
              isReport: true,
              reverseColor: r['type'] == 1 || r['type'] == 2,
              onPressed2: () {
                if (r['type'] == 2) {
                  return navigator<NavigationService>().goBack(responseObject: {
                    'secondaryButton': 1,
                  });
                } else if (r['type'] == 1) {
                  return navigator<NavigationService>().goBack(responseObject: {
                    'secondaryButton': 2,
                  });
                }
                navigator<NavigationService>().goBack();
              },
              button2Text: r['type'] == 1
                  ? AppConstants.reportDispute
                  : r['type'] == 2
                      ? AppConstants.verifyAnyways
                      : '',
              onPressed: () async {
                if (r['type'] == 1 || r['type'] == 2) {
                  return navigator<NavigationService>().goBack(responseObject: {
                    'primaryButton': 1,
                  });
                }
                navigator<NavigationService>().goBack(responseObject: {
                  'primaryButton': 0,
                });
              },
              isExtraBtn: r['type'] == 1 || r['type'] == 2,
              makeTextBold: true,
              buttonText: r['type'] == 1 || r['type'] == 2
                  ? AppConstants.checkDetails
                  : AppConstants.backToHome,
              content: content,
              svgUrl: r['isSuccess']
                  ? AssetConstants.successSvg
                  : AssetConstants.warning,
            );
          }).then((res) {
        if (res != null) {
          // verify deal anyways
          if (res['secondaryButton'] == 1) {
            setState(() {
              isLoading = true;
            });
            _verifyQRCode(
              serverUrl,
              {'dealRefId': data['dealRefId']},
              isAnywayDeal: true,
              isItFreeDeal: (r['dealInfo'] as DealInfoDto).isItFreeDeal,
            );
          } else if (res['secondaryButton'] == 2) {
            navigator<NavigationService>()
                .navigateTo(CoreRoutes.disputeReportRoute);
          } else if (res['primaryButton'] == 0) {
            navigator<NavigationService>()
                .navigateTo(CoreRoutes.homeRoute, isClearStack: true);
          } else if (res['primaryButton'] == 1) {
            //
            final DealInfoDto dealInfo = r['dealInfo'] as DealInfoDto;
            showDialog(
                barrierColor: Colors.white,
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return CustomAlert(
                    onPressed: () {
                      navigator<NavigationService>().goBack();
                    },
                    buttonText: ContactUsConstants.backToRedeem,
                    content: '',
                    customWidget: Column(
                      children: [
                        Text(
                          dealInfo.dealName,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                        ),
                        Text(
                          '${AppConstants.date}: ${dealInfo.redeemDate}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${AppConstants.time}: ${dealInfo.redeemTime}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold),
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                text:
                                    '${DealsConstants.totalTerer}:${dealInfo.redeemDeals}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.bold),
                              )
                            ]))
                      ],
                    ),
                    height: 45.h,
                    svgUrl: AssetConstants.successSvg,
                  );
                });
          }
        }
      });
    });
  }

  late ShopMerchantRepository shopMerchantRepository;

  OutletDto? selectedOutlet;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      AppConfig appConfig = AppConfig.of(context)!;
      shopMerchantRepository =
          IShopMerchantRepository(serverUrl: appConfig.serverUrl);
      outlets = await shopMerchantRepository.getAllotedBrandOutlets();
      changeOutlet(outlets, context);
    });
  }

  Future changeOutlet(
      List<OutletDto>? passedOutlets, BuildContext context) async {
    final List<OutletDto> outlets = passedOutlets ?? this.outlets;
    AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context, listen: false);
    BrandDto brand = appStateNotifier.profile!.brand;
    await showModalBottomSheet<OutletDto?>(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SelectOutlet(outlets: outlets, brand: brand);
      },
    ).then((value){
      if(value!=null){
        selectedOutlet=value;
        setState(() {
          
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final String serverUrl = AppConfig.of(context)!.serverUrl;

    bool isSmallerThan = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400);
    final scanArea = isSmallerThan ? 250.0 : 350.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            if (widget.zoomDrawerController.isOpen!()) {
              widget.zoomDrawerController.close!();
            } else {
              widget.zoomDrawerController.open!();
            }
          },
          icon: SvgPicture.asset(
            AssetConstants.burgerSvg,
            width: 7.w,
          ),
        ),
        title: Text(AppConstants.scanTitle,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: outlets.isEmpty && selectedOutlet==null
          ? const Center(child: CircularProgressIndicator())
          : ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Stack(
                children: [
                  QRView(
                    key: qrKey,
                    onQRViewCreated: (QRViewController controller) {
                      _onQRViewCreated(controller, serverUrl);
                    },
                    overlay: QrScannerOverlayShape(
                        borderColor: Theme.of(context).colorScheme.secondary,
                        overlayColor: Colors.white,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutBottomOffset: 10.h,
                        cutOutSize: scanArea),
                    // onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          )),
                      height: 10.w,
                    ),
                  ),
                  Positioned(
                    top: 50.h,
                    left: 0,
                    right: 0,
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.w),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: ScanConstants.scanQRInstruction,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 11.sp,
                                  ),
                            ),
                          )),
                      if (selectedOutlet != null)
                        Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'Currently selected:\n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp,
                                      ),
                                  children: [
                                    TextSpan(
                                      text: selectedOutlet!.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize: 11.sp,
                                          ),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            PrimaryButton(
                                width: 40.w,
                                btnText: 'Switch Outlet',
                                textFontSize: 12.sp,
                                onPressedBtn: () {
                                  changeOutlet(null, context);
                                })
                          ],
                        )
                    ]),
                  )
                ],
              )),
    );
  }
}
