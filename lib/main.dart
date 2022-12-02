import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/app/modules/home/views/home_view.dart';
import 'package:profile_student/utils/app_utils.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor:
                    MediaQuery.of(context).size.width <= 360 ? .85 : 1,
              ),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: AppUtils.dismissKeyboard,
                child: child,
              ),
            );
          },
          home: const HomeView(),
        );
      },
    );
  }
}
