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
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1502920514313-52581002a659?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1047&q=80"),
                colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                fit: BoxFit.cover)),
        child: ListView.builder(
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
      ),
    );
  }
}
