int parseJsonInt(dynamic value) => (value as num).toInt();

int parseJsonIntOrString(dynamic value) {
  if (value is String) {
    return int.parse(value);
  }
  return parseJsonInt(value);
}

double? parseJsonDoubleNullable(dynamic value) {
  if (value == null) {
    return null;
  }
  return (value as num).toDouble();
}

double parseJsonDoubleOrString(dynamic value) {
  if (value is String) {
    return double.parse(value);
  }
  return (value as num).toDouble();
}

int parseJsonMoneyAmount(dynamic value) {
  if (value is String) {
    return double.parse(value).round();
  }
  return (value as num).round();
}

double? parseJsonDoubleOrStringNullable(dynamic value) {
  if (value == null) {
    return null;
  }
  return parseJsonDoubleOrString(value);
}
