import 'dart:async';
import 'package:MovieDiscoveryApp/app/theme/theme_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:MovieDiscoveryApp/screens/movie_home_screen.dart';
import 'package:MovieDiscoveryApp/utils/CustomPreference.dart';
import 'package:MovieDiscoveryApp/utils/common.dart';
import 'package:MovieDiscoveryApp/utils/common_shared_preferences.dart';
import 'ApiServices/api_services.dart';
import 'ApiServices/api_utils.dart';
import 'BlocProvider/Movie_Detail_Bloc.dart';
import 'BlocProvider/Movie_Search_Bloc.dart';
import 'BlocProvider/Movies_Bloc.dart';
import 'app/app_theme.dart';
import 'utils/PrefKeys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  FlutterAppBadger.removeBadge();
  magnifierFun();
  // Authentication.initializeFirebase();
  String? isLoggedIn =
  await CommonSharedPreferences.getPreferences(PrefKeys.loginToken);

  runApp(EasyLocalization(
    path: "assets/locales_lan",
    supportedLocales: const [
      Locale('en', 'UK'),
      Locale('es', 'SP'),
    ],
    useFallbackTranslations: true,
    saveLocale: false,
    useOnlyLangCode: true,
    child: MyApp(
        initialScreen: MovieHomeScreen()

    ),
  ));
}


void magnifierFun() {
  TextMagnifier.adaptiveMagnifierConfiguration = TextMagnifierConfiguration(
      shouldDisplayHandlesInMagnifier: false,
      magnifierBuilder: (BuildContext context,
          MagnifierController controller,
          ValueNotifier<MagnifierInfo> magnifierInfo,) {
        switch (defaultTargetPlatform) {
          case TargetPlatform.iOS:
            return null;
          case TargetPlatform.android:
            return TextMagnifier(
              magnifierInfo: magnifierInfo,
            );
          case TargetPlatform.fuchsia:
          case TargetPlatform.linux:
          case TargetPlatform.macOS:
          case TargetPlatform.windows:
            return null;
        }
      });
}

class MyApp extends StatefulWidget {
  final Widget? initialScreen;

  // const MyApp({super.key, this.initialScreen});
  const MyApp({Key? key, this.initialScreen}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppUtils appUtils = AppUtils();
  ApiServices provider = ApiServices();
  String? isLoggedIn;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  //FirebaseMessaging messaging = FirebaseMessaging.instance;
  //late Timer timer;
  @override
  void initState() {
    super.initState();
    setLocalization();

    //FirebaseNotification().firebaseInitialize(NavigationService.navigatorKey);
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _apiMethods();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    print("dispose call");
    //timer.cancel();
    super.dispose();
  }


  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  setLocalization() async {
    String lang = await CustomPreferences.getPreferences(PrefKeys.lang);
    if (lang == 'null') {
      lang = 'en';
    }
    if (lang == 'en') {
      context.setLocale(const Locale('en', 'UK'));
    } else if (lang == 'es') {
      context.setLocale(const Locale('es', 'SP'));
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Common.removeFocus(context);
      },
      child: MultiBlocProvider(
        providers: [

          BlocProvider<MoviesBloc>(
            create: (context) => MoviesBloc(appUtils),
          ),
          BlocProvider<MovieSearchListBloc>(
            create: (context) => MovieSearchListBloc(),
          ),

          BlocProvider<MovieDetailBloc>(
            create: (context) => MovieDetailBloc(),
          ),

          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc()..add(const GetCurrentThemeEvent()),
          ),

        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              navigatorKey: NavigationService.navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Movie Discovery App',
              darkTheme: AppTheme.darkTheme,
              theme: AppTheme.lightTheme,
              themeMode: state.currentTheme,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.noScaling),
                  child: child!,
                );
              },
              home: widget.initialScreen,
            );
          },
        ),
      ),
      //),
    );
  }

  _apiMethods() async {
    await ApiServices.getId();
    if (kDebugMode) {
      print('Get id api called');
    }
    await CommonSharedPreferences.getPreferences(PrefKeys.loginToken)
        .then((value) async {});
  }


}


class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class CustomDeviceFrame extends StatelessWidget {
  final Widget child;

  CustomDeviceFrame({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox.expand(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: child,
        ),
      ),
    );
  }
}
