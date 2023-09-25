import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senati_conecta/screens/auth/authgate.dart';
import 'package:senati_conecta/screens/auth/otpsignup.dart';
import 'package:senati_conecta/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//APIS KEY
const supabaseUrl = 'https://uybxcqanaqipkbeubqco.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV5YnhjcWFuYXFpcGtiZXVicWNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTUyNzYyMjIsImV4cCI6MjAxMDg1MjIyMn0.p0P3thIleLKpoZ5x1QsxfUfmLt81BbZW7nvft9jKBAo';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Senati Conecta',
        theme: lightMode,
        darkTheme: darkMode,
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthGate(),
          '/signup': (context) => const OtpSignUp(),
        },
      );
    });
  }
}
