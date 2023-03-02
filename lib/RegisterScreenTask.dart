import 'LoginScreenTask.dart';
import 'package:first_app/share/comp.dart';
import 'package:flutter/material.dart';

class RegisterScreenTask extends StatefulWidget {
  const RegisterScreenTask({super.key});

  @override
  State<RegisterScreenTask> createState() => _RegisterScreenTaskState();
}

class _RegisterScreenTaskState extends State<RegisterScreenTask> {
  bool _isObscure = true;
  bool _isObscure2 = true;
  final  _emailController = TextEditingController();
  final  _passwordController = TextEditingController();
  final  _nameController = TextEditingController();
  final  _phoneController = TextEditingController();
  final  _confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //write here any code you want to execute when the screen is opened
  }
  @override
  Widget build(BuildContext context) {
    // media query is used to get the height and width of the screen ,,responsive
    double height =
        MediaQuery.of(context).size.height; // 0.6 means -> 60% of the screen
    double width = MediaQuery.of(context).size.width;
    //generator rouate ,,,route,,navigator ->3 methods to navigate between screens
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
            key: _formKey,// 👳‍♀️🤴
            child: Column(
              children: [
                //header login and shape
                //3 methods to create a shape[(1)cliper"clip_path",,,(2)customPainter,,,,(3)Package"FlutterCustomClipper"]
                ClipPath(
                  clipper: MyClipper(),
                  child: Stack(
                    children: [
                      Container(
                          height: height / 3,
                          color: const Color.fromARGB(255, 11, 76, 216),
                          child: Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: height / 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      Positioned(
                        top: height / 20,
                        //back button
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              
                //distance
                SizedBox(
                  height: height / 20,
                ),
              
              // =====================================Text Form Fields✍==========================
              
                //Name text field
                MyTextFormField(
                  labelText: "Name",
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Name is Empty";
                    }
                    
                    return null;
                  },
                ),
                //Email text field
                MyTextFormField(
                    labelText: "Email",
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    hinttext: "Example@test.com",
                    validator: (value){
                      //not handle all cases ==> regex is better
                       if(value!.isEmpty){
                          return "Email is Empty";
                        }
                      else  if(!value.contains("@")||!value.contains(".com")){
                          return "Email must have @ and .com";
                        }
                      return null;},
                    controller: _emailController,),
                //Mobile text field
                MyTextFormField(
                  labelText: "Phone",
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value){
                    if(value!.isEmpty){
                      return "phone is Empty";
                    }
                   else if(value.length != 11){
                      return "Phone must be 11 number";
                    }
                    return null;},
                  controller: _phoneController,
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
                        return "password must be at least 6 characters";
                      }
                    return null;},
                ),
                //Confirm Password text field
                MyTextFormField(
                  labelText: "Confirm PassWord",
                  prefixIcon: Icons.lock,
                  isObscure: _isObscure2,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure2 ? Icons.visibility_off : Icons.visibility,
                      color: const Color.fromARGB(255, 11, 76, 216),
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure2 = !_isObscure2;
                      });
                    },
                  ),
                  hinttext: "*********",
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Password is Empty";
                    }
                   else if(value.length < 6){
                      return "Password must be at least 6 characters";
                    }
                   else if(value != _passwordController.text){
                      return "Password is not match";
                    }
                    return null;
                  },
              
                    controller: _confirmPassword,
                ),
              // =================================================================================
              
                //distance
                SizedBox(
                  height: height * .01,
                ),
              
              // ============================= ButtonS⏯===========================================
                //Register button
                Elevated_Button(
                  height: height,
                  width: width,
                  label: "Register",
                  icon: Icons.app_registration,
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      // debugPrint(_emailController.text);
                      // debugPrint(_passwordController.text);
                      // debugPrint(_nameController.text);
                      // debugPrint(_phoneController.text);
                      // debugPrint(_confirmPassword.text);

                    }
                    else{
                      print("not valid");
                    }
                  },
                ),
              
                //Login button
                OutLined_Button(
                  height: height,
                  width: width,
                  Labelpaddinghor:3.5 ,
                  label: "login",
                  icon: Icons.login,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) {
                      return const LoginScreenTask();
                    }), (route) => false);
                  },
                ),
              
              // =================================================================================
                //distance
                SizedBox(
                  height: height / 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
