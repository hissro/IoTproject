import 'package:flutter/material.dart';
import 'package:final_project/pages/home/widgets/devices.dart';
import 'package:firebase_database/firebase_database.dart';

import '../AboutUs/AboutUs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{


  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  void UpdateDB(   {required String filedname, required dynamic filed_value}) async
  {
    DatabaseReference ref = FirebaseDatabase.instance.ref("sensor");
    await ref.update({ "$filedname": filed_value });
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFFfce2e1), Colors.white]),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: SafeArea(
            child: Column(
              children:
              [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    const Text(
                      "مرحبا",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold ),
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUs()),
                        );
                      },
                        child: CircleAvatar( minRadius: 16, backgroundImage: AssetImage("assets/images/user.webp"))
                    ),
                  ],
                ),

                const SizedBox( height: 30,),

                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [

                          const SizedBox( height: 5,),


                          //  UpdateDB

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                  Text(
                                    "الزراعة الذكية",
                                    style: TextStyle(
                                        height: 1.1,
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),


                            ],
                          ),

                          const SizedBox( height: 25,),



                          //  Db  Side
                          StreamBuilder(
                            stream: ref.onValue,
                            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot)
                            {

                              if (snapshot.hasData)
                              {
                                Map<dynamic, dynamic> map = snapshot.data! .snapshot.value as Map<dynamic, dynamic>;

                                return Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children:
                                    [

                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                        children:
                                        [

                                          Row(
                                            children:
                                            [
                                              const Icon(
                                                Icons.hot_tub,
                                                color: Colors.deepOrange,
                                              ),
                                              const SizedBox(width: 5,),
                                              Text(' الحرارة: ${map["sensor"]["temperature"]} مئوية ' , style: const TextStyle( color:  Colors.deepOrange ),),
                                            ],
                                          ),

                                          Row(
                                            children:
                                            [
                                              const Icon(
                                                Icons.wind_power,
                                                color: Colors.teal,
                                              ),

                                              const SizedBox(width: 5,),

                                              Text(   'الرطوبة: ${map["sensor"]["air_humdity"]}',  style: const TextStyle( color:  Colors.teal )),
                                            ],
                                          ),
                                        ],
                                      ),

                                      const SizedBox(   height: 15,),

                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                        children:
                                        [
                                          Row(
                                            children:
                                            [
                                              const Icon( Icons.solar_power_outlined , color: Colors.deepPurple,),
                                              const SizedBox(width: 5,),
                                              Text( 'رطوبة التربة: ${map["sensor"]["soail_humdity"]} ' , style: const TextStyle( color:  Colors.deepPurple )),
                                            ],
                                          ),
                                        ],
                                      ),

                                      const SizedBox(   height: 45 ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:
                                        [

                                          Devices(
                                            name: "الاضاءة ",
                                            svg: 'assets/svg/light.svg',
                                            color:  Color( 0xFFff5f5f ),
                                            isActive: map["sensor"]["light"],
                                            onChanged: (val)
                                            {
                                              setState(()
                                              {
                                                print('light:  ${map["sensor"]["light"]}');
                                                UpdateDB(filedname: "light", filed_value: !map["sensor"]["light"]  );
                                              });
                                            },
                                          ),


                                          Devices(
                                            name: "المروحة ",
                                            svg: 'assets/svg/ac.svg',
                                            color:  const Color( 0xFF7739ff),
                                            isActive: map["sensor"]["fan"],
                                            onChanged: (val)
                                            {
                                              setState(()
                                              {

                                                print('fan:  ${map["sensor"]["fan"]}');

                                                UpdateDB(filedname: "fan", filed_value: !map["sensor"]["fan"]  );


                                              });
                                            },
                                          ),


                                          Devices(
                                            name: 'مضخة المياه',
                                            svg: 'assets/svg/tv.svg',
                                            color:  const Color( 0xFF16a085 ),
                                            isActive: map["sensor"]["waterpump"],
                                            onChanged: (val)
                                            {
                                              setState(()
                                              {

                                                print('waterpump:  ${map["sensor"]["waterpump"]}');

                                                UpdateDB(filedname: "waterpump", filed_value: !map["sensor"]["waterpump"]  );


                                              });
                                            },
                                          ),


                                        ],
                                      ),


                                    ],
                                  ),
                                );

                              } else if (snapshot.hasError) {
                                return const Text ("حدث خطأ ما");
                              } else {
                                return const Text ("حدث خطأ ما"); }
                            },
                          ),


                        ],
                      ),
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
}
