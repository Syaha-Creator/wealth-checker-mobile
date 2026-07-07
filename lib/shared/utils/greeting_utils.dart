String greetingForHour(int hour) {
  if (hour >= 5 && hour < 11) {
    return 'Selamat pagi';
  }
  if (hour >= 11 && hour < 15) {
    return 'Selamat siang';
  }
  if (hour >= 15 && hour < 19) {
    return 'Selamat sore';
  }
  return 'Selamat malam';
}

String greetingForNow({DateTime? now}) {
  return greetingForHour((now ?? DateTime.now()).hour);
}
