import 'package:flutter/material.dart';
import 'add_donors.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
 {
  final CollectionReference donar = FirebaseFirestore.instance.collection('donar');
 void deleteDonar(docId){
  donar.doc(docId).delete();
 }

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text('Blood Donation App',
          // style: TextStyle(
          //   backgroundColor: Colors.red
          // ),
          ),
        ),
       // body: AddPage(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) =>const AddPage())
            );
          },
          child:const Icon(Icons.add,
          color: Colors.white,),),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
      body: StreamBuilder(
        stream: donar.orderBy('name').snapshots(),
         builder: (context,snapshot) {
           if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donarSnap=snapshot.data!.docs[index];
                return 
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: 
                  Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20) ,
                     color: Colors.white,
                     boxShadow:const [
                       BoxShadow(
                         color:  Color.fromARGB(255, 194, 193, 193),
                         blurRadius: 20,
                         spreadRadius: 20
                       )
                     ]
                   ),
                     child: 
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(
                          height: 80,
                           child: CircleAvatar(
                             backgroundColor: Colors.red,
                             radius: 30,
                             child: Text(donarSnap['group'],
                             style:const TextStyle(
                               color: Colors.white,
                               fontSize: 25
                             ),),
                           ),
                           
                         ),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(donarSnap['name'],
                            style:const TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold),
                            ),
                           Text(donarSnap['phone'].toString(),
                           style:const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                           ),)
                          ],
                          
                         ),
                         Row(
                           children: [
                             IconButton(
                               onPressed: (){
                                Navigator.pushNamed(
                                  context, '/Update',
                                  arguments:
                                 { 'name':donarSnap['name'],
                                  'phone':donarSnap['phone'].toString(),
                                  'group':donarSnap['group'],
                                  'id':donarSnap.id,
                                  } );
                               // UpdateDonorDetails();
                               },
                                icon:const Icon(Icons.edit,
                                size: 25,
                                color: Colors.blue,)),
                                IconButton(
                               onPressed: (){
                                deleteDonar(donarSnap.id);
                               },
                                icon:const Icon(Icons.delete,
                                size: 25,
                                color: Colors.red,)),
                           ],
                         ),

                       ],
                     )),
                );
                
              },);
           }
           return Container();
         },),

      )
      );
  }
}