double calculatePadding(double width) {
  if (width >= 1440) {
    return 30;
  } else if (width < 440) {
    return 12;
  } else {
    return ((width - 440) / (1440 - 440) * (30 - 12)) + 12;
  }
}