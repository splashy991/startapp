import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ChangeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for c_name widget.
  TextEditingController? cNameController;
  String? Function(BuildContext, String?)? cNameControllerValidator;
  // State field(s) for c_city widget.
  TextEditingController? cCityController;
  String? Function(BuildContext, String?)? cCityControllerValidator;
  // State field(s) for c_status widget.
  TextEditingController? cStatusController;
  String? Function(BuildContext, String?)? cStatusControllerValidator;
  // State field(s) for c_price widget.
  TextEditingController? cPriceController;
  String? Function(BuildContext, String?)? cPriceControllerValidator;
  // State field(s) for c_phone widget.
  TextEditingController? cPhoneController;
  final cPhoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? cPhoneControllerValidator;
  // State field(s) for c_desc widget.
  TextEditingController? cDescController;
  String? Function(BuildContext, String?)? cDescControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    cNameController?.dispose();
    cCityController?.dispose();
    cStatusController?.dispose();
    cPriceController?.dispose();
    cPhoneController?.dispose();
    cDescController?.dispose();
  }

  /// Additional helper methods are added here.

}
