import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'loading_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      //we wait for the dialog to return
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (d != null) //if the user has selected a date
      setState(() {
        // we format the selected date and assign it to the state variable
        _selectedDate = DateFormat('yyyy-MM-dd').format(d);
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Sample App"),
//      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/callings-of-night.png'),
                colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Get Currency Rates', style: TextStyle(fontSize: 36, color: Colors.white),),
              SizedBox(height: 32,),
              RaisedButton(
                child: Text("Choose Date", style: TextStyle(fontSize: 18),),
                onPressed: () async {
                  await _selectDate(context);
                  print("selected Date is " + _selectedDate);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoadingScreen(
                              selectedDate: _selectedDate,
                            )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
