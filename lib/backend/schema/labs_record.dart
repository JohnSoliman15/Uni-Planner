import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class LabsRecord extends FirestoreRecord {
  LabsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Labs" field.
  String? _labs;
  String get labs => _labs ?? '';
  bool hasLabs() => _labs != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _labs = snapshotData['Labs'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Labs')
          : FirebaseFirestore.instance.collectionGroup('Labs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Labs').doc(id);

  static Stream<LabsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LabsRecord.fromSnapshot(s));

  static Future<LabsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LabsRecord.fromSnapshot(s));

  static LabsRecord fromSnapshot(DocumentSnapshot snapshot) => LabsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LabsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LabsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LabsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LabsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLabsRecordData({
  String? labs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Labs': labs,
    }.withoutNulls,
  );

  return firestoreData;
}

class LabsRecordDocumentEquality implements Equality<LabsRecord> {
  const LabsRecordDocumentEquality();

  @override
  bool equals(LabsRecord? e1, LabsRecord? e2) {
    return e1?.labs == e2?.labs;
  }

  @override
  int hash(LabsRecord? e) => const ListEquality().hash([e?.labs]);

  @override
  bool isValidKey(Object? o) => o is LabsRecord;
}
