// import 'package:flutter/material.dart';

// const double kAppBarHeight = 60;

// const List<Color> backgroundGradient = [
//   Color.fromARGB(213, 57, 110, 134),
//   Color.fromARGB(178, 82, 144, 175),
// ];

// class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
//   SearchBarWidget({
//     Key? key,
//   })  : preferredSize = const Size.fromHeight(kAppBarHeight),
//         super(key: key);

//   @override
//   final Size preferredSize;

//   OutlineInputBorder border = OutlineInputBorder(
//     borderRadius: BorderRadius.circular(12),
//     borderSide: const BorderSide(
//       color: Colors.grey,
//       width: 1,
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return SafeArea(
//       // bottom: true,
//       // top: true,
//       child: Container(
//         height: kAppBarHeight,
//         // color: Colors.red,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: backgroundGradient,
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//           ),
//         ),

//         child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//           // hasBackButton
//           //     ? IconButton(
//           //         onPressed: () {
//           //           Navigator.pop(context);
//           //         },
//           //         icon: const Icon(Icons.arrow_back),
//           //       )
//           //     : Container(),
//           // const Drawer(),
//           SizedBox(
//             width: screenSize.width * 0.7,
//             child: Container(
//               padding:
//                   const EdgeInsets.only(left: 0, top: 12, bottom: 12, right: 0),
//               decoration: BoxDecoration(boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   blurRadius: 50,
//                   spreadRadius: 0.5,
//                   offset: const Offset(0, 6),
//                 ),
//               ]),
//               child: TextField(
//                 onSubmitted: (String query) {
//                   // this is of resultsScreen,widgets.
//                   // print("submmit");
//                   // print("Submitted ${query}");

//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => ResultsScreen(query: query),
//                   //   ),
//                   // );
//                 },
//                 cursorColor: Colors.black,
//                 cursorHeight: 21,
//                 onTap: () {
//                   {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => const SearchScreen()));
//                   }
//                 },
//                 decoration: InputDecoration(
//                   // prefixIcon: const Icon(
//                   //   Icons.camera_alt_outlined,
//                   //   color: Colors.black,
//                   // ),

//                   // suffixIcon: Icon(
//                   //   Icons.camera_alt_outlined,
//                   //   color: Colors.black,
//                   // ),
//                   suffixIcon: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             // showSearch(
//                             //     context: context,
//                             //     // delegate to customize the search bar
//                             //     delegate: CustomSearchDelegate());
//                           },
//                           icon: const Icon(Icons.search)),
//                       SizedBox(
//                         width: 7,
//                       )
//                     ],
//                   ),

//                   // icon: Icon(Icons.search),
//                   contentPadding: const EdgeInsets.fromLTRB(30, 5, 0, 5),
//                   hintText: "Search emergency contacts...",
//                   hintStyle: const TextStyle(fontSize: 17.0),
//                   fillColor: Colors.white,
//                   filled: true,
//                   border: border,
//                   focusedBorder: border,
//                 ),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
