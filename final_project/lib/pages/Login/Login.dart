import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../home/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Login extends StatefulWidget
{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login>
{

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool IsLoding = false ;

  @override
  void initState()
  {
    // TODO: implement initState
    // email.text = "projectresearch143@gmail.com";
    email.text = "test";
    password.text = "test";
    super.initState();
  }



  Widget build(BuildContext context)
  {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>
            [
              Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Stack(
                  children: <Widget>
                  [

                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/light-1.png')
                            )
                        ),
                      )),
                    ),

                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeInUp(duration: const Duration(milliseconds: 1200), child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/light-2.png')
                            )
                        ),
                      )),
                    ),

                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeInUp(duration: const Duration(milliseconds: 1300), child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/clock.png')
                            )
                        ),
                      )),
                    ),

                    Positioned(
                      child: FadeInUp(duration: const Duration(milliseconds: 1600), child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: const Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                        ),
                      )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeInUp(duration: const Duration(milliseconds: 1800), child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color.fromRGBO(143, 148, 251, 1)),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10)
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding:  const EdgeInsets.all(8.0),
                            decoration: const  BoxDecoration(
                                border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
                            ),
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email or Phone number",
                                  hintStyle: TextStyle(color: Colors.grey[700])
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey[700])
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                    const SizedBox(height: 30,),
                    
                    FadeInUp(duration: const Duration(milliseconds: 1900),
                     child:
                    IsLoding ?
                     const Text(' Please Wait ..... ' , style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)))
                     :
                     InkWell(
                       onTap: (){
                         setState(() {
                           IsLoding = true ;
                         });
                         UserLogin();
                       },
                       child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                            )
                        ),
                        child: const Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                                           ),
                     )),
                    const SizedBox(height: 70,),
                    FadeInUp(duration: const Duration(milliseconds: 2000), child: const Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  void UserLogin ()
  {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    var usermail  = email.text;
    var userpass  = password.text;

    FirebaseFirestore.instance
        .collection('users')
        .where('user', isEqualTo: usermail )
        .where('password', isEqualTo: userpass )
        .get().then( (querySnapshot)
        {
          setState(()
          {
            IsLoding = false ;
          });

          if (kDebugMode)
          {
            print("Successfully completed");
            print(" length  ${querySnapshot.docs.length}");
          }

          if (querySnapshot.docs.isNotEmpty )
          {
            for (var docSnapshot in querySnapshot.docs) {
              print('${docSnapshot.id} => ${docSnapshot.data()}');
            }
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar( backgroundColor : Colors.teal , content: Text('Welcome Back,,,'), ));
            Future.delayed(const Duration(seconds: 2), () => Navigator.push( context, MaterialPageRoute(builder: (context) => const HomePage())) );
          }
          else
          {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar( backgroundColor : Colors.red , content: Text('Username or password error'), ));
          }

      },
      onError: (e)
      {
          setState(() { IsLoding = false ; });
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar( backgroundColor : Colors.red , content: Text('Something went wrong, please try again'), ));
      },
    );

  }
}