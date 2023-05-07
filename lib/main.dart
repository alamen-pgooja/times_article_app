import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pop_articles/ui/artical_details/screens/article_detail.dart';
import 'package:pop_articles/ui/home/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'core/dp/locater.dart';
import 'core/utils/fonts.dart';
import 'models/article.dart';
import 'network/network_manager.dart';
import 'providers/home_provider.dart';

Future<void> main() async {
  // 1- load the environment variables
  await dotenv.load();
  // 2 setup dependency injection class
  setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget multiProvider(BuildContext context){
    return MultiProvider(
      providers: [
        //initiate the provider using dependency injection
        ///NetworkManager service/client is injected to Home provider
        ///this will make the test easier if we need to replace wz MOCK service
        ChangeNotifierProvider(
            create: (context) => HomeProvider(locator<NetworkManager>())
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return MaterialApp(
            title: 'NYT Articles',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: AppFont.of(context).fontRegular,
            ),
            home: child,
            routes: <String, WidgetBuilder>{
              ArticleDetails.routeKey: (BuildContext context) => ArticleDetails(
                  ModalRoute.of(context)!.settings.arguments! as Article),
            },
          );
        },
        child:const HomeScreen(),
      )
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return multiProvider(context);
  }
}

