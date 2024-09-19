import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,


      ),
      home: const Signup(),
    );
  }
}
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login (String email , password) async{
    try {
      Response response =  await post (
          Uri.parse('https://reqres.in/api/register'),
          body : {
            'email' : email,
            'password' : password
      }
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString());
        print(data);
        print("Account created successfuly");
      }else{
        print("Failed");
      }
    }

    catch (e){

print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Login/Signup"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

                TextFormField(
                  controller: emailController,

                  decoration: const  InputDecoration(

                    hintText:  "Email"

                  ),
                ),
                SizedBox(height: 70,
                  child: TextFormField(

                    controller: passwordController,
                    decoration: const  InputDecoration(

                        hintText: "Password"

                    ),
                  ),
                ),
            InkWell(
              onTap: (){
                  login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                decoration:  BoxDecoration(

                  color: Colors.blue,

borderRadius: BorderRadius.
circular(10

)

                ),
                height: 50,
                width: 500,
                child: Center(child: const Text("Sign UP")),
              ),
            )
              ],
            )


      ),
    );
  }
}
