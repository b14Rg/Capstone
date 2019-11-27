class Budget {
    int id;
    double daily;

    Budget({
        this.id,
        this.daily,
    });

    factory Budget.fromJson(Map<String, dynamic> json) => Budget(
        id: json["id"],
        daily: json["daily"],
    );

    Map<String, dynamic> toJson() => {
        "daily": daily,
    };
}