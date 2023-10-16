import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  GlobalKey<FormState> user = GlobalKey();

  bool isPasswordValid(String? passWord){
    if(passWord==null) return false;
    final regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regExp.hasMatch(passWord);

  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent![700],
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 500,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Form(child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: nameController,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    fillColor: Colors.black12,
                                    filled: true,
                                    prefixIcon: Icon(Icons.mail,color: Colors.black26),


                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none
                                    )
                                ),
                                validator: (email){
                                  if(email!.isEmpty|| email==null){
                                    return "Field can't be empty";
                                  }
                                  // else if(!email.isEmailValid()){
                                  //   return "Please enter a valid email ID";
                                  // }

                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: passwordController,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    prefixIcon: Icon(Icons.lock,color: Colors.black26,),
                                    fillColor: Colors.black12,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none
                                    )
                                ),
                                validator: (paswd){
                                  if(paswd!.isEmpty || paswd==null){
                                    return "Field can't be empty";
                                  }
                                  else if(isPasswordValid(paswd)==false){
                                    return "Please enter a valid password";
                                  }
                                },
                              ),
                            ),
                          ],
                        )),
                      ],
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.square(45),

                      elevation: 3,
                      shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30),

                      ),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: (){
                      String username = nameController.text;
                      String password = passwordController.text;
                      if(username!= " " && password!= "")
                      {
                        Fluttertoast.showToast(
                          msg: "Successfull",
                        );
                        // loginData.setBool("login",false);
                        // loginData.setString("username", nameController.text);
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ProductList()));
                      }
                      else{
                        Fluttertoast.showToast(
                          msg: "Login Failed",
                        );
                      }
                    },
                    child: Text("Login",style: TextStyle(color: Colors.white),)
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.square(45),
                      shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30),

                      ),
                      backgroundColor: Colors.green[50]!,
                    ),
                    onPressed: (){
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (BuildContext context)=> signuppage())
                      // );
                    },
                    child: Text("Sign up",style: TextStyle(color: Colors.green),)
                ),

              ),

            ],
          ),




    );
  }
}
extension SignupScreenState on String {
  bool isEmailValid(){
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
