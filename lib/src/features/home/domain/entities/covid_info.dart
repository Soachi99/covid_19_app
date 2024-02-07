// To parse this JSON data, do
//
//     final covidInfo = covidInfoFromJson(jsonString);

import 'dart:convert';

List<CovidInfo> covidInfoFromJson(String str) =>
    List<CovidInfo>.from(json.decode(str).map((x) => CovidInfo.fromJson(x)));

String covidInfoToJson(List<CovidInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CovidInfo {
  int date;
  int states;
  int positive;
  int negative;
  int pending;
  int hospitalizedCurrently;
  int hospitalizedCumulative;
  int inIcuCurrently;
  int inIcuCumulative;
  int onVentilatorCurrently;
  int onVentilatorCumulative;
  String dateChecked;
  int death;
  int hospitalized;
  int totalTestResults;
  String lastModified;
  dynamic recovered;
  int total;
  int posNeg;
  int deathIncrease;
  int hospitalizedIncrease;
  int negativeIncrease;
  int positiveIncrease;
  int totalTestResultsIncrease;
  String hash;

  CovidInfo({
    required this.date,
    required this.states,
    required this.positive,
    required this.negative,
    required this.pending,
    required this.hospitalizedCurrently,
    required this.hospitalizedCumulative,
    required this.inIcuCurrently,
    required this.inIcuCumulative,
    required this.onVentilatorCurrently,
    required this.onVentilatorCumulative,
    required this.dateChecked,
    required this.death,
    required this.hospitalized,
    required this.totalTestResults,
    required this.lastModified,
    required this.recovered,
    required this.total,
    required this.posNeg,
    required this.deathIncrease,
    required this.hospitalizedIncrease,
    required this.negativeIncrease,
    required this.positiveIncrease,
    required this.totalTestResultsIncrease,
    required this.hash,
  });

  factory CovidInfo.fromJson(Map<String, dynamic> json) => CovidInfo(
        date: json["date"],
        states: json["states"],
        positive: json["positive"],
        negative: json["negative"],
        pending: json["pending"],
        hospitalizedCurrently: json["hospitalizedCurrently"],
        hospitalizedCumulative: json["hospitalizedCumulative"],
        inIcuCurrently: json["inIcuCurrently"],
        inIcuCumulative: json["inIcuCumulative"],
        onVentilatorCurrently: json["onVentilatorCurrently"],
        onVentilatorCumulative: json["onVentilatorCumulative"],
        dateChecked: json["dateChecked"],
        death: json["death"],
        hospitalized: json["hospitalized"],
        totalTestResults: json["totalTestResults"],
        lastModified: json["lastModified"],
        recovered: json["recovered"],
        total: json["total"],
        posNeg: json["posNeg"],
        deathIncrease: json["deathIncrease"],
        hospitalizedIncrease: json["hospitalizedIncrease"],
        negativeIncrease: json["negativeIncrease"],
        positiveIncrease: json["positiveIncrease"],
        totalTestResultsIncrease: json["totalTestResultsIncrease"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "states": states,
        "positive": positive,
        "negative": negative,
        "pending": pending,
        "hospitalizedCurrently": hospitalizedCurrently,
        "hospitalizedCumulative": hospitalizedCumulative,
        "inIcuCurrently": inIcuCurrently,
        "inIcuCumulative": inIcuCumulative,
        "onVentilatorCurrently": onVentilatorCurrently,
        "onVentilatorCumulative": onVentilatorCumulative,
        "dateChecked": dateChecked,
        "death": death,
        "hospitalized": hospitalized,
        "totalTestResults": totalTestResults,
        "lastModified": lastModified,
        "recovered": recovered,
        "total": total,
        "posNeg": posNeg,
        "deathIncrease": deathIncrease,
        "hospitalizedIncrease": hospitalizedIncrease,
        "negativeIncrease": negativeIncrease,
        "positiveIncrease": positiveIncrease,
        "totalTestResultsIncrease": totalTestResultsIncrease,
        "hash": hash,
      };
}
