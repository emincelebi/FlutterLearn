class SharedNotInitilazedException implements Exception {
  @override
  String toString() {
    return 'Your preferences has not initilazed right now';
  }
}
