import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senati_conecta/colors/colors.dart';
import 'package:senati_conecta/providers/authentication.dart';
import 'package:senati_conecta/screens/auth/startauth.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:country_code_picker/country_code_picker.dart';

final supabase = Supabase.instance.client;

class OtpSignUp extends StatefulWidget {
  const OtpSignUp({super.key});

  @override
  State<OtpSignUp> createState() => _OtpSignUpState();
}

class _OtpSignUpState extends State<OtpSignUp> {
  bool _isLoading = false;
  bool _isConfirmed = false;
  final _phoneFocusNode = FocusNode();
  late final TextEditingController _phoneController;
  final AuthProvider authProvider = AuthProvider();
  CountryCode _selectedCode = CountryCode.fromCountryCode('PE');

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
      if (_isConfirmed) {
        await authProvider.signInWithOtp(
            _selectedCode.dialCode.toString(), _phoneController.text.trim());
        if (mounted) {
          Future.delayed(const Duration(milliseconds: 500)).then(
                (_) => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StartAuth()), // Reemplaza con tu clase ScreenVerify
                ),
          );
        }
      } else {
        _showConfirmationDialog();
      }

  }

  @override
  void initState() {
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ingresa tu número',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'chirp_bold',
                    color: const Color(0xFF0F1418),
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  'Ingresa el codigo de tu pais y tu numero telefonico para completar el registro',
                  style: TextStyle(
                    color: secondaryColor,
                    fontFamily: 'chirp_regular',
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                CupertinoTextField(
                  controller: _phoneController,
                  focusNode: _phoneFocusNode,
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  keyboardType: TextInputType.number,
                  prefix: Container(
                    height: 37,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: CountryCodePicker(
                      onChanged: (code) {
                        setState(() {
                          _selectedCode = code;
                        });
                      },
                      initialSelection: 'PE',
                      favorite: const ['+51', 'PE'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      countryFilter: const [
                        'AR',
                        'BO',
                        'BR',
                        'CL',
                        'CO',
                        'CR',
                        'CU',
                        'DO',
                        'EC',
                        'GT',
                        'HN',
                        'MX',
                        'NI',
                        'PA',
                        'PE',
                        'PY',
                        'SV',
                        'UY',
                        'VE',
                      ],
                      comparator: (a, b) =>
                          a.name!.compareTo(b.name.toString()),
                      dialogTextStyle: TextStyle(
                        fontFamily: 'chirp_regular',
                        fontSize: 11.sp,
                        color: const Color(0xFF191919),
                      ),
                      flagWidth: 6.w,
                      padding: EdgeInsets.zero,
                      boxDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hideSearch: true,
                      textStyle: TextStyle(
                        fontFamily: 'chirp_regular',
                        fontSize: 11.sp,
                        color: const Color(0xFF191919),
                      ),
                    ),
                  ),
                  placeholder: 'Ingresa solo tu número teléfonico',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'chirp_regular',
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAEEF4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(height: 1.h),
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                    _signIn();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    const MaterialStatePropertyAll(primaryColor),
                    fixedSize: MaterialStatePropertyAll(Size(100.w, 0)),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ))
                  ),
                  child: _isLoading
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Colors.grey,
                    ),
                  )
                      : const Text(
                    'Siguiente',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFBFBFB),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 90.w,
            height: 145,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF191919).withOpacity(0.1),
                  offset: const Offset(1, 1),
                  blurRadius: 2.5,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: Colors.white,
                  child: ListTile(
                    dense: false,
                    horizontalTitleGap: 0.w,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0.w,
                    contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
                    title: Text(
                      '¿El número es correcto?',
                      style: TextStyle(
                        color: const Color(0xFF666666),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.normal,
                        height: 3,
                      ),
                    ),
                    subtitle: Text(
                      _phoneController.text,
                      style: TextStyle(
                        color: const Color(0xFF191919),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(0),
                        backgroundColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Editar',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Aquí puedes agregar la lógica para editar el número
                      },
                    ),
                    TextButton(
                      style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(0),
                        backgroundColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: const Text(
                        'SI',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pop();
                        setState(() {
                          _isConfirmed = true; // Establece la variable en true
                        });
                        _signIn(); // Llama a la función signIn para enviar el código de verificación
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
