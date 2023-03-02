import 'package:flutter/material.dart';

import 'customShapePractice.dart';

// ignore: camel_case_types
class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

// ignore: camel_case_types
class _login_screenState extends State<login_screen> {
  bool secourText = true; //for hidden/show password switch ..in password field
  bool secourText2 =
      true; //for hidden/show password switch..in confirm password field

  @override
  Widget build(BuildContext context) {
    // media query is used to get the height and width of the screen ,,responsive
    double height =
        MediaQuery.of(context).size.height; // 0.6 means -> 60% of the screen
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true, //If true the [body] and the scaffold's floating widgets should size themselves to avoid the onscreen keyboard 
      appBar: AppBar(
        toolbarHeight: 250,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Center(
          child: Text('Register Screen',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30)),
        ),
        flexibleSpace: ClipPath(
          clipper: customShape(),
          child: Container(
            // height: 300,
            width: double.infinity,
            color: Colors.purple,
          ),
        ),
      ),
      // SingleChildScrollView scs_v   ==>scrollable
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Flutter(
            //     size: height * 0.2,
            //   ),
            // ),

            //login card" like (Container) but with  features like elevation,shape,..etc ,,take a size of it's child  "
            //situble for login and register FormS
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                //extend from shape border
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //login text"before text-FieldS"
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Register",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                        ),
                      ),
                      //name Field
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          // height: height * 0.1,
                          width: width * 0.8,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.deepPurple),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Full Name',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //phone Field
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          // height: height * 0.1,
                          width: width * 0.8,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.deepPurple,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //email Field
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          // height: height * 0.1,
                          width: width * 0.8,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'example@test.com',
                              labelText: 'Email',
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.deepPurple),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //password Field
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          // height: height * 0.1,
                          width: width * 0.8,
                          child: TextFormField(
                            obscureText: secourText, //for hidden password

                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      secourText = !secourText;
                                    });
                                  },
                                  icon: Icon(secourText
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock,
                                  color: Colors.deepPurple),
                              filled: true,
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //confirm password Field
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          // height: height * 0.1,
                          width: width * 0.8,
                          child: TextFormField(
                            obscureText: secourText2, //for hidden password
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      secourText2 = !secourText2;
                                    });
                                  },
                                  icon: Icon(secourText2
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              labelText: 'Confirm Password',
                              prefixIcon: const Icon(Icons.lock,
                                  color: Colors.deepPurple),
                              filled: true,
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Forgot Password Button
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //register button
            Container(
              margin: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: width * 0.6,
                // height: height * 0.15,
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.app_registration_rounded,
                    size: 30,
                  ),
                  label: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        // color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //login button
            Container(
              margin: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: width * 0.6,
                // height: height * 0.15,
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.purple),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.login,
                    size: 30,
                  ),
                  label: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        // color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
