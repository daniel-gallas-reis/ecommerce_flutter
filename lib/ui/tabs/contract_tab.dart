import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class ContractTab extends StatefulWidget {
  const ContractTab({Key? key}) : super(key: key);

  @override
  State<ContractTab> createState() => _ContractTabState();
}



class _ContractTabState extends State<ContractTab> {
  @override
  Widget build(BuildContext context) {
    return PdfViewPinch(controller: pdf);
  }

  bool? _isLoading;
  final pdf = PdfControllerPinch(document: PdfDocument.openAsset('lib/assets/CT_COMET_2017_2_05.pdf'));

}
