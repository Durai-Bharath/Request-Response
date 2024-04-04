import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shijin_ui/Repositories/requestData.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  List<Requests> items = [];
  // late List<Requests> approved;
  @override
  void initState() {
    // approved = [];
    items = Requests.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "Request",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: items[index].isApproved ? Colors.lightGreen: Colors.white,
                // height: 50.h,
                // decoration: BoxDecoration(
                //     color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Text(
                    items[index].body,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        child: GestureDetector(
                            onTap: () {
                              var snackBar = const SnackBar(
                                  content: Text('Request Denied'),
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.red);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                            child: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(width: 5.w,),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: GestureDetector(
                            onTap: () {
                              
                              setState(() {
                                items[index].isApproved =
                                    !items[index].isApproved;
                                if (items[index].isApproved) {
                                  Requests.add(items[index]);
                                  // approved.add(items[index]);
                                  var snackBar = const SnackBar(
                                  content: Text('Request Approved'),
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.green);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                                }
                                else{
                                  if(Requests.list.contains(items[index])){
                                    Requests.list.remove(items[index]);
                                    // approved.remove(items[index]);
                                    var snackBar = const SnackBar(
                                  content: Text('Deselected'),
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.grey);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                                  }
                                }
                              });
                            },
                            child: const Icon(
                              Icons.done_outlined,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
