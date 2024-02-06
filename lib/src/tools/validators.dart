String? validateDocument(input) {
  if (input.trim() == "") {
    return 'Escribe tu número de identidad';
  }
  if (!RegExp(r"^[0-9]*$").hasMatch(input)) {
    return 'Solo puede ingresar números';
  }
  if (input.trim().length != 13) {
    return 'Escribe un número de identidad válido';
  }

  return null;
}

String? validatePassword(input) {
  if (input.trim() == "") {
    return 'Escribe tu contraseña';
  }

  return null;
}
