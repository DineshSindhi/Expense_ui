import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ui/domain/cat_list.dart';

import 'bloc_for_cat/bloc_database.dart';
import 'bloc_for_cat/events.dart';
import 'bloc_for_cat/states.dart';

class ExpensePage1 extends StatefulWidget {
  @override
  State<ExpensePage1> createState() => _ExpensePage1State();
}

class _ExpensePage1State extends State<ExpensePage1> {
  @override
  void initState() {
    super.initState();
    context.read<CatBloc>().add(GetExpense());
  }
  var Df=DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: true,
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
                  width: double.infinity,
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
            BlocBuilder<CatBloc,CatState>(
              builder: (context, state) {
                if(state is LoadingState){
                  return Center(child:CircularProgressIndicator());
                }else if (state is ErrorState){
                  return Text('${state.msg}');
                }else if (state is LoadedState){
                  var mData =state.allExpense;
                  return mData.isNotEmpty? Expanded(
                    child: ListView.builder(
                        itemCount: mData.length,
                        itemBuilder: (context, index) {
                          var filteredList=AppCatData.mCategory.where((element) => element.catId==mData[index].cid).toList();
                          String img=filteredList[0].catImage;
                          return ListTile(
                            leading: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(img),
                              ),
                            ),
                            title: Text(mData[index].title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                            subtitle: Text(mData[index].desc,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey)),
                            trailing: Column(
                              children: [
                                Text('-${mData[index].amount}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.pinkAccent),),
                                //Text(Df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(mData[index].time))),style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          );
                        }),
                  ):Center(child: Text('No Expense!!'),);
                }
                return Container();
              },
            ),
        // Container(
        //   margin: EdgeInsets.only(top: 9,bottom: 9),
        //   height: 470,
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     border: Border.all(color: Colors.grey,width: 2),
        //       borderRadius: BorderRadius.circular(15)),
        //   child: Padding(
        //     padding: const EdgeInsets.all(15),
        //     child: Column(children: [
        //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //         Text('Monday, 14',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
        //         Text('-\$1947',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
        //       ],),
        //       Padding(
        //         padding: const EdgeInsets.only(top:5,bottom: 5),
        //         child: Container(
        //           color: Colors.grey,
        //           width: double.infinity,
        //           height: 3,
        //         ),
        //       ),
        //       BlocBuilder<CatBloc,CatState>(
        //         builder: (context, state) {
        //           if(state is LoadingState){
        //             return Center(child:CircularProgressIndicator());
        //           }else if (state is ErrorState){
        //             return Text('${state.msg}');
        //           }else if (state is LoadedState){
        //             var mData =state.allExpense;
        //             return mData.isNotEmpty? Expanded(
        //               child: ListView.builder(
        //                   itemCount: mData.length,
        //                   itemBuilder: (context, index) {
        //                     return ListTile(
        //                       title: Text(mData[index].title),
        //                       subtitle: Text(mData[index].desc),
        //                       trailing: Column(
        //                         children: [
        //                           Text(mData[index].amount,style: TextStyle(fontSize: 15),),
        //                           Text(Df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(mData[index].time))),style: TextStyle(fontSize: 15)),
        //                         ],
        //                       ),
        //                     );
        //                   }),
        //             ):Center(child: Text('No Expense!!'),);
        //           }
        //           return Container();
        //         },
        //       ),
              // ListTile(
              //   leading: Container(
              //     width: 60,
              //     height: 60,
              //     decoration: BoxDecoration(
              //       color: Colors.blue.shade200,
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     child: Icon(Icons.shopping_bag_outlined),
              //   ),
              //   title: Text('Shop',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              //   subtitle: Text('Buy new clothes',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
              //   trailing: Text('  -\$939',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.pinkAccent),),
              // ),
              // ListTile(
              //   leading: Container(
              //     width: 60,
              //     height: 60,
              //     decoration: BoxDecoration(
              //       color: Colors.yellow.shade100,
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     child: Icon(Icons.mobile_friendly),
              //   ),
              //   title: Text('Electronics',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              //   subtitle: Text('Buy new ipone',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
              //   trailing: Text('  -\$1004',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.pinkAccent),),
              // ),

        //
        //     ],
        //     ),
        //   ),
        // ),
        // Container(
        //   margin: EdgeInsets.only(top: 9,bottom: 9),
        //   height: 170,
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     border: Border.all(color: Colors.grey,width: 2),
        //       borderRadius: BorderRadius.circular(15)),
        //   child: Padding(
        //     padding: const EdgeInsets.all(15),
        //     child: Column(children: [
        //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text('Friday, 3',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,),),
        //           Text('-\$674',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,),),
        //         ],),
        //       Padding(
        //         padding: const EdgeInsets.only(top: 5,bottom: 5),
        //         child: Container(
        //           color: Colors.grey,
        //           width: double.infinity,
        //           height: 3,
        //         ),
        //       ),
        //       ListTile(
        //        leading: Container(
        //          width: 60,
        //          height: 60,
        //          decoration: BoxDecoration(
        //            color: Colors.red.shade300,
        //            borderRadius: BorderRadius.circular(5),
        //          ),
        //          child: Icon(Icons.card_membership),
        //        ),
        //         title: Text('Transportation',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
        //         subtitle: Text('Trip to Dubai',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
        //         trailing: Text('  -\$674',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.pinkAccent),),
        //       )
        //     ],
        //     ),
        //   ),
        // ),
          ],
        ),
      ),
    );
  }
}
