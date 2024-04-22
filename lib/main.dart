import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naffith/common/values/colors.dart';
import 'common/di/dependency_injection.dart';
import 'common/routes/routes.dart';
import 'common/values/constants_design.dart';
import 'firebase_options.dart';
import 'global.dart';
import 'noti_controller.dart';

Future<void> main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await Future.delayed(const Duration(seconds:3));
  await Global.init();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromRGBO(23, 56, 61, 1), // navigation bar color
      statusBarColor: Color.fromRGBO(23, 56, 61, 1)
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final notificationsController = NotificationsController();
  await notificationsController.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            color: AppColors.primaryBackground,
           //// Specify your desired locale
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
               Locale('ar'),
            ],
            locale: const Locale('ar'),
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: kBackgroundColor,
                dividerColor: Colors.transparent,
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(
                      color: Color.fromRGBO(23, 56, 61, 1),
                    ),
                    elevation: 0,
                    backgroundColor: Color.fromRGBO(23, 56, 61, 1))),
            onGenerateRoute: AppPages.generateRouteSettings,
          )),
    );
  }
}
