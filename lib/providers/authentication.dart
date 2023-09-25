import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProvider extends ChangeNotifier {
  final supabase = Supabase.instance.client;
  //Authentication OTP
  Future<void> signInWithOtp(String country, String phoneNumber) async {
    try {
      await supabase.auth.signInWithOtp(
        phone: (country + phoneNumber),
      );
    } on AuthException catch (error) {
      throw error.message;
    } catch (error) {
      throw 'Unexpected error occurred';
    }
  }
}
