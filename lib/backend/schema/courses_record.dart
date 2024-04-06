import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CourseName" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  bool hasCourseName() => _courseName != null;

  // "Professor" field.
  String? _professor;
  String get professor => _professor ?? '';
  bool hasProfessor() => _professor != null;

  // "Coursestart" field.
  DateTime? _coursestart;
  DateTime? get coursestart => _coursestart;
  bool hasCoursestart() => _coursestart != null;

  // "Courseend" field.
  DateTime? _courseend;
  DateTime? get courseend => _courseend;
  bool hasCourseend() => _courseend != null;

  // "Cost" field.
  int? _cost;
  int get cost => _cost ?? 0;
  bool hasCost() => _cost != null;

  // "coursedescription" field.
  String? _coursedescription;
  String get coursedescription => _coursedescription ?? '';
  bool hasCoursedescription() => _coursedescription != null;

  // "Coursephoto" field.
  String? _coursephoto;
  String get coursephoto => _coursephoto ?? '';
  bool hasCoursephoto() => _coursephoto != null;

  // "Userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  void _initializeFields() {
    _courseName = snapshotData['CourseName'] as String?;
    _professor = snapshotData['Professor'] as String?;
    _coursestart = snapshotData['Coursestart'] as DateTime?;
    _courseend = snapshotData['Courseend'] as DateTime?;
    _cost = castToType<int>(snapshotData['Cost']);
    _coursedescription = snapshotData['coursedescription'] as String?;
    _coursephoto = snapshotData['Coursephoto'] as String?;
    _userid = snapshotData['Userid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? courseName,
  String? professor,
  DateTime? coursestart,
  DateTime? courseend,
  int? cost,
  String? coursedescription,
  String? coursephoto,
  String? userid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CourseName': courseName,
      'Professor': professor,
      'Coursestart': coursestart,
      'Courseend': courseend,
      'Cost': cost,
      'coursedescription': coursedescription,
      'Coursephoto': coursephoto,
      'Userid': userid,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    return e1?.courseName == e2?.courseName &&
        e1?.professor == e2?.professor &&
        e1?.coursestart == e2?.coursestart &&
        e1?.courseend == e2?.courseend &&
        e1?.cost == e2?.cost &&
        e1?.coursedescription == e2?.coursedescription &&
        e1?.coursephoto == e2?.coursephoto &&
        e1?.userid == e2?.userid;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.courseName,
        e?.professor,
        e?.coursestart,
        e?.courseend,
        e?.cost,
        e?.coursedescription,
        e?.coursephoto,
        e?.userid
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
