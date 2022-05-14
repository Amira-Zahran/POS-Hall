import 'Branch.dart';

class User {
    Branch? branch;
    String? email;
    String? name;
    String? token;
    String? type;

    User({this.branch, this.email, this.name, this.token, this.type});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            branch: json['branch'] != null ? Branch.fromJson(json['branch']) : null, 
            email: json['email'], 
            name: json['name'], 
            token: json['token'], 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['name'] = this.name;
        data['token'] = this.token;
        data['type'] = this.type;
        if (this.branch != null) {
            data['branch'] = this.branch!.toJson();
        }
        return data;
    }
}