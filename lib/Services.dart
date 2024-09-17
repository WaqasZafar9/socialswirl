import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ContactUs.dart';
import 'home_screen.dart';
import 'widgets/TopBarDrawer.dart';
import 'widgets/custom_page_route.dart';

// List of customer logos
const List<String> customerLogos = [
  'assets/Services/creamlogo.jpeg',
  'assets/Services/dkgroup.jpeg',
  'assets/Services/elisha.jpeg',
  'assets/Services/M.jpeg',
  'assets/Services/MT.jpeg',
  // Add more logo asset paths
];

class ServicesPage extends ConsumerStatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends ConsumerState<ServicesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SocialSwirlsDrawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
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
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/Services/servicesbanner.png',
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                WhereWeSupportSection(),
                OurCustomerSection(),
                ProjectCardsWidget(),
                _buildGettingStarted(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WhereWeSupportSection extends StatelessWidget {
  final List<SupportCard> supportCards = const [
    SupportCard(
      title: 'Website Design and Development',
      description: 'Unlock your online potential with captivating websites tailored to your unique vision and business needs.',
      icon: Icons.web,
    ),
    SupportCard(
      title: 'Business Websites',
      description: 'Power up your business with custom-designed websites engineered for success in the digital arena.',
      icon: Icons.business,
    ),
    SupportCard(
      title: 'E-commerce Solutions',
      description: 'Transform your online store with cutting-edge e-commerce solutions designed for maximum conversions.',
      icon: Icons.shopping_cart,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final headingStyle = GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Where We Support', style: headingStyle),
        ),
        ...supportCards.map((card) => card).toList(),
      ],
    );
  }
}

class SupportCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const SupportCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: const Color(0xFF64ACF9)),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.poppins(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Get a Quote',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF64ACF9),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      minimumSize: const Size(100, 36),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Read More'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFF64ACF9),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      minimumSize: const Size(100, 36),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OurCustomerSection extends StatefulWidget {
  @override
  _OurCustomerSectionState createState() => _OurCustomerSectionState();
}

class _OurCustomerSectionState extends State<OurCustomerSection> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    const double scrollSpeed = 2;
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentPosition = _scrollController.position.pixels;

        if (currentPosition >= maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(currentPosition + scrollSpeed);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final headingStyle = GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Our Customers', style: headingStyle),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: customerLogos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(customerLogos[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget _buildGettingStarted(BuildContext context) {
  final headingStyle = GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold);
  final bodyStyle = GoogleFonts.poppins(fontSize: 16);

  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Text('Ready to Get Started?', style: headingStyle),
        const SizedBox(height: 16),
        Text(
          'At Social Swirl, we\'re committed to providing top-notch services to help you reach your digital goals. Whether you\'re a small business or a large enterprise, we have the solutions you need to succeed.',
          textAlign: TextAlign.center,
          style: bodyStyle,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(
                ContactFormPage(), AnimationType.rightToLeft));
          },
          child: const Text('Contact Us', style: TextStyle(
            color: Colors.white,
          ),),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF57A5F9),
          ),
        ),
      ],
    ),
  );
}


class ProjectCardsWidget extends StatefulWidget {
  const ProjectCardsWidget({Key? key}) : super(key: key);

  @override
  _ProjectCardsWidgetState createState() => _ProjectCardsWidgetState();
}
class _ProjectCardsWidgetState extends State<ProjectCardsWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  final List<Map<String, String>> _projects = [
    {
      'title': 'Loja',
      'subtitle': 'Fashion-forward western apparel for modern trends.',
      'image': 'assets/Services/Artboard 1.jpg',
    },
    {
      'title': 'Elisha',
      'subtitle': 'Stylish and contemporary clothing collections.',
      'image': 'assets/Services/Artboard 2.jpg',
    },
    {
      'title': 'DK Group',
      'subtitle': 'Innovative and essential electronic gadgets.',
      'image': 'assets/Services/Artboard 3.jpg',
    },
    {
      'title': 'Gotorlly',
      'subtitle': 'Strategic investment solutions for growth and success.',
      'image': 'assets/Services/Artboard 4.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentPage < _projects.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _startAutoScroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Our Projects',
            style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Here are some of the projects and brands we have proudly collaborated with, showcasing our expertise and dedication in delivering top-notch solutions.',
            style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }
                  return Center(
                    child: SizedBox(
                      height: Curves.easeInOut.transform(value) * 300,
                      width: Curves.easeInOut.transform(value) * 400,
                      child: child,
                    ),
                  );
                },
                child: _buildCard(_projects[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCard(Map<String, String> project) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              project['image']!,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 16,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['title']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                Text(
                  project['subtitle']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    shadows: [
                      Shadow(
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 11,
            right: 11,
            child: TextButton(
              onPressed: () {
                // Add your "Read More" logic here
              },

              child: const Text('Read More', style: TextStyle(
                color: Colors.black,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}