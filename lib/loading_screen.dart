import 'package:flutter/material.dart';
import 'network_helper.dart';
import 'result_screen.dart';

class LoadingScreen extends StatefulWidget {
  final String selectedDate;

  const LoadingScreen({Key key, this.selectedDate}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  NetworkHelper nh = NetworkHelper();

  fetchData() async {
    Map resultMap = await nh.latestMap(widget.selectedDate);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultScreen(
                exchangeRatesMap: resultMap["rates"],
              )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1502920514313-52581002a659?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1047&q=80"),
                colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                fit: BoxFit.cover)),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
