import 'AnimatedListTask.dart';
// ignore_for_file: file_names

import 'RegisterScreenTask.dart';
import 'package:first_app/share/comp.dart';
import 'package:flutter/material.dart';


                              
class LoginScreenTask extends StatefulWidget {
  const LoginScreenTask({super.key});

  @override
  State<LoginScreenTask> createState() => _LoginScreenTaskState();
}

class _LoginScreenTaskState extends State<LoginScreenTask> {
  bool _isObscure = true;  
  final  _emailController = TextEditingController();
  final  _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // media query is used to get the height and width of the screen ,,responsive
    double height =
        MediaQuery.of(context).size.height; // 0.6 means -> 60% of the screen
    double width = MediaQuery.of(context).size.width;
    //InkWell[part OF Screengi له حجم معين]"has a contradction with Media Query[full screen]" ,GestureDetector => unFoucus Keyboard
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset:
            true, //If true the [body] and the scaffold's floating widgets should size themselves to avoid the onscreen keyboard
        // SingleChildScrollView scs_v   ==>scrollable  To avoid overflow
        body: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(), //  bouncing scrollable  effect
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //header login and shape
                //3 methods to create a shape[(1)cliper"clip_path",,,(2)customPainter,,,,(3)Package"FlutterCustomClipper"]
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                      height: height / 3,
                      color: const Color.fromARGB(255, 11, 76, 216),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: height / 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
              
                //distance
                SizedBox(
                  height: height / 10,
                ),
              
              // =====================================Text Form Fields✍==========================
              
                //Email text field
                MyTextFormField(
                    labelText: "Email",
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    hinttext: "Example@test.com",
                    controller: _emailController,
                    validator: (value){
                      //not handle all cases ==> regex is better
                      if(value!.isEmpty){
                        return "Email is Empty";
                      }
                     else if(!value.contains("@")||!value.contains(".com")){
                        return "Email must have @ and .com";
                      }
                      return null;
                    },
                    ),
                    
                //Password text field
                MyTextFormField(
                  labelText: "PassWord",
                  prefixIcon: Icons.lock,
                  isObscure: _isObscure,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: const Color.fromARGB(255, 11, 76, 216),
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  hinttext: "*********",
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Password is Empty";
                    }
                   else if(value.length < 6){
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
              
              // =================================================================================
              
                //distance
                SizedBox(
                  height: height * .01,
                ),
              
              // ============================= ButtonS⏯===========================================
                //Login button
                Elevated_Button(
                  height: height,
                  width: width,
                  label: "login",
                  icon: Icons.login,
                  onPressed: () {
                    if( _formKey.currentState!.validate()){
                      // if (kDebugMode) {
                      //   print(_emailController.text);
                      // }
                      // debugPrint(_passwordController.text);
                      MyNavigator(context: context, page: const AnimatedListTask());
                    }
                  },
                ),
              
                //Register button
                OutLined_Button(
                  height: height,
                  width: width,
                  label: "Register",
                  icon: Icons.app_registration,
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return const RegisterScreen();
                    // }));
                    MyNavigator(context: context, page: const RegisterScreenTask());
                  },
                ),
              
              // =================================================================================
              ],
            ),
          ),
        ),
      ),
    );
  }
}
