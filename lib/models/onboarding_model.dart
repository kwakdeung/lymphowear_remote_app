class Onboarding {
  final String image, title, description;

  Onboarding(
      {required this.image, required this.title, required this.description});
}

final List<Onboarding> onboardingData = [
  Onboarding(
      image: "assets/images/LymphoWear.png",
      title: "Title title 1",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
  Onboarding(
      image: "assets/images/LymphoWearLeft.png",
      title: "Title title 2",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
  Onboarding(
      image: "assets/images/LymphoWearUse.png",
      title: "Title title 3",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
];
