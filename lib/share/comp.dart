// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

//u can use change ispassword to true or false and setState  and make a stateful widget class 
// and use internal method to setstate to change the value of ispassword
Widget MyTextFormField({
  required String labelText,
  required IconData prefixIcon,
  IconButton? suffixIcon,
  double padding = 16,
  TextInputType? keyboardType,
  String? hinttext,
  bool isObscure = false,
  required String? Function(String?)? validator,
  TextEditingController? controller,
}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: TextFormField(
      //validator ==>not exist in text-field
      // validator: (value) {
      //   // not exist in text-field
      //   if (value!.isEmpty) {
      //     return 'Please enter some text';
      //   }
      //   return null;
      // },
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hinttext,
        prefixIcon: Icon(
          prefixIcon,
          color: const Color.fromARGB(255, 11, 76, 216),
        ),
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 0, 255, 106),
              width: 2,
              style: BorderStyle.solid),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Colors.red, width: 2, style: BorderStyle.solid),
        ),
      ),
    ),
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 1.25);
    path.cubicTo(size.width / 2 * 0.6, size.height * 0.5, size.width,
        size.height * 1.2, size.width * 1.2, size.height / 1.5);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

Widget OutLined_Button({
  required String label,
  required IconData icon,
  required VoidCallback onPressed,
  required double height,
  required double width,

  double Labelpaddinghor = 5,
  double Labelpaddingver = 60,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: height / 50),
    child: OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 30,
        color: const Color.fromARGB(255, 11, 76, 216),
      ),
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 11, 76, 216)),
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            vertical: height / Labelpaddingver,
            horizontal: width / Labelpaddinghor)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    ),
  );
}


Widget Elevated_Button({
  required String label,
  required IconData icon,
  required VoidCallback onPressed,
  required double height,
  required double width,
  // ignore: non_constant_identifier_names
  double Labelpaddinghor = 4,
  // ignore: non_constant_identifier_names
  double Labelpaddingver = 60,
}) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: height / 50,
    ),
    child: ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 30,
      ),
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 11, 76, 216)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: height / 60, horizontal: width / 4)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    ),
  );
}

//Pass Context and Page to Navigate to it
Future MyNavigator({required BuildContext context, required Widget page}) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}