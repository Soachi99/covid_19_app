// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:covid_19_app/src/app.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyCjI2-j4hPvjVkDu9Y5lnsrcAZG9EZtX-A",
  //         appId: "1:687661812126:android:cb97a83d618a3fac51ee8f",
  //         messagingSenderId: "687661812126",
  //         projectId: "wellbeingcheckup"));

  runApp(const ProviderScope(child: App()));
}
