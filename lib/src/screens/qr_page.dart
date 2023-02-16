import 'package:flutter/material.dart';
import 'dart:io';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final Qrkey = GlobalKey(debugLabel: 'AASF QR ');
  Barcode? result;
  QRViewController? qrcontroller;

  @override
  void dispose() {
    qrcontroller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrcontroller!.pauseCamera();
    } else if (Platform.isIOS) {
      qrcontroller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(bottom: 10, child: buildResult())
        ],
      ),
    );
  }

  Widget buildResult() {
    return Text(result != null ? result!.code.toString() : "scan a code");
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: Qrkey,
      onQRViewCreated: onQrCodeview,
      overlay: QrScannerOverlayShape(
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8),
    );
  }

  void onQrCodeview(QRViewController controller) {
    qrcontroller = controller;

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
    print(result);
  }
}
