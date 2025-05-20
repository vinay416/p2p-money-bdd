bool isPhoneNoValid(String phoneNo) {
  final phoneRegExp = RegExp(r'^\+?[0-9]{7,15}$');
  return phoneRegExp.hasMatch(phoneNo);
}
