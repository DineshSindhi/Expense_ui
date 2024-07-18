import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/presentation/screen/home/bloc_for_app/bloc_for_on_board/bloc.dart';
import 'package:ui/presentation/screen/home/bloc_for_app/bloc_for_on_board/events.dart';
import 'package:ui/presentation/screen/home/bloc_for_app/bloc_for_on_board/states.dart';
import 'package:ui/presentation/screen/splash_screen/intro_page.dart';
import '../on_board/login_page.dart';

class ExpensePage4 extends StatefulWidget {
  @override
  State<ExpensePage4> createState() => _ExpensePage4State();
}

class _ExpensePage4State extends State<ExpensePage4> {
  @override
  void initState() {
    super.initState();
//context.read<UserBloc>().add(GetUser());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Profile'),centerTitle: true,backgroundColor: Colors.blue,),
      body:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Expanded(
            //   child: BlocBuilder<UserBloc,UserState>(
            //     builder: (context, state) {
            //       if (state is ErrorS){
            //         return Text('${state.msg}');
            //       }else if (state is LoadedS){
            //         var mData =state.allUser;
            //         return ListView.builder(
            //             itemCount: mData.length,
            //             itemBuilder: (context, index) {
            //               return Column(children: [
            //                 Text(mData[index].name),
            //                 Text(mData[index].email),
            //                 Text(mData[index].mobile),
            //                 Text(mData[index].pass),
            //               ],);
            //             });
            //       }
            //       return Container();
            //     },
            //   ),
            // ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: InkWell(
                    onTap: ()async{
                      var pref= await SharedPreferences.getInstance();
                      pref.setInt(IntroPage.KEY, 0);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));

                    },
                    child: Text('Logout',style: TextStyle(fontSize: 30),)),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
