class UserModal {
  String? uid;
  String? email;
  String? uname;

  UserModal({this.uid, this.email, this.uname});

  //data form server
  factory UserModal.fromMap(map) {
    return UserModal(
      uid: map['uid'],
      email: map['email'],
      uname: map['uname'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'uname': uname,
    };
  }
}
