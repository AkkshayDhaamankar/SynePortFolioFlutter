class Syne {
  final String title;
  final String email;
  final String location;
  final String description;
  final String followers;
  final String following;
  final String about;
  final String profile_url;
  final String work_experience;
  final String job_title;
  final String company;
  final String timeperiod;
  final String job_location;
  final String education;
  final String school_name;
  final String school_time;
  final String school_location;
  final String work_image;
  final String school_image;
  final String profile_image;
  final String background_image;

  Syne(
      {this.title,
      this.email,
      this.location,
      this.description,
      this.followers,
      this.following,
      this.about,
      this.profile_url,
      this.work_experience,
      this.job_title,
      this.company,
      this.timeperiod,
      this.job_location,
      this.education,
      this.school_name,
      this.school_time,
      this.school_location,
      this.work_image,
      this.school_image,
      this.profile_image,
      this.background_image});

  factory Syne.fromJson(Map<String, dynamic> json) {
    return Syne(
      title: json["title"],
      email: json["email"],
      location: json["location"],
      description: json["description"],
      followers: json["followers"],
      following: json["following"],
      about: json["about"],
      profile_url: json["profile_url"],
      work_experience: json["work_experience"],
      job_title: json["job_title"],
      company: json["company"],
      timeperiod: json["timeperiod"],
      job_location: json["job_location"],
      education: json["education"],
      school_name: json["school_name"],
      school_time: json["school_time"],
      school_location: json["school_location"],
      work_image: json["work_image"],
      school_image: json["school_image"],
      profile_image: json["profile_image"],
      background_image: json["background_image"],
    );
  }
}
