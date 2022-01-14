import 'package:flutter/material.dart';
import 'package:horoscopes/models/horoscope.dart';

class HoroscopeDetail extends StatelessWidget {
  const HoroscopeDetail({Key? key, required this.horoscope}) : super(key: key);

  final Horoscope horoscope;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 220,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(horoscope.image.toString()),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                    "Information On ${horoscope.name.toString().toUpperCase()} Astrology",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              feauture(
                  "Zodiac Name : ", horoscope.name.toString().toUpperCase()),
              feauture("Dates : ", horoscope.dates.toString()),
              feauture("Element : ", horoscope.element.toString()),
              feauture("Color : ", horoscope.color.toString()),
              feauture("Day : ", horoscope.day.toString()),
              feauture("Ruler : ", horoscope.ruler.toString()),
              feauture("Greatest Compatibility : ",
                  horoscope.greatestCompatibility.toString()),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text("${horoscope.name.toString().toUpperCase()} TRAITS",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              feauture("Strengths : ", horoscope.strengths.toString()),
              feauture("Weaknesses : ", horoscope.weaknesses.toString()),
              feauture("Likes : ", horoscope.likes.toString()),
              feauture("Dislikes : ", horoscope.dislikes.toString()),
            ],
          ),
        )
      ],
    ));
  }

  RichText feauture(textTitle, textData) => RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: textTitle,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            TextSpan(
                text: textData,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.purple.shade400,
                    fontStyle: FontStyle.italic)),
          ],
        ),
      );
}
