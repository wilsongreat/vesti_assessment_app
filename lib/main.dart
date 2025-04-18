import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vesti_assessment_app/config/app_colors.dart';
import 'package:vesti_assessment_app/config/router.dart';


final GlobalKey<NavigatorState>  appNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  debugPaintSizeEnabled = false;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Vesti App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: AppColors.kWhite
        ),
        colorScheme: ColorScheme.light(),
        useMaterial3: true,
      ),
      routerConfig: AppRouterConfig.router,
    );
  }
}


