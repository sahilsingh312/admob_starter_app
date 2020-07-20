import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final Map exchangeRatesMap;

  const ResultScreen({Key key, this.exchangeRatesMap}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    // TODO: implement initState
    print("exchangeRatesMap fetched from network request is :");
    print(widget.exchangeRatesMap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.exchangeRatesMap.length,
          itemBuilder: (BuildContext context, int index) {
            String key = widget.exchangeRatesMap.keys.elementAt(index);
//            print("key is "+key);
            return Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(key.toString()),
//                trailing: Text(widget.exchangeRatesMap[key].toString()),
                subtitle: Text(widget.exchangeRatesMap[key].toString()),
              ),
            );
          }),
    );
  }
}
