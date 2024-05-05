//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:ui/presentation/screen/home/bloc_for_cat/bloc_database.dart';
// import 'package:ui/presentation/screen/home/bloc_for_cat/events.dart';
// import 'package:ui/presentation/screen/home/bloc_for_cat/states.dart';
// class ExpensePage3 extends StatefulWidget {
//   @override
//   State<ExpensePage3> createState() => _ExpensePage3State();
// }
//
// class _ExpensePage3State extends State<ExpensePage3> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<CatBloc>().add(GetExpense());
//   }
//  var Df=DateFormat.yMd();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: BlocBuilder<CatBloc,CatState>(
//         builder: (context, state) {
//           if(state is LoadingState){
//             return CircularProgressIndicator();
//           }else if (state is ErrorState){
//             return Text('${state.msg}');
//           }else if (state is LoadedState){
//             var mData =state.allExpense;
//             return mData.isNotEmpty? ListView.builder(
//                 itemCount: mData.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(mData[index].title),
//                     subtitle: Text(mData[index].desc),
//                     trailing: Column(
//                       children: [
//                         Text(mData[index].amount,style: TextStyle(fontSize: 15),),
//                         Text(Df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(mData[index].time))),style: TextStyle(fontSize: 15)),
//                       ],
//                     ),
//                   );
//                 }):Center(child: Text('No Expense!!'),);
//           }
//           return Container();
//         },
//       ),
//       );
//   }
// }
