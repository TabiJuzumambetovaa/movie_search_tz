class UniSearch {
  List<Docs>? docs;
  int? total;
  int? limit;
  int? page;
  int? pages;

  UniSearch({this.docs, this.total, this.limit, this.page, this.pages});

  UniSearch.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = <Docs>[];
      json['docs'].forEach((v) {
        docs!.add(Docs.fromJson(v));
      });
    }
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (docs != null) {
      data['docs'] = docs!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['limit'] = limit;
    data['page'] = page;
    data['pages'] = pages;
    return data;
  }
}

class Docs {
  int? id;
  String? name;
  String? alternativeName;
  Null enName;
  String? type;
  int? typeNumber;
  int? year;
  String? description;
  String? shortDescription;
  String? status;
  Rating? rating;
  Votes? votes;
  int? movieLength;
  int? totalSeriesLength;
  int? seriesLength;
  String? ratingMpaa;
  int? ageRating;
  Poster? poster;
  Poster? backdrop;
  List<Genres>? genres;
  Null top10;
  Null top250;
  bool? isSeries;
  bool? ticketsOnSale;
  List<ReleaseYears>? releaseYears;

  Docs(
      {this.id,
      this.name,
      this.alternativeName,
      this.enName,
      this.type,
      this.typeNumber,
      this.year,
      this.description,
      this.shortDescription,
      this.status,
      this.rating,
      this.votes,
      this.movieLength,
      this.totalSeriesLength,
      this.seriesLength,
      this.ratingMpaa,
      this.ageRating,
      this.poster,
      this.backdrop,
      this.genres,
      this.top10,
      this.top250,
      this.isSeries,
      this.ticketsOnSale,
      this.releaseYears});

  Docs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeName = json['alternativeName'];
    enName = json['enName'];
    type = json['type'];
    typeNumber = json['typeNumber'];
    year = json['year'];
    description = json['description'];
    shortDescription = json['shortDescription'];
    status = json['status'];
    rating =
        json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    votes = json['votes'] != null ? Votes.fromJson(json['votes']) : null;
    movieLength = json['movieLength'];
    totalSeriesLength = json['totalSeriesLength'];
    seriesLength = json['seriesLength'];
    ratingMpaa = json['ratingMpaa'];
    ageRating = json['ageRating'];
    poster =
        json['poster'] != null ? Poster.fromJson(json['poster']) : null;
    backdrop =
        json['backdrop'] != null ? Poster.fromJson(json['backdrop']) : null;
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
   
    top10 = json['top10'];
    top250 = json['top250'];
    isSeries = json['isSeries'];
    ticketsOnSale = json['ticketsOnSale'];
    if (json['releaseYears'] != null) {
      releaseYears = <ReleaseYears>[];
      json['releaseYears'].forEach((v) {
        releaseYears!.add(ReleaseYears.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alternativeName'] = alternativeName;
    data['enName'] = enName;
    data['type'] = type;
    data['typeNumber'] = typeNumber;
    data['year'] = year;
    data['description'] = description;
    data['shortDescription'] = shortDescription;
    data['status'] = status;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    if (votes != null) {
      data['votes'] = votes!.toJson();
    }
    data['movieLength'] = movieLength;
    data['totalSeriesLength'] = totalSeriesLength;
    data['seriesLength'] = seriesLength;
    data['ratingMpaa'] = ratingMpaa;
    data['ageRating'] = ageRating;
    if (poster != null) {
      data['poster'] = poster!.toJson();
    }
    if (backdrop != null) {
      data['backdrop'] = backdrop!.toJson();
    }
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    
    data['top10'] = top10;
    data['top250'] = top250;
    data['isSeries'] = isSeries;
    data['ticketsOnSale'] = ticketsOnSale;
    if (releaseYears != null) {
      data['releaseYears'] = releaseYears!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rating {
  num? kp;
  num? imdb;
  num? filmCritics;
  int? russianFilmCritics;
  int? await;

  Rating(
      {this.kp,
      this.imdb,
      this.filmCritics,
      this.russianFilmCritics,
      this.await});
  
  Rating.fromJson(Map<String, dynamic> json) {
    kp = json['kp'];
    imdb = json['imdb'];
    filmCritics = json['filmCritics'];
    russianFilmCritics = json['russianFilmCritics'];
    await = json['await'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kp'] = kp;
    data['imdb'] = imdb;
    data['filmCritics'] = filmCritics;
    data['russianFilmCritics'] = russianFilmCritics;
    data['await'] = await;
    return data;
  }
}

class Votes {
  int? kp;
  int? imdb;
  int? filmCritics;
  int? russianFilmCritics;
  int? await;

  Votes(
      {this.kp,
      this.imdb,
      this.filmCritics,
      this.russianFilmCritics,
      this.await});

  Votes.fromJson(Map<String, dynamic> json) {
    kp = json['kp'];
    imdb = json['imdb'];
    filmCritics = json['filmCritics'];
    russianFilmCritics = json['russianFilmCritics'];
    await = json['await'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kp'] = kp;
    data['imdb'] = imdb;
    data['filmCritics'] = filmCritics;
    data['russianFilmCritics'] = russianFilmCritics;
    data['await'] = await;
    return data;
  }
}

class Poster {
  String? url;
  String? previewUrl;

  Poster({this.url, this.previewUrl});

  Poster.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    previewUrl = json['previewUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['previewUrl'] = previewUrl;
    return data;
  }
}

class Genres {
  String? name;

  Genres({this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class ReleaseYears {
  int? start;
  int? end;

  ReleaseYears({this.start, this.end});

  ReleaseYears.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start'] = start;
    data['end'] = end;
    return data;
  }
}
