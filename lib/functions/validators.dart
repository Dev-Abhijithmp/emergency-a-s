String? isEmail(String? val) {
  if (val!.isEmpty) {
    return "Email is empty";
  }

  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(val)) {
    return "please Enter a valid email";
  }
  return null;
}

String? isName(String? val) {
  if (val!.isEmpty) {
    return "Name is Empty";
  }
  return null;
}

String? isPassword(String? val) {
  if (val!.isEmpty) {
    return "Password is empty";
  }
  if (val.length < 8) {
    return "password is short";
  }
  return null;
}
