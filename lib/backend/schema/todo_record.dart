import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TodoRecord extends FirestoreRecord {
  TodoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "number_tasks" field.
  int? _numberTasks;
  int get numberTasks => _numberTasks ?? 0;
  bool hasNumberTasks() => _numberTasks != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "prioritylevel" field.
  String? _prioritylevel;
  String get prioritylevel => _prioritylevel ?? '';
  bool hasPrioritylevel() => _prioritylevel != null;

  // "Taskname" field.
  String? _taskname;
  String get taskname => _taskname ?? '';
  bool hasTaskname() => _taskname != null;

  // "TaskDescription" field.
  String? _taskDescription;
  String get taskDescription => _taskDescription ?? '';
  bool hasTaskDescription() => _taskDescription != null;

  // "coursereferencetodo" field.
  DocumentReference? _coursereferencetodo;
  DocumentReference? get coursereferencetodo => _coursereferencetodo;
  bool hasCoursereferencetodo() => _coursereferencetodo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _numberTasks = castToType<int>(snapshotData['number_tasks']);
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _status = snapshotData['Status'] as String?;
    _prioritylevel = snapshotData['prioritylevel'] as String?;
    _taskname = snapshotData['Taskname'] as String?;
    _taskDescription = snapshotData['TaskDescription'] as String?;
    _coursereferencetodo =
        snapshotData['coursereferencetodo'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Todo')
          : FirebaseFirestore.instance.collectionGroup('Todo');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Todo').doc(id);

  static Stream<TodoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TodoRecord.fromSnapshot(s));

  static Future<TodoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TodoRecord.fromSnapshot(s));

  static TodoRecord fromSnapshot(DocumentSnapshot snapshot) => TodoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TodoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TodoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TodoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TodoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTodoRecordData({
  DocumentReference? owner,
  String? description,
  int? numberTasks,
  DateTime? timeCreated,
  String? status,
  String? prioritylevel,
  String? taskname,
  String? taskDescription,
  DocumentReference? coursereferencetodo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'description': description,
      'number_tasks': numberTasks,
      'time_created': timeCreated,
      'Status': status,
      'prioritylevel': prioritylevel,
      'Taskname': taskname,
      'TaskDescription': taskDescription,
      'coursereferencetodo': coursereferencetodo,
    }.withoutNulls,
  );

  return firestoreData;
}

class TodoRecordDocumentEquality implements Equality<TodoRecord> {
  const TodoRecordDocumentEquality();

  @override
  bool equals(TodoRecord? e1, TodoRecord? e2) {
    return e1?.owner == e2?.owner &&
        e1?.description == e2?.description &&
        e1?.numberTasks == e2?.numberTasks &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.status == e2?.status &&
        e1?.prioritylevel == e2?.prioritylevel &&
        e1?.taskname == e2?.taskname &&
        e1?.taskDescription == e2?.taskDescription &&
        e1?.coursereferencetodo == e2?.coursereferencetodo;
  }

  @override
  int hash(TodoRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.description,
        e?.numberTasks,
        e?.timeCreated,
        e?.status,
        e?.prioritylevel,
        e?.taskname,
        e?.taskDescription,
        e?.coursereferencetodo
      ]);

  @override
  bool isValidKey(Object? o) => o is TodoRecord;
}
