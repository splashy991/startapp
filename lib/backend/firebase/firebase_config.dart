import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAMs_kGX_U12yFWEY4uuWD8b_LIswSlsAs",
            authDomain: "startapp-a2b57.firebaseapp.com",
            projectId: "startapp-a2b57",
            storageBucket: "startapp-a2b57.appspot.com",
            messagingSenderId: "857297845894",
            appId: "1:857297845894:web:68577cdd997e7271899b07",
            measurementId: "G-SFH0DKJGTB"));
  } else {
    await Firebase.initializeApp();
  }
}
