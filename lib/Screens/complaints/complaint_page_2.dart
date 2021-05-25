import 'package:flutter/material.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:geocoder/geocoder.dart';
import 'package:intl/intl.dart';
import 'package:cropapp/Screens/Complaints/map_page.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';

class ComplaintsPage2 extends StatefulWidget {
  final Coordinates c;
  final int selected;
  ComplaintsPage2(this.c, this.selected);
  @override
  _ComplaintsPage2State createState() => _ComplaintsPage2State();
}

class _ComplaintsPage2State extends State<ComplaintsPage2> {
  Address address2 = new Address();
  String addressString;
  var now = new DateTime.now();
  var formatter = new DateFormat('yMd');
  TextEditingController con;
  String title;
  String contxt;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Asset> images = []; //list to store the images
  @override
  void initState() {
    super.initState();
    setState(() {
      convertCoordinatesToAddress(widget.c).then((value) {
        address2 = value;
        addressString = value.addressLine;
      });
    });
  }

  Future<Address> convertCoordinatesToAddress(Coordinates cod) async {
    var address = await Geocoder.local.findAddressesFromCoordinates(widget.c);
    return address.first;
  }

  Future<String> getLoc() async {
    await convertCoordinatesToAddress(widget.c).then((value) {
      address2 = value;
      addressString = value.addressLine;
      print("get loc  value  " + addressString);
    });
    return addressString;
  }

  void dispose() {
    super.dispose();
  }

  Future<void> pickImages() async {
    List<Asset> resultList = [];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 9,
        enableCamera: true,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarTitle: "Select Images",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    setState(() {
      images = resultList;
    });
  }

  //function that returns a texteformfield
  Widget txtformfield(String s, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: s == 'Title'
            ? MediaQuery.of(context).size.height * 0.06
            : MediaQuery.of(context).size.height * 0.35,
        child: TextFormField(
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          style: s == 'Title'
              ? TextStyle(
                  color: text, fontSize: 25, fontWeight: FontWeight.bold)
              : TextStyle(color: text, fontSize: 15),
          controller: con,
          maxLines: null,
          expands: true,
          autocorrect: false,
          onSaved: (value) {
            if (s == 'Title')
              title = value;
            else if (s == 'Context') contxt = value;
          },
          validator: (value) {
            if (value.isEmpty) {
              return s + ' is required.';
            } else
              return null;
          },
          decoration: new InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              fillColor: background,
              filled: true,
              hintText: s,
              hintStyle: TextStyle(
                  color: text,
                  fontFamily: 'product-sans',
                  fontWeight:
                      s == 'Title' ? FontWeight.bold : FontWeight.normal,
                  fontSize: s == 'Title' ? 25 : 15),
              border: InputBorder.none),
        ),
      ),
    );
  }

  //textbox function returns the text with the required styling
  Widget textbox(String a, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          a,
          style: TextStyle(
              fontSize: a == 'Details' ? 20 : 15,
              fontWeight: a == 'Details' ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'product-sans',
              color: text),
        ),
      ),
    );
  }

//widget that returns a button
  Widget button(String s, BuildContext context) {
    return ElevatedButton(
      onPressed: s == ('Pick Images')
          ? pickImages
          : () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      MapPage(Coordinates(12.9716, 77.5946))));
            },
      child:
          Text(s, style: TextStyle(color: navIcon, fontFamily: 'product-sans')),
      style: ElevatedButton.styleFrom(
          primary: submitGrey,
          padding: EdgeInsets.symmetric(
              horizontal: s == 'Create'
                  ? MediaQuery.of(context).size.width * 0.12
                  : MediaQuery.of(context).size.width * 0.07,
              vertical: MediaQuery.of(context).size.height * 0.01),
          textStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.015,
          ),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          )),
    );
  }

  ScrollController _scrollController = new ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      formatter.format(now),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'product-sans',
                          color: text),
                    ),
                  ),
                  txtformfield('Title', context),
                  txtformfield('Context', context),
                  textbox('Details', context),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: FutureBuilder(
                          future: getLoc(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return TextButton(
                                onPressed: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MapPage(widget.c)))
                                },
                                child: Text(
                                  addressString,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'product-sans',
                                      color: text),
                                ),
                              );
                            }
                            return Text('Add Location');
                          }),
                    ),
                  ),
                  SizedBox(height: 10),
                  button('Add Location', context),
                  textbox('Add images/videos of the issue', context),
                  button('Pick Images', context),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(images.length, (index) {
                        Asset asset = images[index];
                        return Stack(
                          children: <Widget>[
                            AssetThumb(
                              asset: asset,
                              width: 100,
                              height: 100,
                            ),
                            Positioned(
                                right: -2,
                                top: -9,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.black.withOpacity(0.8),
                                      size: 20,
                                    ),
                                    onPressed: () => setState(() {
                                          images.removeAt(index);
                                        })))
                          ],
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.06,
          child: FloatingActionButton.extended(
            onPressed: _submitDetails,
            label: Text(
              'Submit',
              style: TextStyle(
                  color: navIcon, fontSize: 13.0, fontFamily: 'product-sans'),
            ),
            backgroundColor: submitGrey,
          ),
        ));
  }

//method that saves the current state of the form
  void _submitDetails() {
    final FormState formState = _formKey.currentState;
    //message to enter correct data if the validation returns false
    if (!formState.validate()) {
      //showSnackBarMessage('Please fill all fields');
    } else {
      //save current form state if validation returns true
      formState.save();
      print('data saved');
    }
  }
}
