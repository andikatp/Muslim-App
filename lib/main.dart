import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadwal_solat/bloc/isi_quran_cubit.dart';
import 'package:jadwal_solat/bloc/nama_quran_cubit.dart';
import 'package:jadwal_solat/bloc/prayer_cubit.dart';
import 'package:jadwal_solat/core/services/router.dart';
import 'package:jadwal_solat/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,),);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PrayerCubit>(
          create: (BuildContext context) => PrayerCubit(),
        ),
        BlocProvider<NamaQuranCubit>(
          create: (BuildContext context) => NamaQuranCubit(),
        ),
        BlocProvider<IsiQuranCubit>(
          create: (BuildContext context) => IsiQuranCubit(),
        ),
      ],
      //   child: ScreenUtilInit(
      //     designSize: const Size(412, 732),
      //     minTextAdapt: true,
      //     builder: (context, child) => GestureDetector(
      //       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      //       child: MaterialApp.router(
      //         debugShowCheckedModeBanner: false,
      //         routerConfig: router,
      //       ),
      //     ),
      //   ),
      // );
      child: ScreenUtilInit(
        designSize: const Size(412, 732),
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale('id')],
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: GoogleFonts.poppins(
                color: Colors.black.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const MainScreen(),
        ),
      ),
    );
  }
}
