import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:vegi_app/Config/Colors.dart';
import 'package:vegi_app/Providers/product_provider.dart';
import 'package:vegi_app/Providers/user_provider.dart';
import 'package:vegi_app/Providers/wishlist_provider.dart';
import '../Providers/review_cart_provider.dart';
import 'auth/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<ReviewCartProvider>(
            create: (context) => ReviewCartProvider()),
        ChangeNotifierProvider<WishListProvider>(
            create: (context) => WishListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignIn(),
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: primaryColor,
                iconTheme: IconThemeData(color: textColor),
                titleTextStyle: TextStyle(color: Colors.black)),
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor),
      ),
    );
  }
}
