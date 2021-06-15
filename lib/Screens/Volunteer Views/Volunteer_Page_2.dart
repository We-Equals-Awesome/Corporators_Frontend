import 'dart:io';
import 'package:Corporator_Mobile_App/Utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Volunteer_Page_3.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

//this page is used to collect the details of the Users to store them in the Database

//icons used in this page
const calendar = 'assets/icons/calendar.svg';

//the Details list is used to store the details of the User has entered in the TextFormFeilds
var Details = new List();
//the Address List is used to store the Street anf House number of the User has entered in the TextFormFeilds
var Address = new List();

//the people is a list of class Person which consists of all the family members relationships
final people = <Person>[
  Person('Father'),
  Person('Mother'),
  Person('Brother'),
  Person('Sister'),
  Person('Son'),
  Person('Daughter'),
  Person('Husband'),
  Person('Wife'),
  Person('Father-In-Law'),
  Person('Mother-In-Law'),
  Person('Brother-In-Law'),
  Person('Sister-in-Law'),
  Person('Nephew'),
  Person('Neice'),
  Person('Uncle'),
  Person('Aunt'),
  Person('Grand Father'),
  Person('Grand Mother')
];

//constructor to get the Street and House number from the other pages whenever necessary
class dataEntry extends StatefulWidget {
  //address list to store the street and house number
  var address = new List();
  //sflag to check if the family member is head of family or a different member
  int sflag;
  //constructor of the dataEntry class
  dataEntry({this.address, this.sflag});
  @override
  _dataEntryState createState() => _dataEntryState(address, sflag);
}

class _dataEntryState extends State<dataEntry> {
  //_chosenvalue represents the value chosen in the dropdown for the Street Number
  String _chosenValue;
  //selectedPerson represents the relationship selected
  Person selectedPerson;
  //address list to store the street and house number
  var address = new List();
  //sflag to check if the family member is head of family or a different member
  int sflag = 0;
  //constructor of the _dataEntryState class
  _dataEntryState(this.address, this.sflag);

  //to set the Details and Address list to empty when a new state is begun
  void initState() {
    Details = [];
    Address = [];
  }

  //variable for the stepper count
  int _currentStep = 0;

  //variable for storing the Date which is initilaized to current date
  DateTime selectedDate = DateTime.now();
  //variable for the form
  final _formKey = GlobalKey<FormState>();

  //TextEditingControllers for storing the date
  final TextEditingController _dateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //storing the date clicked by the user in the TextEditingController
    _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                //calling the _displayText function which is defined below
                _displayText('Enter the Details', context),
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      //all the colors are set to black as per the requirements in the design
                      accentColor: Colors.black,
                      primaryColor: Colors.black,
                      colorScheme: ColorScheme.light(primary: Colors.black),
                    ),
                    //Stepper Widget
                    child: Stepper(
                      //controlsBuilder to change the Continue and Cancel button as per the design
                      controlsBuilder: (BuildContext context,
                          {VoidCallback onStepContinue,
                          VoidCallback onStepCancel}) {
                        return Padding(
                          padding: EdgeInsets.only(top: 20, left: 0),
                          child: Row(
                            children: [
                              //Next Button
                              SizedBox(
                                width: 75,
                                child: TextButton(
                                  onPressed: onStepContinue,
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      color: navIcon,
                                      fontFamily: 'ProductSans',
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            submitGrey),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //Back Button
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  width: 75,
                                  child: TextButton(
                                    onPressed: onStepContinue,
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                        color: navIcon,
                                        fontFamily: 'ProductSans',
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              submitGrey),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      currentStep: _currentStep,
                      onStepTapped: (step) => tapped(step),
                      onStepContinue: continued, //continue button
                      onStepCancel: cancel, //cancel button
                      steps: <Step>[
                        //1st Step
                        Step(
                          title: new Text(
                            'Personal Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'ProductSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          isActive: true,
                          content: Column(
                            children: [
                              //calling the _textForm function which is defined below
                              _textForm('First Name', context),
                              _textForm('Last Name', context)
                            ],
                          ),
                        ),
                        //2nd Step
                        Step(
                          title: new Text(
                            'Contact Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'ProductSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          isActive: true,
                          content: Column(
                            children: [
                              //if the User is head of the family then take Street and House number inputs otherwise don't
                              sflag == 1
                                  //calling the _dropdown function which is defined below
                                  ? _dropdown(context)
                                  : SizedBox(width: 0, height: 0),
                              sflag == 1
                                  //calling the _textForm function which is defined below
                                  ? _textForm('House Number', context)
                                  : SizedBox(width: 0, height: 0),
                              //calling the _textForm function which is defined below
                              _textForm('Phone Number', context),
                              _textForm('Email', context)
                            ],
                          ),
                        ),
                        //3rd Step
                        Step(
                          title: new Text(
                            'Voter Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'ProductSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          isActive: true,
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: TextFormField(
                                      onSaved: (value) {
                                        //saving the selected date into the Details List
                                        Details.add(value);
                                      },
                                      //validator to check if the user has entered the date or not
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter the Date';
                                        }
                                      },
                                      controller: _dateController,
                                      decoration: new InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                          borderSide: BorderSide(width: 1.5),
                                        ),
                                        fillColor: textBoxBack,
                                        filled: true,
                                        labelText: 'YYYY-MM-DD',
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                          borderSide: BorderSide(width: 100),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //IconButton with Calender icon of svg type
                                  IconButton(
                                    padding: EdgeInsets.only(left: 15),
                                    icon: SvgPicture.asset(
                                      calendar,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                    ),
                                    //calling the different calendars based on the platforms
                                    onPressed: () {
                                      if (Platform.isIOS)
                                        _iosDate();
                                      else
                                        _androidDate(context);
                                    },
                                  ),
                                ],
                              ),
                              //calling the _textForm function which is defined below
                              _textForm('Voter ID', context),
                              _textForm('Aadhar Number', context)
                            ],
                          ),
                        ),
                        //Step 4
                        Step(
                          title: new Text(
                            'Relationship with Head of Family',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'ProductSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          isActive: true,
                          //calling the _autofill or _headoffamily function which are defined below
                          content: sflag == 0 ? _autofill() : _headoffamily(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //to display the floating action button
      floatingActionButton: SizedBox(
        width: 125,
        height: 41,
        child: FloatingActionButton.extended(
          onPressed: _submitDetails,
          label: Text(
            'Submit',
            style: TextStyle(
              fontFamily: 'ProductSans',
              color: navIcon,
              fontSize: 13.0,
            ),
          ),
          backgroundColor: submitGrey,
        ),
      ),
    );
  }

  //functions for the working of the Stepper Widget
  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  //function to display the TextFormFeild
  Widget _textForm(String a, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        child: TextFormField(
          textInputAction: TextInputAction.next,
          autocorrect: false,
          //saving the entered details into the Details List
          onSaved: (value) {
            Details.add(value);
          },
          //validator to check if the user has entered the details or not
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter the ' + a;
            }
          },
          decoration: new InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            fillColor: textBoxBack,
            filled: true,
            labelText: a,
            labelStyle: TextStyle(color: hintText, fontFamily: 'ProductSans'),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 100),
            ),
          ),
        ),
      ),
    );
  }

  //function to display the Text
  Widget _displayText(String a, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 25),
        child: Text(
          a,
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'ProductSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  //code for saving the form data and validating if text is entered or not
  void _submitDetails() {
    final FormState formState = _formKey.currentState;
    _formKey.currentState.save();
    if (formState.validate()) {
      if (sflag == 1) {
        Details.add('Self');
      }
      Address.add(Details[3]);
      Address.add(Details[2]);
      address = Address;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => resident(address: address),
      ));
    }
  }

  //code for selecting the date if the platform is android
  _androidDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1975),
      lastDate: DateTime(2030),
      initialDatePickerMode: DatePickerMode.year,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
        },
      );
    }
  }

  //code for selecting the date if the platform is IOS
  _iosDate() async {
    DateTime picked = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime tempPickedDate = selectedDate ?? DateTime.now();
        return Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('Done'),
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
          _dateController.text = picked.toString();
        },
      );
    }
  }

  //function to display the DropDownMenu for selecting the Street Number
  Widget _dropdown(BuildContext context) {
    return DropdownButtonFormField(
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 35,
        color: Colors.black,
      ),
      dropdownColor: textBoxBack,
      items: <String>['Street 1', 'Street 2', 'Street 3']
          .map<DropdownMenuItem<String>>((String value) {
        return new DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
      onChanged: (newValue) {
        setState(() => _chosenValue = newValue);
      },
      onSaved: (value) {
        List D = ['Street 1', 'Street 2', 'Street 3'];
        //adding the Street Number to the Details List
        int i = D.indexOf(value) + 1;
        Details.add(i.toString());
      },
      value: _chosenValue,
      decoration: new InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        fillColor: textBoxBack,
        filled: true,
        labelText: 'Street Number',
        labelStyle: TextStyle(color: hintText, fontFamily: 'ProductSans'),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 100),
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please enter the Street Number';
        }
      },
    );
  }

  //code to autofill the relationship of the family member
  Widget _autofill() {
    return SimpleAutocompleteFormField<Person>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        labelText: 'Relation',
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        fillColor: textBoxBack,
        filled: true,
        labelStyle: TextStyle(color: hintText, fontFamily: 'ProductSans'),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 100),
        ),
      ),
      itemBuilder: (context, person) => Container(
        decoration: BoxDecoration(
          border: Border.symmetric(),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 6, bottom: 6),
          child: Text(
            person.name,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'ProductSans',
            ),
          ),
        ),
      ),
      onSearch: (search) async => people
          .where((person) =>
              person.name.toLowerCase().contains(search.toLowerCase()))
          .toList(),
      itemFromString: (string) {
        final matches = people.where(
            (person) => person.name.toLowerCase() == string.toLowerCase());
        return matches.isEmpty ? null : matches.first;
      },
      //adding the relationship to the Details List
      onSaved: (value) {
        setState(() => selectedPerson = value);
        Details.add(value);
      },
      //validator to check if the user has entered the details or not
      validator: (person) {
        if (person == null) {
          return 'Invalid Relation';
        }
      },
    );
  }

  //function to display Container of member is head of family
  Widget _headoffamily() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 10),
        child: Text(
          'Head of the Family',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'ProductSans',
          ),
        ),
      ),
      width: double.infinity,
      height: 50,
      //color: textBoxBack,
      decoration: BoxDecoration(
        color: textBoxBack,
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
        //shape: BoxShape.rectangle,
      ),

      // Positioned(
      //     left: 50,
      //     top: 12,
      //     child: Container(
      //       padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      //       color: background,
      //       child: Text(
      //         'Relationship',
      //         style: TextStyle(
      //           fontSize: 18,
      //           fontFamily: 'ProductSans',
      //         ),
      //       ),
      //     )),
    );
  }

  //cupertino street number picker if necessary
  // int _selectedValue;
  // void _showPicker(BuildContext ctx) {
  //   showCupertinoModalPopup(
  //       context: ctx,
  //       builder: (_) => Container(
  //             width: 300,
  //             height: 250,
  //             child: CupertinoPicker(
  //               backgroundColor: Colors.white,
  //               itemExtent: 30,
  //               scrollController: FixedExtentScrollController(initialItem: 1),
  //               children: [
  //                 Text('Street 1', style: TextStyle(color: Colors.black)),
  //                 Text('Street 2', style: TextStyle(color: Colors.black)),
  //                 Text('Street 3', style: TextStyle(color: Colors.black)),
  //               ],
  //               onSelectedItemChanged: (value) {
  //                 setState(() {
  //                   _selectedValue = value + 1;
  //                   Details.add(_selectedValue);
  //                 });
  //               },
  //             ),
  //           ));
  // }

  // Widget _picker() {
  //   return Container(
  //     height: 50,
  //     decoration: BoxDecoration(
  //         color: textBoxBack,
  //         borderRadius: new BorderRadius.circular(10.0),
  //         border: Border.all(
  //           color: Colors.black,
  //           width: 1.5,
  //         )
  //         //borderSide: BorderSide(color: Colors.black, width: 1.5),

  //         ),
  //     child: Row(
  //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(left: 7),
  //           child: _text,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left:130),
  //           child: CupertinoButton(
  //             child: Icon(
  //               Icons.keyboard_arrow_down_rounded,
  //               size: 35,
  //               color: Colors.black,
  //             ),
  //             onPressed: () => _showPicker(context),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget get _text {
  //   if (_selectedValue == null) {
  //     return Text(
  //       'Street Number',
  //       style: TextStyle(
  //         color: hintText,
  //         fontFamily: 'ProductSans',
  //         fontSize: 16,
  //       ),
  //     );
  //   } else {
  //     return Text(
  //       'Street $_selectedValue',
  //       style: TextStyle(
  //         color: text,
  //         fontFamily: 'ProductSans',
  //         fontSize: 16,
  //       ),
  //     );
  //   }
  // }
}

class Person {
  Person(this.name);
  final String name;
  @override
  String toString() => name;
}
