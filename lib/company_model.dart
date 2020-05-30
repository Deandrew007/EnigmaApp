class CompanyModel {
    String address;
    String email;
    double estimatedWaitTime;
    int id;
    String joinedOn;
    String location;
    String logoImage;
    String name;

    CompanyModel({
        this.address,
        this.email,
        this.estimatedWaitTime,
        this.id,
        this.joinedOn,
        this.location,
        this.logoImage,
        this.name,
    });

    factory CompanyModel.fromJson(Map<String, dynamic> json) {
      return new CompanyModel(
        address: json["address"],
        email: json["email"],
        estimatedWaitTime: json["estimated-Wait-Time"],
        id: json["id"],
        joinedOn: json["joined-on"],
        location: json["location"],
        logoImage: json["logo-image"],
        name: json["name"],
      );
    }

}
