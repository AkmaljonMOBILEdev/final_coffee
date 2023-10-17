import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

import '../data/models/type_model/type_model.dart';

 String passwordUser = "";
 String signInOnUPUser = "";

late UserCredential mainCredential;

const String loginForAdmin = "a";
const String passwordForAdmin = "a";

double width = 1;
double height = 1;

double figmaHeight = 852;
double figmaWidth = 393;

class Collections{
  static const String userCollection = "users";
  static const String coffeeCollection = "coffees";
}

const String webKey="BPaXQD941pnLwIZecc8C5AhUmrBPKJ3MI4ZSV9fU91FHsBkPhjw5tt-rluHg9-KL6mhi07JrkGdcCuvRUnp8JT4";


String newUserId="";


