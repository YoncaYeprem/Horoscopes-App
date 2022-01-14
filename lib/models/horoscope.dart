class Horoscope {
  String? name;
  String? element;
  String? color;
  String? quality;
  String? day;
  String? ruler;
  String? greatestCompatibility;
  String? luckyNumbers;
  String? dates;
  String? strengths;
  String? weaknesses;
  String? likes;
  String? dislikes;
  String? image;

  Horoscope(
      {this.name,
      this.element,
      this.color,
      this.quality,
      this.day,
      this.ruler,
      this.greatestCompatibility,
      this.luckyNumbers,
      this.dates,
      this.strengths,
      this.weaknesses,
      this.likes,
      this.dislikes,
      this.image});

  Horoscope.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    element = json['element'];
    color = json['color'];
    quality = json['quality'];
    day = json['day'];
    ruler = json['ruler'];
    greatestCompatibility = json['greatestCompatibility'];
    luckyNumbers = json['luckyNumbers'];
    dates = json['dates'];
    strengths = json['strengths'];
    weaknesses = json['weaknesses'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['element'] = this.element;
    data['color'] = this.color;
    data['quality'] = this.quality;
    data['day'] = this.day;
    data['ruler'] = this.ruler;
    data['greatestCompatibility'] = this.greatestCompatibility;
    data['luckyNumbers'] = this.luckyNumbers;
    data['dates'] = this.dates;
    data['strengths'] = this.strengths;
    data['weaknesses'] = this.weaknesses;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['image'] = this.image;
    return data;
  }
}
