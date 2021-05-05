// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import 'package:cropapp/Utils/colours.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new FirstPage(),
//     );
//   }
// }

// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => new _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   List<String> added = [];
//   String currentText = "";
//   GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

//   _FirstPageState() {
//     textField = SimpleAutoCompleteTextField(
//       key: key,
//       decoration: new InputDecoration(
//         contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: new BorderRadius.circular(10.0),
//           borderSide: BorderSide(color: Colors.black, width: 1.5),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: new BorderRadius.circular(10.0),
//           borderSide: BorderSide(color: Colors.black, width: 1.5),
//         ),
//         fillColor: textBoxBack,
//         filled: true,
//         labelText: 'Family Member',
//         //labelText: 'abc',
//         //labelStyle: TextStyle(color: hintText, fontFamily: 'Product_Sans_Bold'),
//         border: new OutlineInputBorder(
//           borderRadius: new BorderRadius.circular(10.0),
//           borderSide: BorderSide(width: 100),
//         ),
//       ),
//       // decoration: new InputDecoration(errorText: "Beans"),
//       controller: TextEditingController(text: ""),
//       suggestions: suggestions,
//       // textChanged: (text) => currentText = text,
//       clearOnSubmit: true,
//       textSubmitted: (text) => setState(() {
//         TextEditingValue(text: text);
//         //Text = text;
//       }),
//     );
//   }

//   List<String> suggestions = [
//     "Apple",
//     "Armidillo",
//     "Actual",
//     "Actuary",
//     "Yam",
//     "Zest"
//   ];

//   SimpleAutoCompleteTextField textField;
//   bool showWhichErrorText = false;

//   @override
//   Widget build(BuildContext context) {
//     Column body =
//         new Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//       Center(
//         child: new ListTile(
//           title: textField,
//         ),
//       ),
//     ]);

//     body.children.addAll(added.map((item) {
//       return new ListTile(title: new Text(item));
//     }));

//     return new Scaffold(
//         //resizeToAvoidBottomPadding: false,

//         body: Center(child: body));
//   }
// }
