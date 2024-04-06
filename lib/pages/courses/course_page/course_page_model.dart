import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'course_page_widget.dart' show CoursePageWidget;
import 'package:flutter/material.dart';

class CoursePageModel extends FlutterFlowModel<CoursePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // State field(s) for Taskname widget.
  FocusNode? tasknameFocusNode;
  TextEditingController? tasknameController;
  String? Function(BuildContext, String?)? tasknameControllerValidator;
  DateTime? datePicked;
  // State field(s) for duedatetext widget.
  FocusNode? duedatetextFocusNode;
  TextEditingController? duedatetextController;
  String? Function(BuildContext, String?)? duedatetextControllerValidator;
  // State field(s) for PriorityLevel widget.
  String? priorityLevelValue;
  FormFieldController<String>? priorityLevelValueController;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;

  @override
  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    tasknameFocusNode?.dispose();
    tasknameController?.dispose();

    duedatetextFocusNode?.dispose();
    duedatetextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }
}
