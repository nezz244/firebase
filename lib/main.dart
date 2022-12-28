import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:theone/auth_page.dart';
import 'package:theone/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theone/utils.dart';
import 'login_widget.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Setup Firebase';

  get navigatorKey => null;@override
  Widget build(BuildContext context) {
    return MaterialApp(

      scaffoldMessengerKey: Utils().messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      
      title: title,
      
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),


      home: MainPage(),
    );
  }
}

class MainPage  extends StatelessWidget{
@override
Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
if (snapshot.hasData){
return HomePage();
}
else{
return AuthPage();
}

},
      )
);
}



