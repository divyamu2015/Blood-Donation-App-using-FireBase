import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpdateDonorDetails extends StatefulWidget {
  const UpdateDonorDetails({super.key});

  @override
  State<UpdateDonorDetails> createState() => _UpdateDonorDetailsState();
}

class _UpdateDonorDetailsState extends State<UpdateDonorDetails> {
  final CollectionReference donar = 
  FirebaseFirestore.instance.collection('donar');
  final bloodGroup = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
   String? selectedGroup;
    TextEditingController donarname=TextEditingController();
    TextEditingController donarphone=TextEditingController();
 void updateDonor(docsId){
     final data={
    'name':donarname.text,
    'phone':donarphone.text,
    'group':selectedGroup

  };
  donar.doc(docsId).update(data);
  
 }
 
 
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Map;
    donarname.text =args['name'];
    donarphone.text =args['phone'];
    selectedGroup =args['group'];
    final docsId=args['id'];
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Update Donors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
             TextField(
              controller: donarname,
              decoration:const InputDecoration(
                  label: Text('Donor Name'),
                  hintText: 'Donor Name',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
             TextField(
              controller: donarphone,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration:const InputDecoration(
                  label: Text('Phone Number'),
                  hintText: 'Phone Number',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
           DropdownButtonFormField(
            value: selectedGroup,
            decoration:const InputDecoration(
              label: Text('Select Blood Group')

            ),
            //hint:const Text('Select Blood Group'),
            items: bloodGroup.map((e) => DropdownMenuItem(
              child:Text(e),
              value: e,))
              .toList(),
               onChanged: (val){
                selectedGroup=val;

               }),
            // const  TextField(
            //     decoration: InputDecoration(
            //       label: Text('Select Blood Group')
            //     ),
            //   ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {
              updateDonor(docsId);
              Navigator.pop(context);
            }, 
            child:Text('Update'),
            style: ButtonStyle(
              backgroundColor:const MaterialStatePropertyAll(
                Colors.red,
                
              ),
              minimumSize: MaterialStateProperty.all(
               const Size(double.infinity, 50))
            ),
            )
          ],
        ),
      ),
    ));
  }
}
