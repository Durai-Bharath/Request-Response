import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shijin_ui/UI/bottomNavBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 300.h,
          width: 250.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Welcome",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
              Column(
                children: [
                  Container(
                    height: 50.h,
                    width: 210.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60
                    ),
                    child: TextField(
                      controller: _controller,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        prefixIcon:  Icon(Icons.person_2_outlined),
                        border: InputBorder.none,
                        hintText: "Enter your credential",
                        
                      ),
                      textInputAction: TextInputAction.send,       
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavBar()));
                    },
                    child: Container(
                      height: 30.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                        border: Border.all(color: Colors.blueAccent,width:3 )
                      ),
                      child: Center(child: Text("Login",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),))
                    ),
                  ),
                ],
              )
            ],
          ),
        
        ),
      ),

    );
  }
}