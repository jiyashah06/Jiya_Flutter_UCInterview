class Post{
  final String awards;
  final String country;
  final String director;
  final String genre;
  final String language;
  final String plot;
  final String poster;
  final String rated;
  final String runtime;
  final String title;
  final String writer;
  final String year;
  final String imdbRating;
  final String imdbVotes;

  Post({
    required this.awards,
    required this.country,
    required this.director,
    required this.genre,
    required this.language,
    required this.plot,
    required this.poster,
    required this.rated,
    required this.runtime,
    required this.title,
    required this.writer,
    required this.year,
    required this.imdbRating,
    required this.imdbVotes,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    awards:json['Awards'],
    country:json['Country'],
    director:json['Director'],
    genre:json['Genre'],
    language:json['Language'],
    plot:json['Plot'],
    poster:json['Poster'],
    rated:json['Rated'],
    runtime:json['Runtime'],
    title:json['Title'],
    writer:json['Writer'],
    year:json['Year'].toString(),
    imdbRating:json['imdbRating'].toString(),
    imdbVotes:json['imdbVotes'],
  ); 
}