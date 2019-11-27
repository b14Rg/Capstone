class Expense {
    int id;
    String title;
    double total;

    Expense.empty();

    Expense({
        this.id,
        this.title,
        this.total,
    });

    factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        id: json["id"],
        title: json["title"],
        total: json["total"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "total": total,
    };
}