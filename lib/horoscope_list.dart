import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:horoscopes/horoscope_detail.dart';
import 'package:horoscopes/models/horoscope.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HoroscopeList extends StatefulWidget {
  const HoroscopeList({Key? key}) : super(key: key);

  @override
  State<HoroscopeList> createState() => _HoroscopeListState();
}

class _HoroscopeListState extends State<HoroscopeList> {
  final List<String> imgList = [
    'https://static.toiimg.com/photo/74865493.cms',
    'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/10/horoscope-1602347209.jpg',
    'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2019/09/astrology-1567825556-1568596701.jpg'
  ];

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
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade200,
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(seconds: 1)),
                    items: imgList
                        .map((item) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(item, fit: BoxFit.cover),
                              ),
                            ))
                        .toList(),
                  )),
              Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                      future: ReadJsonData(),
                      builder: (context, data) {
                        if (data.hasData) {
                          var items = data.data as List<Horoscope>;
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HoroscopeDetail(
                                                  horoscope: items[index],
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(10)),
                                      boxShadow: [
                                        new BoxShadow(
                                          color: Colors.grey.shade300,
                                          offset: new Offset(7, 5),
                                        )
                                      ],
                                    ),
                                    child: ListTile(
                                      title: Text(items[index].name.toString()),
                                      subtitle:
                                          Text(items[index].dates.toString()),
                                      trailing: Icon(
                                          Icons.arrow_forward_ios_outlined),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
