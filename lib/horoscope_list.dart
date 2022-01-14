import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:horoscopes/horoscope_detail.dart';
import 'package:horoscopes/models/horoscope.dart';

class HoroscopeList extends StatefulWidget {
  const HoroscopeList({Key? key}) : super(key: key);

  @override
  State<HoroscopeList> createState() => _HoroscopeListState();
}

class _HoroscopeListState extends State<HoroscopeList> {
  Future<List<Horoscope>> ReadJsonData() async {
    //read json file
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/data/data.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => Horoscope.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasData) {
              var items = data.data as List<Horoscope>;
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HoroscopeDetail(
                                  horoscope: items[index],
                                )));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(10)),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey.shade300,
                              offset: new Offset(7, 5),
                            )
                          ],
                        ),
                        child: ListTile(
                          title: Text(items[index].name.toString()),
                          subtitle: Text(items[index].dates.toString()),
                        ),
                      ),
                    );
                  });
            }
            if (data.hasError) {
              return Container(
                child: Center(child: Text("Error")),
              );
            } else {
              return Container(
                child: Center(child: Text("No data")),
              );
            }
          }),
    );
  }
}
