class Branch {
    int? active;
    String? address;
    int? id;
    String? name;

    Branch({this.active, this.address, this.id, this.name});

    factory Branch.fromJson(Map<String, dynamic> json) {
        return Branch(
            active: json['active'], 
            address: json['address'], 
            id: json['id'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['active'] = this.active;
        data['address'] = this.address;
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}