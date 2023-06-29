enum Gender { male, female }

class Bachelor {
  int id;
  String firstname;
  String lastname;
  Gender gender;
  String avatar;
  List<Gender>? searchFor;
  String? job;
  String? description;

  Bachelor(this.id, this.firstname, this.lastname, this.gender, this.avatar,
      [this.searchFor, this.job, this.description]);
}
