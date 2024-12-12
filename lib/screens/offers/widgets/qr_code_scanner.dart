import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  final String id;

  const QrCodeScanner({
    super.key,
    required this.id,
  });

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final MobileScannerController controller = MobileScannerController();
  bool detected = false;

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: controller,
      overlayBuilder: (context, c) {
        return Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
          ),
          alignment: Alignment.center,
        );
      },
      onDetect: (BarcodeCapture capture) {
        if (!detected) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            final value = barcode.rawValue;
            if (value != null && value == widget.id) {
              detected = true;
              Navigator.pop(context, true);
              break;
            }
          }
        }
      },
    );
  }
}
