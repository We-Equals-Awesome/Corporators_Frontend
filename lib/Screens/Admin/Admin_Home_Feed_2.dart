import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Corporator_Mobile_App/Utils/Colors.dart';

class WallFeedUpdated extends StatefulWidget {
  @override
  _WallFeedUpdatedState createState() => _WallFeedUpdatedState();
}

class _WallFeedUpdatedState extends State<WallFeedUpdated> {
  TextEditingController con;
  String title;
  String contxt;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Asset> images = []; //list to store the images
  @override
  void initState() {
    super.initState();
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
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        height: s == 'Title' ? 40 : MediaQuery.of(context).size.height * 0.35,
        child: TextFormField(
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          initialValue: s == 'Title'
              ? "Sewage Issue"
              : "There is an issue with sewage here.Untreated sewage is the leading polluter of water sources in India, causing a host of diseases including diarrhea (which kills 350,000 Indian children annually2), agricultural contamination, and environmental degradation. The urban poor often live alongside dirty drains and canals in which mosquitoes and germs breed.CDD has more than 150 clients in 13 Indian states. It also has 25 clients in Nepal and Afghanistan. And the organization is poised to do much more. ", //this sets the initial value of field
          style: s == 'Title'
              ? TextStyle(
                  color: text,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProductSans',
                )
              : TextStyle(color: text, fontSize: 15),
          controller: con,
          maxLines: s == 'Title' ? 1 : null,
          expands: s == 'Title' ? false : true,
          autocorrect: false,
          onSaved: (value) {
            if (s == 'Title')
              title = value;
            else if (s == 'Start Typing...') contxt = value;
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Field is required.';
            } else
              return null;
          },
          decoration: new InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              fillColor: background,
              filled: true,
              hintText: s,
              hintStyle: TextStyle(
                  color: text,
                  fontFamily: 'ProductSans',
                  fontWeight:
                      s == 'Title' ? FontWeight.bold : FontWeight.normal,
                  fontSize: s == 'Title' ? 25 : 17),
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
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          a,
          style: TextStyle(
              fontSize: a == 'Details' ? 20 : 17,
              fontWeight: a == 'Details' ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'ProductSans',
              color: text),
        ),
      ),
    );
  }

//widget that returns a button
  Widget button(String s, BuildContext context) {
    return ElevatedButton(
      onPressed: pickImages,
      child: Text(s,
          style: TextStyle(
              color: navIcon,
              fontSize: 13,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
          primary: submitGrey,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
          ),
          textStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.015,
          ),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          )),
    );
  }

//funtion that returns the number of likes,shares for the post
  TextSpan shareLike(BuildContext context, String s) {
    String n;
    if (s == 'likes') {
      //get the number of likes
      n = ' 4  ';
    } else {
      //get number of shares
      n = ' 6';
    }
    return TextSpan(
        text: n,
        style: TextStyle(
          color: text,
          fontSize: 20,
          fontFamily: 'ProductSans',
        ));
  }

  ScrollController _scrollController = new ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    txtformfield('Title', context),
                    SizedBox(height: 10),
                    //adding the likes and share icon in a row
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 35,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.favorite, size: 23),
                            ),
                            shareLike(context, 'likes'),
                            WidgetSpan(
                                child: SvgPicture.asset(
                                    "assets/icons/share.svg",
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    width: MediaQuery.of(context).size.width *
                                        .035)),
                            shareLike(context, 'shares')
                          ],
                        ),
                      ),
                    ),

                    txtformfield('Start Typing...', context),
                    SizedBox(height: 10),
                    textbox('Add Images/Videos', context),
                    button('Add Images', context), SizedBox(height: 10),
                    Container(
                      height: 90,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 90,
                              child: _WallFeedcard(context),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.23,
          height: MediaQuery.of(context).size.height * 0.045,
          child: FloatingActionButton.extended(
            onPressed: _submitDetails,
            label: Text(
              'Update',
              style: TextStyle(
                  color: navIcon,
                  fontSize: 13.0,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold),
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

Widget _WallFeedcard(BuildContext context) {
  return GestureDetector(
    child: Container(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: background,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Stack(
                    children: [
                      Container(),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://media.istockphoto.com/photos/broken-road-in-the-woods-picture-id531854696?s=612x612"),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Positioned(
                          right: -15,
                          top: -15,
                          child: IconButton(
                              icon: Icon(
                                Icons.cancel_rounded,
                                color: Colors.black.withOpacity(0.8),
                                size: 20,
                              ),
                              onPressed: () => {}))
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
