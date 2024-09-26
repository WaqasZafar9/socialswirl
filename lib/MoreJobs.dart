import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialswirl/widgets/TopBarDrawer.dart';
import 'package:socialswirl/widgets/custom_page_route.dart';
import 'home_screen.dart';

// Career Model
class Career {
  final String title;
  final String location;
  final String description;
  final String imageUrl;

  Career({
    required this.title,
    required this.location,
    required this.description,
    required this.imageUrl,
  });
}

// Riverpod provider to manage career state
final careerProvider = StateProvider<List<Career>>((ref) {
  return [
    Career(
      title: "Back End Development",
      location: "Lahore",
      description: "Build and maintain server-side applications.",
      imageUrl: "assets/Remote Jobs/backend.jpg",
    ),
    Career(
      title: "Frontend Development",
      location: "Lahore",
      description: "Create responsive and interactive web designs.",
      imageUrl: "assets/Remote Jobs/frontend.jpg",
    ),
    Career(
      title: "SEO Expert",
      location: "Lahore",
      description: "Optimize websites to improve search engine rankings.",
      imageUrl: "assets/Remote Jobs/seo.jpg",
    ),
    Career(
      title: "Full Stack Developer",
      location: "Lahore",
      description: "Develop and manage both front and back-end web solutions.",
      imageUrl: "assets/Remote Jobs/fullstack.jpg",
    ),
    Career(
      title: "Graphic Designer",
      location: "Lahore",
      description: "Design visually compelling graphics and layouts.",
      imageUrl: "assets/Remote Jobs/graphic.jpg",
    ),
    Career(
      title: "Social Media Marketer",
      location: "Lahore",
      description: "Manage and strategics social media campaigns.",
      imageUrl: "assets/Remote Jobs/SMM.jpg",
    ),
    Career(
      title: "Data Entry Operator",
      location: "Lahore",
      description: "Accurately input and manage data.",
      imageUrl: "assets/Remote Jobs/data.jpg",
    ),
    Career(
      title: "Chat Support Agent",
      location: "Lahore",
      description: "Provide real-time online customer support.",
      imageUrl: "assets/Remote Jobs/chat-support.jpg",
    ),
    Career(
      title: "Teacher / Consultant",
      location: "Lahore",
      description: "Deliver educational content and professional advice.",
      imageUrl: "assets/Remote Jobs/teacher.jpg",
    ),
    Career(
      title: "Sales Executive",
      location: "Lahore",
      description: "Drive sales and build client relationships.",
      imageUrl: "assets/Remote Jobs/sales.jpg",
    ),
    Career(
      title: "Business Developer",
      location: "Lahore",
      description: "Identify and develop business growth opportunities.",
      imageUrl: "assets/Remote Jobs/buisness.jpg",
    ),
  ];
});

class Morejobs extends StatefulWidget {
  const Morejobs({super.key});

  @override
  State<Morejobs> createState() => _MorejobsState();
}

class _MorejobsState extends State<Morejobs> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;
  late PageController _pageController;
  int currentPage = 0;
  int _hoveredIndex = -1;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _pageController = PageController(); // Initialize _pageController here
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu_open_outlined, size: 32),
        ),
        backgroundColor: const Color(0xFFE3F1FC),
        title: Text(
          'Social Swirl',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(
                  HomeScreen(), AnimationType.topToBottom));
            },
            icon: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/logo.jpeg'),
            ),
          ),
        ],
      ),
      drawer: SocialSwirlsDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: const Column(
                  children: [
                    CareerSectionWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CareerSectionWidget extends ConsumerWidget {
  const CareerSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final careers = ref.watch(careerProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Center(
            child: Text(
              'Open Position',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          // Career cards
          for (var career in careers) CareerCard(career: career),
        ],
      ),
    );
  }
}

class CareerCard extends StatelessWidget {
  final Career career;
  const CareerCard({Key? key, required this.career}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4,
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          career.title,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          career.description,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.black87,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              career.location,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      career.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle apply now action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Apply Now"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
