import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:messenger/widgets/chat/message_bubble.dart';

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Future.value(FirebaseAuth.instance.currentUser),
//       builder: (ctx, futureSnapshot) {
//         if (futureSnapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return StreamBuilder(
//             stream: FirebaseFirestore.instance
//                 .collection('chat')
//                 .orderBy(
//                   'createdAt',
//                   descending: true, //last first
//                 )
//                 .snapshots(),
//             builder: (ctx, AsyncSnapshot<dynamic> chatSnapshot) {
//               final chatDocs = chatSnapshot.data.docs;
//               if (futureSnapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               return ListView.builder(
//                 reverse: true,
//                 itemCount: chatDocs.length,
//                 itemBuilder: (ctx, index) => MessageBuble(
//                   chatDocs[index]['text'],
//                   chatDocs[index]['userId'] == futureSnapshot.data.uid,
//                 ),
//               );
//             });
//       },
//     );
//   }
// }

class Messages extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final uid = user!.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy(
              'createdAt',
              descending: true, //last first
            )
            .snapshots(),
        builder: (ctx, AsyncSnapshot<dynamic> chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDocs = chatSnapshot.data!.docs;
          return ListView.builder(
            reverse: true,
            itemCount: chatSnapshot.data.docs.length,
            itemBuilder: (ctx, index) => MessageBubble(
              chatDocs[index]['text'],
              chatDocs[index]['username'],
              chatDocs[index]['userImage'],
              chatDocs[index]['userId'] ==
                  uid, //check current user id is the same in /chat userId. If it is it will returns true, if not returnt false
              ValueKey(chatDocs[index].id),
            ),
          );
        });
  }
}
