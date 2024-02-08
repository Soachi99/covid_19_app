// To parse this JSON data, do
//
//     final states = statesFromJson(jsonString);

import 'dart:convert';

List<States> statesFromJson(String str) =>
    List<States>.from(json.decode(str).map((x) => States.fromJson(x)));

String statesToJson(List<States> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class States {
  String state;
  String notes;
  String covid19Site;
  String? covid19SiteSecondary;
  String? covid19SiteTertiary;
  String? covid19SiteQuaternary;
  String? covid19SiteQuinary;
  String? twitter;
  String covid19SiteOld;
  String covidTrackingProjectPreferredTotalTestUnits;
  String covidTrackingProjectPreferredTotalTestField;
  String totalTestResultsField;
  String pui;
  bool pum;
  String name;
  String fips;

  States({
    required this.state,
    required this.notes,
    required this.covid19Site,
    required this.covid19SiteSecondary,
    required this.covid19SiteTertiary,
    required this.covid19SiteQuaternary,
    required this.covid19SiteQuinary,
    required this.twitter,
    required this.covid19SiteOld,
    required this.covidTrackingProjectPreferredTotalTestUnits,
    required this.covidTrackingProjectPreferredTotalTestField,
    required this.totalTestResultsField,
    required this.pui,
    required this.pum,
    required this.name,
    required this.fips,
  });

  factory States.fromJson(Map<String, dynamic> json) => States(
        state: json["state"],
        notes: json["notes"],
        covid19Site: json["covid19Site"],
        covid19SiteSecondary: json["covid19SiteSecondary"],
        covid19SiteTertiary: json["covid19SiteTertiary"],
        covid19SiteQuaternary: json["covid19SiteQuaternary"],
        covid19SiteQuinary: json["covid19SiteQuinary"],
        twitter: json["twitter"],
        covid19SiteOld: json["covid19SiteOld"],
        covidTrackingProjectPreferredTotalTestUnits:
            json["covidTrackingProjectPreferredTotalTestUnits"],
        covidTrackingProjectPreferredTotalTestField:
            json["covidTrackingProjectPreferredTotalTestField"],
        totalTestResultsField: json["totalTestResultsField"],
        pui: json["pui"],
        pum: json["pum"],
        name: json["name"],
        fips: json["fips"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "notes": notes,
        "covid19Site": covid19Site,
        "covid19SiteSecondary": covid19SiteSecondary,
        "covid19SiteTertiary": covid19SiteTertiary,
        "covid19SiteQuaternary": covid19SiteQuaternary,
        "covid19SiteQuinary": covid19SiteQuinary,
        "twitter": twitter,
        "covid19SiteOld": covid19SiteOld,
        "covidTrackingProjectPreferredTotalTestUnits": [
          covidTrackingProjectPreferredTotalTestUnits
        ],
        "covidTrackingProjectPreferredTotalTestField": [
          covidTrackingProjectPreferredTotalTestField
        ],
        "totalTestResultsField": [totalTestResultsField],
        "pui": pui,
        "pum": pum,
        "name": name,
        "fips": fips,
      };
}
