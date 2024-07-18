import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../data/model/expense-model.dart';
import '../../../data/model/filtered_cat.dart';
import '../../../domain/cat_list.dart';
import 'bloc_for_app/bloc_for_cat/bloc_database.dart';
import 'bloc_for_app/bloc_for_cat/states.dart';

class ExpensePage3 extends StatefulWidget {
  @override
  State<ExpensePage3> createState() => _ExpensePage3State();
}

class _ExpensePage3State extends State<ExpensePage3> {
  List<FilteredCatModel> dateExpense=[];
  var dateAll=DateFormat.yMMMMd();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CatBloc,CatState>(
                builder: (context, state) {
                  if(state is LoadingState){
                    return Center(child:CircularProgressIndicator());
                  }else if (state is ErrorState){
                    return Text('${state.msg}');
                  }else if (state is LoadedState){

                    filteredCatExpense(allNExpense: state.allExpense);
                    return ListView.builder(
                      itemCount: dateExpense.length,
                      itemBuilder: (context, pIndex) {
                        int sIndex=0;
                        var filteredList=AppCatData.mCategory.where((element) => element.catId==dateExpense[pIndex].allCat[sIndex].cid).toList();
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
                              ListTile(
                                leading: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,

                                      color: Colors.blue.shade200,
                                      //borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(img),
                                    ),
                                  ),
                                title: Text(imgTitle,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500)),
                                trailing: Text('\u{20B9}${dateExpense[pIndex].tAmount}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
                              ),
                              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     Text(imgTitle,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                              //     Text('\u{20B9}${dateExpense[pIndex].tAmount}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
                              //
                              //   ],),
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
                                  itemCount: dateExpense[pIndex].allCat.length,
                                  itemBuilder: (context, index) {

                                    // var filteredList=AppCatData.mCategory.where((element) => element.catId==dateExpense[pIndex].allCat[index].cid).toList();
                                    // String img=filteredList[0].catImage;
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
                                      title: Text(dateExpense[pIndex].allCat[index].title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                                      subtitle: Text(dateExpense[pIndex].allCat[index].desc,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey)),
                                      trailing: Column(
                                        children: [
                                          Text('-\u{20B9}${dateExpense[pIndex].allCat[index].amount}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.pinkAccent),),
                                          Text(dateAll.format(DateTime.fromMillisecondsSinceEpoch(int.parse(dateExpense[pIndex].allCat[index].time))),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
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
            ),
          ],
        ),
      ),
    );
  }

void filteredCatExpense({required List<ExpenseModel> allNExpense}){
  dateExpense.clear();
  List<int>uniqueDates=[];
  for(ExpenseModel eachExpense in allNExpense){
    var catId=eachExpense.cid;
    print(catId);
    if(!uniqueDates.contains(catId)){
      uniqueDates.add(catId);
      print(uniqueDates);
    }
  }
  for(int eachTime in uniqueDates){
    num totalAmt= 0.0;
    List<ExpenseModel> mData=[];
    for(ExpenseModel eachCatExpense in allNExpense){
      var catId=eachCatExpense.cid;
      if(catId==eachTime){
       mData.add(eachCatExpense);
       if(eachCatExpense.type=='Debit'){
       totalAmt -= int.parse(eachCatExpense.amount);
       }else{
         totalAmt += int.parse(eachCatExpense.amount);
       }
      }
    }
    dateExpense.add(FilteredCatModel(
      //catId: eachTime,
      tAmount: totalAmt.toString(),
      allCat: mData,));
  }
  print(dateExpense.length);
}
}

