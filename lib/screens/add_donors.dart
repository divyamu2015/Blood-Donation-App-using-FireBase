
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final bloodgroups=['A+','A-','B+','B-','O+','O-','AB+','Ab-'];
   String? selectblood;
  final CollectionReference donar = 
  FirebaseFirestore.instance.collection('donar');
  TextEditingController donarname=TextEditingController();
  TextEditingController donarphone=TextEditingController();
 
  void adddonar(){
  final data={
    'name':donarname.text,
    'phone':donarphone.text,
    'group':selectblood

  };
  donar.add(data);

}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, icon:const Icon(Icons.arrow_back)),
          title:const Text('Add Donors'),
        ),
        body: Padding(
          padding:const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
              controller: donarname,
                  decoration:const InputDecoration(
                  label: Text('Donor Name'),
                  hintText: 'Donor Name',
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 10),
              TextField(
              controller: donarphone,
              keyboardType: TextInputType.number,
              maxLength: 10,
                decoration:const InputDecoration(
                  label: Text('Phone Number'),
                  hintText: 'Phone Number',
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                decoration:const InputDecoration(
                  label: Text('Select Blood Group')
                ),
                items: bloodgroups.map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                  )).toList(),
                 onChanged: (val){
                  selectblood =val;
                 }),
              
            // const  TextField(
            //     decoration: InputDecoration(
            //       label: Text('Select Blood Group')
            //     ),
            //   ),
              const SizedBox(height: 10),
              ElevatedButton(
                 style: ButtonStyle(
              backgroundColor:const MaterialStatePropertyAll(
                Colors.red,
                
              ),
              minimumSize: MaterialStateProperty.all(
                Size(double.infinity, 50))
            ),
                onPressed: (){
                  adddonar();
                  Navigator.pop(context);
                },
                 child:const Text('Submit',
                 style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                 ),))
            ],
          ),
        ),
      )
      );
  }
}
