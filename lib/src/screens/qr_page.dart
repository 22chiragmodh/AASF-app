import 'package:aasf_iiitmg/src/controller/studentsData.dart';
import 'package:aasf_iiitmg/src/screens/home_page.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:dio/dio.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({
    super.key,
  });

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final qrkey = GlobalKey(debugLabel: 'AASF QR ');
  Barcode? result;
  String message = "";
  QRViewController? qrcontroller;

  Future<void> attedenceQr() async {
    try {
      Dio dio = Dio();
      String authToken = await StudentDetails.getauthToken();

      Options options = Options(
        headers: {'Authorization': 'Bearer $authToken'},
      );
      Response res = await dio.post("${ConstantsVar.url}/attendance",
          data: {"hash": result!.code.toString()}, options: options);

      if (res.statusCode == 200) {
        message = res.data['message'];
      }
    } catch (e) {
      print(e);
    }
  }

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
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrkey,
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

    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      setState(() {
        result = scanData;

        print("********************  ${result!.code.toString()}");
      });

      await attedenceQr();

      if (result != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 2),
          ),
        );
      }
      qrcontroller!.dispose();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        ),
      );
    });
  }
}
