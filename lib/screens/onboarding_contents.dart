class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Gps tracking",
    image: "assets/image/bac1v2.png",
    desc: "Send your live location to your loved ones",
  ),
  OnboardingContents(
    title: "Voice Recognition",
    image: "assets/image/2.png",
    desc: "User your voice to awake app and use all features",
  ),
  OnboardingContents(
    title: "Send Message",
    image: "assets/image/bac3v2.png",
    desc: "Send message to your registered contacts",
  ),
];
