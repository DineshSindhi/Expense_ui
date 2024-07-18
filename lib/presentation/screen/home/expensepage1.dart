import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ui/data/model/expense-model.dart';
import 'package:ui/data/model/filtered_time_model.dart';
import 'package:ui/domain/cat_list.dart';
import '../../../data/model/filtered_cat.dart';
import '../../../domain/dates.dart';
import 'bloc_for_app/bloc_for_cat/bloc_database.dart';
import 'bloc_for_app/bloc_for_cat/events.dart';
import 'bloc_for_app/bloc_for_cat/states.dart';


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
  int sIndex=0;
  bool catWise=false;
  var dateAll=DateFormat.yMMMMd();
  var dateY=DateFormat.y();
  var dateM=DateFormat.LLLL();
  var typeDate='Date Wise';
  List<FilteredTimeModel> dateExpense=[];
  List<ExpenseModel> listExpense=[];
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
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  height: 35,
                  child: Center(
                    child: DropdownButton(

                      dropdownColor: Colors.grey.shade400,

                      value: typeDate,
                      onChanged: (newValue) {
                        if(newValue=='This Month'){catWise=false;
                          filteredDate(allNExpense: listExpense, dName: dateM, listName: dateExpense);
                        }else if(newValue=='This Year'){catWise=false;
                          filteredDate(allNExpense: listExpense, dName: dateY, listName: dateExpense);
                        }else if(newValue=='Date Wise'){
                          catWise=false;
                          filteredDate(allNExpense: listExpense,dName: dateAll, listName: dateExpense);
                        }else if(newValue=='Category Wise'){
                          catWise=true;
                          filteredCatExpense(allNExpense: listExpense);
                        }
                        setState(() {
                         typeDate=newValue!;
                        });
                      },
                      items: ['Date Wise','This Year','This Month','Category Wise'].map((e) {
                        return DropdownMenuItem(
                        value: e,
                            child: Text(e,style: TextStyle(color: Colors.black)));
                      }).toList(),
                    ),
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
            Expanded(
              child: BlocBuilder<CatBloc,CatState>(
                builder: (context, state) {
                  if(state is LoadingState){
                    return Center(child:CircularProgressIndicator());
                  }else if (state is ErrorState){
                    return Text('${state.msg}');
                  }else if (state is LoadedState){
                    listExpense=state.allExpense;
                  //filteredDate(allNExpense: state.allExpense,dName: dateAll, listName: dateExpense);
                   // FilteredExpense(allNExpense:state.allExpense);
                    return ListView.builder(
                      itemCount: dateExpense.length,
                      itemBuilder: (context, pIndex) {
                        var filteredList=AppCatData.mCategory.where((element) => element.catId==dateExpense[pIndex].allFExpense[sIndex].cid).toList();
                        String img=filteredList[0].catImage;
                        String imgTitle=filteredList[0].catTitle;
                        return  Container(
                          margin: EdgeInsets.only(top: 9,bottom: 9),

                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey,width: 2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(children: [
                              catWise==true?
                              ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade200,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(img),
                                  ),
                                 ),
                                title: Text(imgTitle,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500)),
                                trailing: Text('\u{20B9}${dateExpense[pIndex].totalAmount}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
                              ):Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${dateExpense[pIndex].title}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
                                  Text('\u{20B9}${dateExpense[pIndex].totalAmount}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),

                                ],),
                              Padding(
                                padding: const EdgeInsets.only(top:5,bottom: 5),
                                child: Container(
                                  color: Colors.grey,
                                  width: double.infinity,
                                  height: 3,
                                ),
                              ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: dateExpense[pIndex].allFExpense.length,
                                itemBuilder: (context, index) {

                                  var filteredList=AppCatData.mCategory.where((element) => element.catId==dateExpense[pIndex].allFExpense[index].cid).toList();
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
                                    title: Text(dateExpense[pIndex].allFExpense[index].title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                                    subtitle: Text(dateExpense[pIndex].allFExpense[index].desc,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey)),
                                    trailing: Column(
                                      children: [
                                        Text('-\u{20B9}${dateExpense[pIndex].allFExpense[index].amount}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.pinkAccent),),
                                        catWise==false? SizedBox(height: 1,width: 1,):Text(dateAll.format(DateTime.fromMillisecondsSinceEpoch(int.parse(dateExpense[pIndex].allFExpense[index].time))),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),

                                      ],
                                    ),
                                  );
                                })

                            ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            )


          ],
        ),
      ),
    );

  }
  // void FilteredExpense({required List<ExpenseModel> allNExpense}){
  //   dateExpense.clear();
  //   List<String>uniqueDates=[];
  //   for(ExpenseModel eachExpense in allNExpense){
  //     var createTime=eachExpense.time;
  //     var time =DateTime.fromMillisecondsSinceEpoch(int.parse(createTime));
  //     var expenseTime=dateM.format(time);
  //     print(expenseTime);
  //     if(!uniqueDates.contains(expenseTime)){
  //       uniqueDates.add(expenseTime);
  //       print(uniqueDates);
  //     }
  //   }
  //   for(String eachTime in uniqueDates){
  //     num totalAmt= 0.0;
  //     List<ExpenseModel> mData=[];
  //
  //     for(ExpenseModel eachExpense in allNExpense){
  //       var createTime=eachExpense.time;
  //       var time =DateTime.fromMillisecondsSinceEpoch(int.parse(createTime));
  //       var expenseTime=dateM.format(time);
  //       if(expenseTime==eachTime){
  //        mData.add(eachExpense);
  //        if(eachExpense.type=='Debit'){
  //        totalAmt -= int.parse(eachExpense.amount);
  //        }else{
  //          totalAmt += int.parse(eachExpense.amount);
  //        }
  //       }
  //     }
  //     dateExpense.add(FilteredTimeModel(
  //         time: eachTime,
  //         totalAmount: totalAmt.toString(),
  //         allFExpense: mData));
  //   }
  //   print(dateExpense.length);
  // }
  void filteredCatExpense({required List<ExpenseModel> allNExpense}) {
    dateExpense.clear();
    List<int>uniqueDates = [];
    for (ExpenseModel eachExpense in allNExpense) {
      var catId = eachExpense.cid;
     // print(catId);
      if (!uniqueDates.contains(catId)) {
        uniqueDates.add(catId);
       // print(uniqueDates);
      }
    }
    for (int eachTime in uniqueDates) {
      num totalAmt = 0.0;
      List<ExpenseModel> mData = [];
      for (ExpenseModel eachCatExpense in allNExpense) {
        var catId = eachCatExpense.cid;
        if (catId == eachTime) {
          mData.add(eachCatExpense);
          if (eachCatExpense.type == 'Debit') {
            totalAmt -= int.parse(eachCatExpense.amount);
          } else {
            totalAmt += int.parse(eachCatExpense.amount);
          }
        }
      }
      dateExpense.add(FilteredTimeModel(
          totalAmount: totalAmt.toString(),
          allFExpense: mData));
    }
    //print(dateExpense.length);
  }
}


