import 'package:flutter/material.dart';
import 'package:senati_conecta/screens/auth/startauth.dart';
import 'package:senati_conecta/screens/mainscreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: supabase.auth.onAuthStateChange,
      initialData: supabase.auth.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const StartAuth();
        }
        return const MainScreen();
      },
    );
  }
}
