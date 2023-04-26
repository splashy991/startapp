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

class NewDetailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for d_name widget.
  TextEditingController? dNameController;
  String? Function(BuildContext, String?)? dNameControllerValidator;
  // State field(s) for p_city widget.
  TextEditingController? pCityController;
  String? Function(BuildContext, String?)? pCityControllerValidator;
  // State field(s) for p_status widget.
  TextEditingController? pStatusController;
  String? Function(BuildContext, String?)? pStatusControllerValidator;
  // State field(s) for p_price widget.
  TextEditingController? pPriceController;
  String? Function(BuildContext, String?)? pPriceControllerValidator;
  // State field(s) for p_phone widget.
  TextEditingController? pPhoneController;
  final pPhoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? pPhoneControllerValidator;
  // State field(s) for p_desc widget.
  TextEditingController? pDescController;
  String? Function(BuildContext, String?)? pDescControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    dNameController?.dispose();
    pCityController?.dispose();
    pStatusController?.dispose();
    pPriceController?.dispose();
    pPhoneController?.dispose();
    pDescController?.dispose();
  }

  /// Additional helper methods are added here.

}
