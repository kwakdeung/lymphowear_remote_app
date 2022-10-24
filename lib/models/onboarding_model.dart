class Onboarding {
  final String image, title, description;

  Onboarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboarding> onboardingData = [
  Onboarding(
    image: "assets/images/lymphowear_face.png",
    title: "Title title 1",
    description:
        "LymphoWear is the world-first wearable device for lymphatic drainage massage.",
  ),
  Onboarding(
    image: "assets/images/lymphowear_left.png",
    title: "Title title 2",
    description: "This app helps you to control your device easier.",
  ),
  Onboarding(
    image: "assets/images/lymphowear_face.png",
    title: "Title title 3",
    description: "Also enjoy 3 types of massage program we provide!",
  ),
];
