// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsModel {
  String? author;
  DateTime? date;
  String? content;
  bool isExpanded;
  NewsModel({
    this.author,
    this.date,
    this.content,
    this.isExpanded = false,
  });
}
