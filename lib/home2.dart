import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/image/pp.png'),
            Text('Monety',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search,size: 35,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 9,right: 9),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipOval(
                        child: Image.asset('assets/image/pr.jpeg'),
                      ),
                    ),
                    Column(
                      children: [
                        Text(' Morning',style: TextStyle(fontSize: 16,color: Colors.grey.shade500),),
                        Text(' Jack',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  height: 35,
                  width: 130,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('This Month',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                      Icon(Icons.arrow_drop_down_outlined)
                    ],
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 9,bottom: 9),
                  height: 220,
                  width: 450,
                  decoration: BoxDecoration(color: Colors.purple,
                  borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('  Expense Total',style: TextStyle(fontSize: 25,color: Colors.white),),
                        Text('  \$4,528',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 9,bottom: 9),
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(color: Colors.orange,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(child: Text('+\$234',style: TextStyle(fontSize: 20,color: Colors.white))),
                            ),
                            Text('  than last month',style: TextStyle(fontSize: 20,color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 4,
                  child:  Image.asset('assets/image/h3.png',),)

              ],
            ),
            Text('Expense List',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        Container(
          margin: EdgeInsets.only(top: 9,bottom: 9),
          height: 230,
          width: 450,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Monday, 14',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
                Text('-\$1947',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
              ],),
              Padding(
                padding: const EdgeInsets.only(top:5,bottom: 5),
                child: Container(
                  color: Colors.grey,
                  width: 450,
                  height: 3,
                ),
              ),
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.shopping_bag_outlined),
                ),
                title: Text('Shop',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                subtitle: Text('Buy new clothes',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
                trailing: Text('  -\$939',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.pinkAccent),),
              ),
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.mobile_friendly),
                ),
                title: Text('Electronics',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                subtitle: Text('Buy new ipone',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
                trailing: Text('  -\$1004',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.pinkAccent),),
              ),


            ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 9,bottom: 9),
          height: 170,
          width: 450,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Friday, 3',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,),),
                  Text('-\$674',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,),),
                ],),
              Padding(
                padding: const EdgeInsets.only(top: 5,bottom: 5),
                child: Container(
                  color: Colors.grey,
                  width: 450,
                  height: 3,
                ),
              ),
              ListTile(
               leading: Container(
                 width: 60,
                 height: 60,
                 decoration: BoxDecoration(
                   color: Colors.red.shade300,
                   borderRadius: BorderRadius.circular(5),
                 ),
                 child: Icon(Icons.card_membership),
               ),
                title: Text('Transportation',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                subtitle: Text('Trip to Dubai',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
                trailing: Text('  -\$674',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.pinkAccent),),
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
