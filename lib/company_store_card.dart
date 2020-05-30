// import 'package:flutter/material.dart';

// class CompanyStoreCard extends StatelessWidget {
//   final String companyImageUrl;
//   final String companyName;
//   final double estimatedTime;
//   final String companyAddress;

//   CompanyStoreCard({this.companyImageUrl, this.companyName, this.estimatedTime, this.companyAddress});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(20,),),
//         child: Container(
//           color: Colors.white,
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 flex: 6,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       fit: BoxFit.fill,
//                       image: NetworkImage(companyImageUrl),
//                     )
//                   ),
//                  )
//               ),
//               Expanded(
//                 flex: 4,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4,),
//                       child: Text(companyName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,),),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4,),
//                       child: Text(companyAddress, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey[300]),),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4,),
//                       child: Row(
//                         children: <Widget>[
//                           Icon(Icons.watch_later, color: Colors.green, size: 18,),
//                           SizedBox(width: 2,),
//                           Text(estimatedTime.toString(), style: TextStyle(color: Colors.green, fontSize: 14,),),
//                         ],
//                       ),
//                     ),
//                     new RaisedButton(
//                       color: Colors.greenAccent,
//                       onPressed: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (_) => QueuePage())),
//                       child: new Text("JOIN LINE"),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(18.0),
//                       )
//                     )

//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }



// }