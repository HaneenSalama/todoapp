// import 'package:todoapp/models/task_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebaseFunctions {
//   static getTasksCollection() =>
//       FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
//             fromFirestore: (docSnapshot, options) =>
//                 TaskModel.fromJson(docSnapshot.data()!),
//             toFirestore: (taskModel, _) => taskModel.toJson(),
//           );

//   static Future<void> addTaskToFirestore(TaskModel task) {
//     CollectionReference<TaskModel> tasksCollection = getTasksCollection();
//     DocumentReference<TaskModel> doc = tasksCollection.doc();
//     task.id = doc.id;
//     return doc.set(task);
//     //tasksCollection.doc('123');
//   }

//   static Future<List<TaskModel>> getAllTasksFromFirestore() async{}
//   CollectionReference<TaskModel> taskCollection = getTasksCollection();
//   await tasksCollection.get();
// }
/////////////////////////////////

import 'package:todoapp/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunctions {
  static getTasksCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
            fromFirestore: (docSnapshot, options) =>
                TaskModel.fromJson(docSnapshot.data()!),
            toFirestore: (taskModel, _) => taskModel.toJson(),
          );

  static Future<void> addTaskToFirestore(TaskModel task) async {
    CollectionReference<TaskModel> tasksCollection = getTasksCollection();
    DocumentReference<TaskModel> doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future<List<TaskModel>> getAllTasksFromFirestore() async {
    CollectionReference<TaskModel> tasksCollection = getTasksCollection();
    QuerySnapshot<TaskModel> querySnapshot = await tasksCollection
        .where(
          'data',
          // isEqualTo: Timestamp.fromDate(DateTime.now())
          //   isGreaterThanOrEqualTo: Timestamp.fromDate(
          //     DateTime(date.year, date.month, date.day, 0),
          //   ),
          //   isLessThanOrEqualTo: Timestamp.fromDate(
          //     DateTime(date.year, date.month, date.day, 23, 59, 59),
          //   ),
        )
        .get();
    return querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  static Future<void> DeleteTaskFromFirestore(String taskId) async {
    CollectionReference<TaskModel> tasksCollection = getTasksCollection();
    return tasksCollection.doc(taskId).delete();
  }
}
