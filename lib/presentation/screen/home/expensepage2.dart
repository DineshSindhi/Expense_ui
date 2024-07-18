import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ExpensePage2 extends StatelessWidget {
  List<Map<String,dynamic>> mList=[
    {
      'color':Colors.blue.shade300,
      'price':'-\$5678',
      'name':'Shop',
      'icon':Icon(Icons.shopping_bag_outlined),
  }, {
      'color':Colors.pink.shade100,
      'price':'-\$99778',
      'name':'Electronics',
      'icon':Icon(Icons.mobile_friendly_rounded),
    }, {
      'color':Colors.yellow.shade200,
      'price':'-\$796',
      'name':'Books',
      'icon':Icon(Icons.menu_book),
    }, {
      'color':Colors.red.shade200,
      'price':'-\$647',
      'name':'Transport',
      'icon':Icon(Icons.card_membership),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(' Statistic',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)
              ),
              height: 35,
              width: 130,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('This Month',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 8,),
        child:Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              margin: EdgeInsets.only(top: 9,bottom: 9),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.purple,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 8,right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' Total expense',style: TextStyle(fontSize: 25,color: Colors.white),),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            shape: BoxShape.circle
                          ),
                            child: Icon(Icons.more_horiz,color: Colors.white,))
                      ],
                    ),
                    Text('  \$4,528 / \$67798 per month',style: TextStyle(fontSize: 25,color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 5,
                            decoration: BoxDecoration(color: Colors.yellow,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ],
                    ),
                  )
                  ],

                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('  Expense BreakSdown',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    Text('Limit \$900/week',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey)),
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
                      Text('Week',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_drop_down_outlined)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
              Row(
                children: [
                  Image.asset('assets/image/cart.png',),
                ],
              ),
            Text('Spending Detail',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
              SizedBox(height: 10,),
              Text('Your expenses are divided into 5 categories',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey)),
              SizedBox(height: 10,),
              Row(children: [
                Expanded(
                  flex: 6,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 18,
                        color: Colors.blue,
                      ),
                      Text('40%',style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ),
                Expanded(flex: 5,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 18,
                        color: Colors.yellow,
                      ),
                      Text('30%',style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ),
                Expanded(flex: 4,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 18,
                        color: Colors.red,
                      ),
                      Text('20%',style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ),
                Expanded(flex: 3,                child: Column(crossAxisAlignment: CrossAxisAlignment.start,                  children: [
                      Container(
                        height: 18,
                        color: Colors.green,
                      ),
                      Text('15%',style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ),
                Expanded(flex: 2,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 18,
                        color: Colors.pinkAccent,
                      ),
                      Text('10%',style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ),


              ],),
              SizedBox(height: 10,),
              Expanded(child: GridView.builder(
                itemCount: mList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 90,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10
              ), itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  width: 180,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child:  ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: mList[index]['color'],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:  (mList[index]['icon']),
                    ),
                    title: Text(mList[index]['name'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
                    subtitle: Text(mList[index]['price'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:Colors.pinkAccent),),),
                );
              },)),
          ],),
        ),
    );
  }
}

