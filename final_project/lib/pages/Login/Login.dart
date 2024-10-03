import 'package:flutter/material.dart';
import '../home/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';


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

  @override
  void initState()
  {
    // TODO: implement initState
    email.text = "projectresearch143@gmail.com";
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children:
          [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130 , right: 35),
              child: const Text(
                'تسجيل '
                    '\n'
                    'الدخول',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: email ,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "البريد الالكتروني",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: const TextStyle(),
                            obscureText: true,
                            controller: password ,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "كلمة المرور",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'دخول',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: ()
                                    {

                                      if (email.text.isEmpty && password.text.isEmpty )
                                        {
                                          Fluttertoast.showToast(
                                              msg: "  Please Insert All Data   ",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                        }
                                      else
                                        {
                                          if (email.text =="projectresearch143@gmail.com" && password.text == "123456" )
                                          {
                                            Fluttertoast.showToast(
                                                msg: "مرحب بكـ مره اخري",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.teal,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );

                                            Future.delayed(const Duration(seconds: 2)).then((val)
                                            {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const HomePage()),
                                              );
                                            });



                                          }
                                          else
                                          {
                                            Fluttertoast.showToast(
                                                msg: "خطأ في البريد أو كلمة مرور",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          }
                                        }

                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
