import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';

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
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
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
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )),
            height: 2.h,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 40.h,
                  width: 100.w,
                  color: Theme.of(context).colorScheme.background,
                  child: QRView(
                    overlay: QrScannerOverlayShape(
                      borderColor: Theme.of(context).colorScheme.secondary,
                      borderWidth: 2.5.w,
                      cutOutHeight: 40.h,
                      cutOutWidth: 100.w,
                      overlayColor: Colors.white,
                    ),
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  ScanConstants.scanQRInstruction,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 12.sp,
                      ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
