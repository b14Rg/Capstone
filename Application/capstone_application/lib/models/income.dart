class Income {
    int id;
    double daily;

    Income({
        this.id,
        this.daily,
    });

    factory Income.fromJson(Map<String, dynamic> json) => Income(
        id: json["id"],
        daily: json["daily"],
    );

    Map<String, dynamic> toJson() => {
        "daily": daily,
    };
}