import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/SpleshScreen.dart';
import 'package:tranlate/Widget/loader.dart';
import 'package:tranlate/tr.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => authprovider(),)],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
primaryColor: Colors.black.withOpacity(0.4),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:SpleshScreen(),
          builder: EasyLoading.init(),
        ),
      );
    }
    );
  }
}