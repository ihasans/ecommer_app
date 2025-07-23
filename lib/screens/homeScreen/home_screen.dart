import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Icon(Icons.logout_rounded),
          ),
        ],
      ),

      // Insert,Delete and Edit data through firebase......
      body: Column(children: [
        ],
      ),
    );
  }
}
// { }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   User? userId = FirebaseAuth.instance.currentUser;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               FirebaseAuth.instance.signOut();

//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginScreen()),
//               );
//             },
//             child: Icon(Icons.logout_rounded),
//           ),
//         ],
//       ),

//       // Insert,Delete and Edit data through firebase......
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('note')
//             .where('userId', isEqualTo: userId!.uid)
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something is wrong');
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CupertinoActivityIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No Data Found'));
//           }
//           if (snapshot.data != null) {
//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 var note = snapshot.data!.docs[index]['AddNote'];
//                 var noteid = snapshot.data!.docs[index]['userId'];
//                 var docId = snapshot.data!.docs[index].id;
//                 return Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 10.sp,
//                     vertical: 10.sp,
//                   ),
//                   child: Card(
//                     child: ListTile(
//                       title: Text('Title: $note'),
//                       subtitle: Text('ID: $noteid'),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => UpdateNote(note, docId),
//                                 ),
//                               );
//                             },
//                             child: Icon(Icons.edit),
//                           ),
//                           SizedBox(width: 10.h),

//                           // Delete Data...........
//                           GestureDetector(
//                             onTap: () async {
//                               await FirebaseFirestore.instance
//                                   .collection('note')
//                                   .doc(docId)
//                                   .delete();
//                             },
//                             child: Icon(Icons.delete),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//           return Text('Data');
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CreateNote()),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
// // { }
