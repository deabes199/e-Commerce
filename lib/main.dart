import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/bloc_observer.dart';
import 'package:hero_store_app/core/di/dependancy_injection.dart';
import 'package:hero_store_app/core/helpers/functions.dart';
import 'package:hero_store_app/core/routing/app_router.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/cubit/theme_cubit.dart';
import 'package:hero_store_app/core/theming/theme_style.dart';
import 'package:hero_store_app/firebase_options.dart';

bool isLoggedInUser = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  await setUpGetIt();
  await HelperFunctions.checkIfLoggedInUser();

  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            splitScreenMode: true,
            minTextAdapt: true,
            child: MaterialApp(
              theme: state,
              themeMode:
                  state == AppThemes.light ? ThemeMode.light : ThemeMode.dark,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: isLoggedInUser
                  ? Routes.bottomNavBarScreen
                  : Routes.loginScreen,
            ),
          );
        },
      ),
    );
  }
}

