import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_med/firebase_options.dart';
import 'package:global_med/pages/pages.dart';
import 'package:global_med/state/provider/globalmed.user.provider.dart';
import 'package:global_med/utils/Size/utils.dart';
import 'package:global_med/utils/utils.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => GlobalMedProviderUser())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Global Med',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: RouteManager.generateRoute,
          home: SplashScreen(),
        );
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(
//           child: Text(
//         "xaxaxaxa",
//         style: TextStyle(fontFamily: "Acme"),
//       )),
//     );
//   }
// }
