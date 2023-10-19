class Validators {
  static String? validateEmail(String text) {
    if (text.isEmpty) {
      return 'Ingrese su correo electrónico';
    }
    // text = text.trim();
    // const String pattern =
    //     r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.)*[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.[a-zA-Z0-9]{2,}$";
    // if (!RegExp(pattern).hasMatch(text)) {
    //   return 'Ingrese un correo electrónico válido';
    // }
    return null;
  }

  static String? validatePassword(String text) {
    if (text.isEmpty) {
      return 'Ingrese su contraseña';
    }
    // text = text.replaceAll(' ', '');
    // const String pattern = r"^(?=.*?[a-z])(?=.*?[0-9]).{4,}$";
    // if (!RegExp(pattern).hasMatch(text)) {
    //   return 'Ingrese una contraseña válida';
    // }
    return null;
  }

  static String? validatePhoneNumber(String text) {
    if (text.isEmpty) {
      return 'Ingrese un número de celular';
    }
    const pattern = r"^9[0-9]{8}$";
    if (!RegExp(pattern).hasMatch(text)) {
      return 'Ingrese un número de celular válido';
    }
    if (text.length != 9) {
      return 'El número de celular debe tener 9 cifras';
    }
    return null;
  }

  static String? validateBirthDate(String text) {
    if (text.isEmpty) {
      return 'Ingrese una fecha de nacimiento';
    }
    return null;
  }

  static String? validateGenre(String text) {
    if (text.isEmpty) {
      return 'Seleccione una opción';
    }
    return null;
  }

  static String? validateExpiryDate(String text) {
    if (text.isEmpty) {
      return 'Ingrese la fecha de expiración';
    }
    final int month = int.parse(text.substring(0, 2));
    if (month < 1 || month > 12) {
      return 'Ingrese un mes válido';
    }
    final int currentMonth = DateTime.now().month;
    final int currentYear =
        int.parse(DateTime.now().year.toString().substring(2));
    final year = int.parse(text.substring(3));
    if (year < currentYear || year > currentYear + 10) {
      return 'Ingrese un año válido';
    }
    if (month < currentMonth && year <= currentYear) {
      return 'Ingrese un mes válido';
    }
    return null;
  }
}
