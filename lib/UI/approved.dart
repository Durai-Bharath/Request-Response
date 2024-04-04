import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shijin_ui/Repositories/requestData.dart';

class Approved extends StatefulWidget {
  const Approved({super.key});

  @override
  State<Approved> createState() => _ApprovedState();
}

class _ApprovedState extends State<Approved> {
  late List<Requests> approved;
  
  @override
  void initState() {
    approved = Requests.loadApprovedData();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        approved = Requests.loadApprovedData();
      });

     });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "Approved",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount:  approved.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: ListTile(
                title: Center(child: Text(approved[index].body,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),)),
            
              ),
            ),
          );
      }),
    );
  }
}
