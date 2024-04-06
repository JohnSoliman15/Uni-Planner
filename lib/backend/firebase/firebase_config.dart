import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCPHYXzOnsY08cEpi4i0uDMGeYfAqzajh4",
            authDomain: "uni-planner-rchixm.firebaseapp.com",
            projectId: "uni-planner-rchixm",
            storageBucket: "uni-planner-rchixm.appspot.com",
            messagingSenderId: "611721345477",
            appId: "1:611721345477:web:1e73ff9bfbc7e4711333ac"));
  } else {
    await Firebase.initializeApp();
  }
}
