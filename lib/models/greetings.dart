class Greetings {
  late String _greeting;
  String get greeting => determineGreeting();

  String determineGreeting() {
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;

    if (currentHour < 12) {
      _greeting = 'Good Morning';
    } else if (currentHour < 17) {
      _greeting = 'Good Afternoon';
    } else {
      _greeting = 'Good Evening';
    }
    return _greeting;
  }
}
