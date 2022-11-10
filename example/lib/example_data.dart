const fetchedExampleData = ExampleData(
  firstName: "Bob",
  greeting:
      "Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
  greetingImageUrl: 'https://storage.googleapis.com/cms-storage-bucket/images/image001.width-1440.format-webp-lossless.webp',
);

const dummyData = ExampleData(
  firstName: "abcdef",
  greeting:
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum",
  greetingImageUrl: "someUrl",
);

class ExampleData {
  final String firstName;
  final String greeting;
  final String greetingImageUrl;

  const ExampleData(
      {required this.firstName,
      required this.greeting,
      required this.greetingImageUrl});
}
