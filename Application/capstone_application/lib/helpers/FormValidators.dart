String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) {
    return 'Please enter an email';
  } else if (!regex.hasMatch(value)) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

String validatePassword(String value) {
  if(value.isEmpty) {
    return 'Please enter a pasword';
  } else if (value.length < 5) {
    return 'Password must be at least 6 characters';
  } else {
    return null;
  }
}

String validateText(String value) {
  if(value.isEmpty) {
    return 'Please enter a value';
  } else if (value.length < 2) {
    return 'Value must be at least 3 characters';
  } else {
    return null;
  }
}

String validateMoney(String value) {
  Pattern pattern = r'\d+\.\d{2}|\d+';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) {
    return 'Please enter a value';
  } else if (!regex.hasMatch(value)) {
    return 'Enter a valid value (100.00 or 100)';
  } else {
    return null;
  }
}
