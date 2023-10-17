import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_coffee/cubits/order/order_cubit.dart';
import 'package:final_coffee/cubits/search/search_cubit.dart';
import 'package:final_coffee/data/local/storage_repository/storage_repository.dart';
import 'package:final_coffee/services/service_locator/service_locator.dart';
import 'package:final_coffee/ui/app_routes.dart';
import 'package:final_coffee/utils/constants.dart';
import 'package:final_coffee/utils/functions.dart';
import 'package:final_coffee/utils/theme.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubits/coffee/coffee_cubit.dart';
import 'cubits/tab/tab_cubit.dart';
import 'cubits/user/user_cubit.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  await Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;

  // Initialize Firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Initialize Cloud Storage
  FirebaseStorage storage = FirebaseStorage.instance;
  getItSetup();
  // await initializeFirebaseServices();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => CoffeeCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => OrderCubit()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(figmaWidth, figmaHeight),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.mainTheme,
          themeMode: ThemeMode.light,
          initialRoute: RouteNames.splash,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
