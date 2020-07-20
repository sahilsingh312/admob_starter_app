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
      MaterialPageRoute(builder: (context) => ResultScreen(exchangeRatesMap: resultMap["rates"],)),
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
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
