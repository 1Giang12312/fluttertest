// ignore_for_file: file_names

import 'dart:convert';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
    String? api;
    String? description;
    String? auth;
    bool? https;
    String? cors;
    String? link;
    String? category;

    Test({
        this.api,
        this.description,
        this.auth,
        this.https,
        this.cors,
        this.link,
        this.category,
    });

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        api: json["API"],
        description: json["Description"],
        auth: json["Auth"],
        https: json["HTTPS"],
        cors: json["Cors"],
        link: json["Link"],
        category: json["Category"],
    );

    Map<String, dynamic> toJson() => {
        "API": api,
        "Description": description,
        "Auth": auth,
        "HTTPS": https,
        "Cors": cors,
        "Link": link,
        "Category": category,
    };
}
