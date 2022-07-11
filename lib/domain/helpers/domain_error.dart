enum DomainError {
  invalidCredentials,
  unexpected,
}

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidCredentials:
        return 'Credenciais inválidas';
      default:
        return '';
    }
  }
}
