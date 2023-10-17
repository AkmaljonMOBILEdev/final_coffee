import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

Future<void> initializeFirebaseServices() async {
  try {
    // Initialize Firebase without Firebase Auth and App Check
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyCh-pBlvnVTUfC1wwyeUvoKKnzjXsiXT7I',
        authDomain: 'coffee-app-f3aed.firebaseapp.com	',
        projectId: 'coffee-app-f3aed',
        messagingSenderId: '441728997985',
        appId: '1:441728997985:android:cc3b24d76a2f1cece7e820',
      ),
    );
    FirebaseAuth auth = FirebaseAuth.instance;

    // Initialize Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Initialize Cloud Storage
    FirebaseStorage storage = FirebaseStorage.instance;

    print('Firebase services initialized successfully.');
  } catch (e) {
    print('Error initializing Firebase services: $e');
  }
}

