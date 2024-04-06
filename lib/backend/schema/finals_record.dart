import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FinalsRecord extends FirestoreRecord {
  FinalsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "FinalsDate" field.
  String? _finalsDate;
  String get finalsDate => _finalsDate ?? '';
  bool hasFinalsDate() => _finalsDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _finalsDate = snapshotData['FinalsDate'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Finals')
          : FirebaseFirestore.instance.collectionGroup('Finals');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Finals').doc(id);

  static Stream<FinalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FinalsRecord.fromSnapshot(s));

  static Future<FinalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FinalsRecord.fromSnapshot(s));

  static FinalsRecord fromSnapshot(DocumentSnapshot snapshot) => FinalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FinalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FinalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FinalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FinalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFinalsRecordData({
  String? finalsDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FinalsDate': finalsDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class FinalsRecordDocumentEquality implements Equality<FinalsRecord> {
  const FinalsRecordDocumentEquality();

  @override
  bool equals(FinalsRecord? e1, FinalsRecord? e2) {
    return e1?.finalsDate == e2?.finalsDate;
  }

  @override
  int hash(FinalsRecord? e) => const ListEquality().hash([e?.finalsDate]);

  @override
  bool isValidKey(Object? o) => o is FinalsRecord;
}
