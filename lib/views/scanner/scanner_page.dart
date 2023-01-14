import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:yukparkir/utils/components/constans.dart';
import 'package:yukparkir/views/controller/screen_controller.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool isPopupShowed = false;

  Timer? _timer;
  Barcode? result;
  QRViewController? controller;

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
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: ColorPallete.primary,
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios)),
              title: Text('Pindai',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: Colors.white)),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: size.width,
                height: size.height * 0.8,
                child: QRView(
                  cameraFacing: CameraFacing.back, // Use the rear camera
                  key: qrKey, // The global key for the scanner
                  onQRViewCreated:
                      _onQRViewCreated, // Function to call after the QR View is created
                  overlay: QrScannerOverlayShape(
                    // Configure the overlay to look nice
                    borderRadius: 10,
                    borderWidth: 5,
                    borderColor: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;

        if (result != null && !isPopupShowed) {
          showPopUps();
          isPopupShowed = true;
        }
      });
    });
  }

  void showPopUps() {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          _timer = Timer(const Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });

          return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                'Berhasil!',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: Colors.green),
              ),
              content: Text("${result?.format.formatName}"));
        }).then((val) {
      if (_timer != null && _timer!.isActive) {
        _timer?.cancel();
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ScreenController()),
          (route) => false);
    });
  }
}
