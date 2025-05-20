class PaymentException implements Exception {
  final String msg;
  const PaymentException(this.msg);
}

class CacheException implements Exception {}
