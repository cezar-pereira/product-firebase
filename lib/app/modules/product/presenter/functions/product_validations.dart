class ProductValidations {
  String? title(String value) {
    return value.isEmpty ? 'Título inválido' : null;
  }

  String? type(String value) {
    return value.isEmpty ? 'Tipo inválido' : null;
  }

  String? price(String value) {
    return value.isEmpty ? 'Preço inválido' : null;
  }

  String? rating(String value) {
    return (int.parse(value) >= 0 && int.parse(value) <= 5)
        ? null
        : 'nota inválida. Digite entre 0 e 5';
  }
}
