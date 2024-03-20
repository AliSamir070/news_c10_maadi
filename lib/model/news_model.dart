class NewsModel{
  String id;
  String title;
  String image;
  String sourceName;
  String date;
  NewsModel({required this.id ,required this.date, required this.title , required this.image , required this.sourceName});
  static List<NewsModel> newsList = [
    NewsModel(id: "1", title: "Why are football's biggest clubs starting a newtournament?", image: "assets/images/article.png", sourceName: "BBC",date: "3 hours ago"),
    NewsModel(id: "1", title: "Why are football's biggest clubs starting a newtournament?", image: "assets/images/article.png", sourceName: "BBC",date: "3 hours ago"),
    NewsModel(id: "1", title: "Why are football's biggest clubs starting a newtournament?", image: "assets/images/article.png", sourceName: "BBC",date: "3 hours ago"),
    NewsModel(id: "1", title: "Why are football's biggest clubs starting a newtournament?", image: "assets/images/article.png", sourceName: "BBC",date: "3 hours ago"),
    NewsModel(id: "1", title: "Why are football's biggest clubs starting a newtournament?", image: "assets/images/article.png", sourceName: "BBC",date: "3 hours ago"),
    NewsModel(id: "1", title: "Why are football's biggest clubs starting a newtournament?", image: "assets/images/article.png", sourceName: "BBC",date: "3 hours ago"),
  ];
}