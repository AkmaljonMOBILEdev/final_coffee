import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/constants.dart';
import '../models/coffee_model/coffee_model.dart';
import '../models/universal_data.dart';
import '../models/user_model/user_model.dart';

class FirebaseRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //fake auth
  Future<UniversalData> signUpUser()async{
    mainCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: signInOnUPUser, password: passwordUser);
    return UniversalData(data: mainCredential);
  }
  Future<UniversalData> loginUser()async{
    UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: signInOnUPUser, password: passwordUser);
    return UniversalData(data: credential);
  }
  Future<UniversalData> logOut()async{
     await FirebaseAuth.instance.signOut();
    return UniversalData(data: "YES");
  }

  // users
  Future<UniversalData> signUser({required UserModel userModel}) async {
    try {
      DocumentReference newUser = await FirebaseFirestore.instance
          .collection(Collections.userCollection)
          .add(userModel.toJson());
      newUserId=newUser.id;
      await FirebaseFirestore.instance
          .collection(Collections.userCollection)
          .doc(newUser.id)
          .update({"id": newUser.id});
      return UniversalData(data: "User signed!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> updateUser({required UserModel userModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection(Collections.userCollection)
          .doc(userModel.id)
          .update(userModel.toJson());
      return UniversalData(data: "User is updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  // products
  Future<UniversalData> addCoffee({required CoffeeModel coffeeModel}) async {
      DocumentReference upLoaded = await FirebaseFirestore.instance
          .collection(Collections.coffeeCollection)
          .add(coffeeModel.toJson());
      await FirebaseFirestore.instance
          .collection(Collections.coffeeCollection)
          .doc(upLoaded.id)
          .update({"id": upLoaded.id});
      return UniversalData(data: "Coffee is added!");
  }

   setOrder({required List<CoffeeModel> list})async{
    // Create a new document or overwrite an existing one with set()
    await FirebaseFirestore.instance.collection('orders').doc(signInOnUPUser).set({
      'list': list,
      // Add more fields as needed
    });

  }


  Stream<List<CoffeeModel>> getOrders() async* {
    // Listen to the Firestore stream
    await for (QuerySnapshot querySnapshot in FirebaseFirestore.instance.collection("orders").snapshots()) {
      // Map each document snapshot to a CoffeeModel and collect them into a list
      List<CoffeeModel> orders = querySnapshot.docs.map((QueryDocumentSnapshot doc) {
        return CoffeeModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Yield the resulting list of CoffeeModel
      yield orders;
    }
  }




  Stream<List<CoffeeModel>> getAllCoffees({required String type}) async* {
    if (type=="All") {
      yield* FirebaseFirestore.instance.collection(Collections.coffeeCollection).snapshots().map(
              (event) =>
              event.docs.map((e) => CoffeeModel.fromJson(e.data())).toList());
    } else {
      yield* FirebaseFirestore.instance
          .collection(Collections.coffeeCollection)
          .where("type", isEqualTo: type)
          .snapshots()
          .map((event) =>
          event.docs.map((e) => CoffeeModel.fromJson(e.data())).toList());
    }
  }

  Stream<List<CoffeeModel>> search(String what) async* {
    yield* FirebaseFirestore.instance
        .collection(Collections.coffeeCollection)
        .snapshots()
        .map((event) => event.docs.map((e) => CoffeeModel.fromJson(e.data())).toList())
        .map((list) => list.where((item) => item.name.toLowerCase().startsWith(what.toLowerCase())).toList());
  }

  Stream<DocumentSnapshot> fetchUserDataStream(String userId) {
    return FirebaseFirestore.instance
        .collection(Collections.userCollection)
        .doc(userId)
        .snapshots();
  }




// Stream<List<CoffeeModel>> getOrderedCoffees() async* {
  //   yield* FirebaseFirestore.instance
  //       .collection(Collections.userCollection)
  //       .where("uniqueness", isEqualTo: signInOnUPUser)
  //       .snapshots()
  //       .map((event) {
  //     if (event.docs.isNotEmpty) {
  //       final userModel = UserModel.fromJson(event.docs.first.data());
  //       final orderedList = userModel.orderedList; // Assuming 'orderedList' is the field in userModel that you want
  //       return orderedList;
  //     } else {
  //       return []; // Return an empty list if no user with the specified 'uniqueness' is found
  //     }
  //   });
  // }







}
