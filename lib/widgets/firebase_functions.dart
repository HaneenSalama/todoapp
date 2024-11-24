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
    QuerySnapshot<TaskModel> querySnapshot = await tasksCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
