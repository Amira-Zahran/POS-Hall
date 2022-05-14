import 'dart:collection';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login/Orders.dart';
import 'model/BLoC.dart';
class FHall extends StatefulWidget {
  const FHall({Key? key}) : super(key: key);

  @override
  State<FHall> createState() => _FHallState();
}

class _FHallState extends State<FHall> {
  BLoC bLoC = BLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/Garson.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<UnmodifiableListView<Orders>>(
                  stream: bLoC.OrdersStream,
                  builder: (context, snapshot) {
                    return ConditionalBuilder(
                      condition: snapshot.data != null,
                      builder: (context) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width*0.25, height: 500,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Column(
                                          children: [
                                            SizedBox(
                                              width: 300, height: 70,
                                              child: Container(
                                                padding: const EdgeInsets.all(12),
                                                child: Row(
                                                  children: const [
                                                    Center(
                                                        child: Text(
                                                          '  Recieve Now ',
                                                          style: TextStyle(
                                                              fontFamily: 'Cairo_Regular',
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 33,
                                                              color: Color.fromRGBO(249, 183, 0, 1)

                                                          ),
                                                        )),
                                                    Icon(Icons.fastfood,
                                                      color: Color.fromRGBO(249, 183, 0, 1),),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: CarouselSlider(
                                                options: CarouselOptions(height: 380, autoPlay: true,scrollDirection: Axis.vertical,viewportFraction: 0.32,),  items: snapshot.data!.where((element) =>
                                                element.status == 'Finished').map((e) =>
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 20, left: 60.0, right: 60),
                                                      child: SizedBox(
                                                        width: 232, height: 70,
                                                        child: Container(
                                                          padding: const EdgeInsets.all(12),
                                                          child:
                                                          //e.type!.split('').first}T' : e.type!.split('').first'${e.type!.split('').first}T' : e.type!.split('').first}
                                                          //e.type!.contains('TakeAway') ? Icon(Icons.fastfood, color: Color.fromRGBO(14, 35, 46, 1),) : Icon(Icons.baby_changing_station),
                                                          Center(
                                                            child: Text(
                                                              'TakeAway'' ${e.orderId}',
                                                              //'${e.type!.contains('TakeAway') ? '${e.type!.split('').first}T' : e.type!.split('').first} ${e.orderId}',
                                                              style: const TextStyle(
                                                                  fontSize: 33,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Color.fromRGBO(
                                                                  249, 183, 0, 1),
                                                              ),
                                                            ),
                                                          ),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(10),
                                                            color: const Color.fromRGBO(
                                                                14, 35, 46, 1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),).toList(),

                                              ),
                                            ),
                                          ],

                                        ),
                                  ),
                                )
                      ),
                          Padding(
                            padding: const EdgeInsets.only(right: 60),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.25, height: 500,
                              child: Padding(

                                padding: const EdgeInsets.only(top: 25,),
                                  child: Column(
                                        children: [
                                          SizedBox(
                                            width: 300, height: 70,
                                            child: Container(
                                              padding: const EdgeInsets.all(12),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 50),
                                                child: Row(
                                                  children: const [
                                                    Center(
                                                        child: Text(
                                                          'Preparing ',
                                                          style: TextStyle(
                                                            fontFamily: 'Cairo_Regular',
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 33,
                                                            color: Color.fromRGBO(14, 35, 46, 1),
                                                          ),
                                                        )),
                                                    Icon(Icons.baby_changing_station,
                                                      color: Color.fromRGBO(14, 35, 46, 1),)
                                                  ],
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Color.fromRGBO(249, 183, 0, 1)
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: CarouselSlider(
                                              options: CarouselOptions(height: 380, autoPlay: true,scrollDirection: Axis.vertical,viewportFraction: 0.32,),
                                              items: snapshot.data!.where((element) => element.status == 'Preparing').map((e) =>
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 20, left: 60.0, right: 60),
                                                    child: SizedBox(
                                                      width: 250, height: 70,
                                                      child: Container(
                                                        padding: const EdgeInsets.all(12),
                                                        child:
                                                        //e.type!.split('').first}T' : e.type!.split('').first'${e.type!.split('').first}T' : e.type!.split('').first}
                                                        //e.type!.contains('TakeAway') ? Icon(Icons.fastfood, color: Color.fromRGBO(14, 35, 46, 1),) : Icon(Icons.baby_changing_station),
                                                        Center(
                                                          child: Text(
                                                            'TakeAway'' ${e.orderId}',
                                                            //'${e.type!.contains('TakeAway') ? '${e.type!.split('').first}T' : e.type!.split('').first} ${e.orderId}',
                                                            style: const TextStyle(
                                                              fontSize: 33,
                                                              fontWeight: FontWeight
                                                                  .bold,
                                                              color: Color.fromRGBO(
                                                                  249, 183, 0, 1),
                                                            ),
                                                          ),
                                                        ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(10),
                                                          color: Color.fromRGBO(
                                                              14, 35, 46, 1),
                                                        ),
                                                      ),
                                                    ),)).toList(),
                                            ),
                                          ),
                                        ],
                                      ),),
                                ),

                      ),
          ],
        ), fallback: (context) => Lottie.network('https://assets5.lottiefiles.com/private_files/lf30_fqBsFC.json',
                      width: 200,
                      height: 200,));
                }
              ),
              Center(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontFamily: 'Cairo_Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 70,
                    color: Color.fromRGBO(249, 183, 0, 1),
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                          'Track Your Order Number!'),
                    ],
                    repeatForever: true,
                  ),
          ),
        ),
      ],
    ),
        ));
  }
  Widget Preparing() {
    return Padding(
      padding: const EdgeInsets.only(right: 60),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.25, height: 500,
        child: StreamBuilder<UnmodifiableListView<Orders>>(
              stream: bLoC.OrdersStream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.only(top: 25,),
                  child: ConditionalBuilder(
                      condition: snapshot.data != null,
                      builder: (context) => Column(
                            children: [
                              SizedBox(
                                width: 280, height: 70,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40),
                                    child: Row(
                                      children: const [
                                        Center(
                                            child: Text(
                                              'Preparing ',
                                              style: TextStyle(
                                                fontFamily: 'Cairo_Regular',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 33,
                                                color: Color.fromRGBO(14, 35, 46, 1),
                                              ),
                                            )),
                                        Icon(Icons.baby_changing_station,
                                          color: Color.fromRGBO(14, 35, 46, 1),)
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromRGBO(249, 183, 0, 1)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CarouselSlider(
                                  options: CarouselOptions(height: 380, autoPlay: true,scrollDirection: Axis.vertical,viewportFraction: 0.32,),
                                  items: snapshot.data!.where((element) => element.status == 'Preparing').map((e) =>
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20, left: 80.0, right: 80),
                                        child: SizedBox(
                                          width: 232, height: 70,
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            child:
                                            //e.type!.split('').first}T' : e.type!.split('').first'${e.type!.split('').first}T' : e.type!.split('').first}
                                            //e.type!.contains('TakeAway') ? Icon(Icons.fastfood, color: Color.fromRGBO(14, 35, 46, 1),) : Icon(Icons.baby_changing_station),
                                            Center(
                                              child: Text(
                                                'TakeAway'' ${e.orderId}',
                                                //'${e.type!.contains('TakeAway') ? '${e.type!.split('').first}T' : e.type!.split('').first} ${e.orderId}',
                                                style: const TextStyle(
                                                  fontSize: 33,
                                                  fontWeight: FontWeight
                                                      .bold,
                                                  color: Color.fromRGBO(
                                                      249, 183, 0, 1),
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              color: Color.fromRGBO(
                                                  14, 35, 46, 1),
                                            ),
                                          ),
                                        ),)).toList(),
                                ),
                              ),
                            ],
                          ), fallback: (context) => Padding(
                            padding: const EdgeInsets.only(top: 200.0),
                            child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_vkqybeu5/data.json'),
                          )),
                );
              }
        ),
      ),
    );
  }
  Widget Finished() {
    return Padding(
      padding: const EdgeInsets.only(left: 60),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.25, height: 500,
        child: StreamBuilder<UnmodifiableListView<Orders>>(
              stream: bLoC.OrdersStream,
              builder: (context, snapshot) {

                return Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ConditionalBuilder(
                      condition: snapshot.data != null,
                      builder: (context) =>
                          Column(
                            children: [
                              SizedBox(
                                width: 280, height: 70,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: const [
                                      Center(
                                          child: Text(
                                            ' Recieve Now ',
                                            style: TextStyle(
                                              fontFamily: 'Cairo_Regular',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 33,
                                              color: Color.fromRGBO(249, 183, 0, 1)

                                            ),
                                          )),
                                      Icon(Icons.fastfood,
                                        color: Color.fromRGBO(249, 183, 0, 1),),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: CarouselSlider(
                                  options: CarouselOptions(height: 380, autoPlay: true,scrollDirection: Axis.vertical,viewportFraction: 0.32,),
                                  items: snapshot.data!.where((element) =>
                                  element.status == 'Finished').map((e) =>
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 80.0, right: 80),
                                        child: SizedBox(
                                          width: 232, height: 70,
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            child:
                                            //e.type!.split('').first}T' : e.type!.split('').first'${e.type!.split('').first}T' : e.type!.split('').first}
                                            //e.type!.contains('TakeAway') ? Icon(Icons.fastfood, color: Color.fromRGBO(14, 35, 46, 1),) : Icon(Icons.baby_changing_station),
                                            Center(
                                              child: Text(
                                                'TakeAway'' ${e.orderId}',
                                                //'${e.type!.contains('TakeAway') ? '${e.type!.split('').first}T' : e.type!.split('').first} ${e.orderId}',
                                                style: const TextStyle(
                                                  fontSize: 33,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              color: const Color.fromRGBO(
                                                  249, 183, 0, 1),
                                            ),
                                          ),
                                        ),
                                      ),).toList(),

                                ),
                              ),
                            ],

                          ), fallback: (context) => Lottie.network('https://assets5.lottiefiles.com/private_files/lf30_fqBsFC.json'),
                    ),
                );
              }
          ),
      ),
    );
  }
}
