import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class HomeworksRecord extends FirestoreRecord {
  HomeworksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Homeworktitle" field.
  String? _homeworktitle;
  String get homeworktitle => _homeworktitle ?? '';
  bool hasHomeworktitle() => _homeworktitle != null;

  // "Homeworkduedate" field.
  DateTime? _homeworkduedate;
  DateTime? get homeworkduedate => _homeworkduedate;
  bool hasHomeworkduedate() => _homeworkduedate != null;

  // "Homeworkpriority" field.
  String? _homeworkpriority;
  String get homeworkpriority => _homeworkpriority ?? '';
  bool hasHomeworkpriority() => _homeworkpriority != null;

  // "Homeworkdescription" field.
  String? _homeworkdescription;
  String get homeworkdescription => _homeworkdescription ?? '';
  bool hasHomeworkdescription() => _homeworkdescription != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _homeworktitle = snapshotData['Homeworktitle'] as String?;
    _homeworkduedate = snapshotData['Homeworkduedate'] as DateTime?;
    _homeworkpriority = snapshotData['Homeworkpriority'] as String?;
    _homeworkdescription = snapshotData['Homeworkdescription'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Homeworks')
          : FirebaseFirestore.instance.collectionGroup('Homeworks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Homeworks').doc(id);

  static Stream<HomeworksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HomeworksRecord.fromSnapshot(s));

  static Future<HomeworksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HomeworksRecord.fromSnapshot(s));

  static HomeworksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HomeworksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HomeworksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HomeworksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HomeworksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HomeworksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHomeworksRecordData({
  String? homeworktitle,
  DateTime? homeworkduedate,
  String? homeworkpriority,
  String? homeworkdescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Homeworktitle': homeworktitle,
      'Homeworkduedate': homeworkduedate,
      'Homeworkpriority': homeworkpriority,
      'Homeworkdescription': homeworkdescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class HomeworksRecordDocumentEquality implements Equality<HomeworksRecord> {
  const HomeworksRecordDocumentEquality();

  @override
  bool equals(HomeworksRecord? e1, HomeworksRecord? e2) {
    return e1?.homeworktitle == e2?.homeworktitle &&
        e1?.homeworkduedate == e2?.homeworkduedate &&
        e1?.homeworkpriority == e2?.homeworkpriority &&
        e1?.homeworkdescription == e2?.homeworkdescription;
  }

  @override
  int hash(HomeworksRecord? e) => const ListEquality().hash([
        e?.homeworktitle,
        e?.homeworkduedate,
        e?.homeworkpriority,
        e?.homeworkdescription
      ]);

  @override
  bool isValidKey(Object? o) => o is HomeworksRecord;
}
