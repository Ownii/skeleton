import 'package:example/example_data.dart';
import 'package:flutter/material.dart';
import 'package:skeleton/skeleton.dart';

class ExampleScreen extends StatelessWidget {
  ExampleScreen({super.key});

  final loadData =
      Future.delayed(const Duration(seconds: 5), () => fetchedExampleData);

  final dummyFirstName = "abcdef";

  @override
  Widget build(BuildContext context) => SkeletonFutureBuilder<ExampleData>(
        future: loadData,
        dummy: dummyData,
        builder: (context, data) => ExampleContent(
          firstName: data.firstName,
          greeting: data.greeting,
          greetingImageUrl: data.greetingImageUrl,
        ),
        error: (context, error) => Text("Error occurred: $error"),
      );
}

class ExampleContent extends StatelessWidget {
  final String firstName;
  final String greeting;
  final String greetingImageUrl;

  const ExampleContent(
      {super.key,
      required this.firstName,
      required this.greeting,
      required this.greetingImageUrl});

  @override
  Widget build(BuildContext context) => SkeletonSingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SkeletonImage(
                      width: 32,
                      height: 32,
                      image: AssetImage("assets/flutterlogo.png"),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: (SkeletonLoading.of(context)?.isLoading ?? false) ? null : () {},
                      icon: const SkeletonIcon(Icons.more_vert),
                    )
                  ],
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    SkeletonText(
                      "Hi $firstName!",
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SkeletonCircleAvatar(
                      radius: 20,
                      child: Text(firstName.substring(0, 2).toUpperCase()),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SkeletonCachedNetworkImage(
                    imageUrl: greetingImageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                SkeletonText(
                  greeting,
                  style: const TextStyle(height: 1.5),
                ),
                // TODO: Container
              ],
            ),
          ),
        ),
      );
}
