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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/callings-of-night.png'),
          ),
        ),
        Scaffold(

          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/callings-of-night.png'),
                    colorFilter:
                        ColorFilter.mode(Colors.black26, BlendMode.darken),
                    fit: BoxFit.cover)),
            child: ListView.builder(
                itemCount: widget.exchangeRatesMap.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = widget.exchangeRatesMap.keys.elementAt(index);
//            print("key is "+key);
                  return Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white54,
                    ),
                    child: ListTile(
                      title: Text(
                        widget.exchangeRatesMap[key].toString(),
                        style: TextStyle(fontSize: 18),
                      ),
//                trailing: Text(widget.exchangeRatesMap[key].toString()),
                      subtitle: Text(key.toString()),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
