import 'package:cloud_firestore/cloud_firestore.dart';

/// Servicio con el cual se puede consumir los servicios de la firestore de Firebase
class FirebaseCloudService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(
      {required String collection, String? property, String? equal}) {
    //Se necesita de esta forma
    // ignore: prefer-conditional-expressions
    if (property != null) {
      return firestore
          .collection(collection)
          .where(property, isEqualTo: equal)
          .withConverter<Map<String, dynamic>>(
            fromFirestore: (snapshot, _) =>
                Map<String, dynamic>.from((snapshot.data()!)),
            toFirestore: (data, _) => data,
          )
          .get();
    } else {
      return firestore
          .collection(collection)
          .withConverter<Map<String, dynamic>>(
            fromFirestore: (snapshot, _) =>
                Map<String, dynamic>.from((snapshot.data()!)),
            toFirestore: (data, _) => data,
          )
          .get();
    }
  }

  Stream<QuerySnapshot> getCollectionSnapshot({required String collection}) {
    return firestore.collection(collection).snapshots();
  }

  Stream<QuerySnapshot> getOrderedCollectionSnapshot(
      {required String collection,
      required String property,
      required bool desc}) {
    return firestore
        .collection(collection)
        .orderBy(property, descending: desc)
        .withConverter<Map<String, dynamic>>(
          fromFirestore: (snapshot, _) =>
              Map<String, dynamic>.from((snapshot.data()!)),
          toFirestore: (data, _) => data,
        )
        .snapshots();
  }

  Stream<QuerySnapshot> getCollectionSnapshotQuery(
      {required String collection,
      required String property,
      required String equal}) {
    return firestore
        .collection(collection)
        .where(property, isEqualTo: equal)
        .snapshots();
  }

  Future<QuerySnapshot> getCollectionPaginated(
      {required String collection,
      required int numItems,
      DocumentSnapshot? next,
      String orderBy = 'createdAt'}) {
    if (next != null) {
      return firestore
          .collection(collection)
          .orderBy(orderBy)
          .startAfterDocument(next)
          .limit(numItems)
          .withConverter<Map<String, dynamic>>(
            fromFirestore: (snapshot, _) =>
                Map<String, dynamic>.from((snapshot.data()!)),
            toFirestore: (data, _) => data,
          )
          .get();
    }

    return firestore
        .collection(collection)
        .orderBy(orderBy)
        .limit(numItems)
        .withConverter<Map<String, dynamic>>(
          fromFirestore: (snapshot, _) =>
              Map<String, dynamic>.from((snapshot.data()!)),
          toFirestore: (data, _) => data,
        )
        .get();
  }

  Future saveDocument(
      {required Map<String, dynamic> document,
      required String collection}) async {
    String? documentId = document['id'];
    document.addAll(
        {'createdAt': DateTime.now().millisecondsSinceEpoch, 'createdBy': ''});
    if (documentId != null) {
      return firestore.collection(collection).doc(documentId).set(document);
    } else {
      String id = createId(collection: collection);
      return firestore
          .collection(collection)
          .doc(id)
          .set({'id': id, ...document});
    }
  }

  Future updateDocument(
      {required String documentID,
      required Map<String, dynamic> data,
      required String collection}) {
    return firestore.doc('$collection/$documentID').update({
      ...data,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
      'updatedBy': ''
    }).catchError((_) {
      saveDocument(document: data, collection: collection);
    });
  }

  createId({required String collection}) {
    CollectionReference collRef =
        FirebaseFirestore.instance.collection(collection);
    DocumentReference docReferance = collRef.doc();
    return docReferance.id;
  }

  deleteDocument({required String documentId, required String collection}) {
    return firestore.collection(collection).doc(documentId).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument(
      {required String documentId, required String collection}) {
    return firestore
        .collection(collection)
        .doc(documentId)
        .withConverter<Map<String, dynamic>>(
          fromFirestore: (snapshot, _) =>
              Map<String, dynamic>.from((snapshot.data()!)),
          toFirestore: (data, _) => data,
        )
        .get();
  }
}

final FirebaseCloudService firebaseService = FirebaseCloudService();
