import '/flutter_flow/flutter_flow_util.dart';
import 'addcourse_widget.dart' show AddcourseWidget;
import 'package:flutter/material.dart';

class AddcourseModel extends FlutterFlowModel<AddcourseWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Coursename widget.
  FocusNode? coursenameFocusNode;
  TextEditingController? coursenameController;
  String? Function(BuildContext, String?)? coursenameControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for ProfessorName widget.
  FocusNode? professorNameFocusNode;
  TextEditingController? professorNameController;
  String? Function(BuildContext, String?)? professorNameControllerValidator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioController;
  String? Function(BuildContext, String?)? myBioControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    coursenameFocusNode?.dispose();
    coursenameController?.dispose();

    professorNameFocusNode?.dispose();
    professorNameController?.dispose();

    myBioFocusNode?.dispose();
    myBioController?.dispose();
  }
}
