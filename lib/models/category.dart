class CategoryModel {
  String? url;
  String? category;

  CategoryModel({
    this.url,
    this.category,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['url'] = url;
    data['category'] = category;

    return data;
  }
}
