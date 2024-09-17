import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:socialswirl/services_pages/buisness_websites.dart';
import 'package:socialswirl/services_pages/consulting_service.dart';
import 'package:socialswirl/services_pages/crm_solution.dart';
import 'package:socialswirl/services_pages/designing.dart';
import 'package:socialswirl/services_pages/digital_marketing.dart';
import 'package:socialswirl/services_pages/e_commerce.dart';
import 'package:socialswirl/services_pages/seo_optimization.dart';
import 'package:socialswirl/services_pages/webdesign%20&%20development.dart';
import 'package:socialswirl/widgets/TopBarDrawer.dart';
import 'package:socialswirl/widgets/custom_page_route.dart';
import 'dart:async';
import 'ContactUs.dart';
import 'Services.dart';
import 'widgets/bottom_navigation.dart';
import 'package:flutter/foundation.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Service> services = [
    Service('assets/e-commerce.png', 'E-Commerce Solutions',
        'Revolutionize your online retail experience with robust e-commerce solutions tailored to fuel your growth and profitability.'),
    Service('assets/webdesign.png', 'Website Design & Development',
        'Unlock your online potential with captivating websites tailored to your unique vision and business needs.'),
    Service('assets/seo-optimization.png', 'SEO Optimization',
        'Propel your website to the top of search engine results and amplify your online visibility with our expert SEO strategies.'),
    Service('assets/design.png', 'Designing',
        'Make a lasting impression with captivating designs that resonate with your audience and elevate your brand\'s identity.'),
    Service('assets/digital marketing.png', 'Digital Marketing',
        'Expand your digital footprint and connect with your target audience through strategic digital marketing campaigns.'),
    Service('assets/crm.png', 'CRM Solution',
        'Transform your customer relationships and drive business growth with our intuitive CRM solutions designed to streamline your sales and support processes.'),
    Service('assets/Consulting.png', 'Consulting Service',
        'Gain invaluable insights and expert guidance to steer your business towards sustainable success in the digital age.'),
    Service('assets/buisness.png', 'Business Websites',
        'Power up your business with custom-designed websites engineered for success in the digital arena.'),
  ];

  final List<Service> elearningServices = [
    Service('assets/certificate.png', 'Certification', ''),
    Service('assets/internship.png', 'Internship', ''),
    Service('assets/classes.png', 'Classes', ''),
    Service('assets/privategroups.png', 'Private Groups', ''),
  ];

  final List<Expert> experts = [
    Expert(
      'assets/muaaz.png',
      'Muaaz',
      'Sales Executive',
    ),
    Expert(
      'assets/abdullah.png',
      'Abdullah',
      'Digital Marketer',
    ),
    Expert(
      'assets/awais.jpg',
      'Awais',
      'Senior SEO Developer',
    ),
    Expert(
      'assets/farrukh.webp',
      'Farrukh',
      'MERN Stack Developer',
    ),
    Expert(
      'assets/hammad.jpg',
      'Hammad',
      'Graphic Designer',
    ),
    Expert(
      'assets/zaid.jpg',
      'Zaid',
      'Social Media Marketer',
    ),
  ];

  late ScrollController _scrollController;
  late PageController _pageController;
  Timer? _timer;
  int currentPage = 0;
  int _hoveredIndex = -1;
  bool _isExpanded = false; // To handle the 'Read More' functionality


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _pageController = PageController(initialPage: 0);

    // Timer to auto-scroll through services
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPage < services.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancelling the timer to avoid memory leaks
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
              Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(HomeScreen(), AnimationType.topToBottom));
            },
            icon: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/logo.jpeg'),
            ),
          ),
        ],
      ),
      drawer: SocialSwirlsDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildTopCard(context),
            _buildWelcomeSection(context),
            _buildServicesSection(context),
            _buildELearningSection(context),
            _buildExpertsSection(context),
            _buildRemoteCareerSection(context),
            _buildgettingstarted(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildTopCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: const Color(0xFFE3F1FC),
        elevation: 10,
        child: Column(
          children: [
            Image.asset(
              'assets/Logo1.png',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Explore the world of web development with Social Swirl. Join our user-friendly courses led by industry experts, offering hands-on experiences and a clear path to mastering coding. Join us to unlock your coding skills and confidently shape your future success',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(ServicesPage(), AnimationType.bottomToTop));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF3164F4),
                elevation: 8, // Add elevation for shadow effect
                shadowColor:
                Colors.black.withOpacity(0.5), // Set shadow color and opacity
              ),
              child: Text(
                'Services',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Welcome to Social Swirl',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            'assets/home_services.png',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: Text(
                    'The company\'s mission is to provide high-quality software solutions and media that help businesses and individuals optimise their online presence and achieve their goals. With a team of experienced professionals and a commitment to excellence, Social Swirl is dedicated to providing personalised, reliable, and affordable services to its clients. AIMS Our mission is to provide high-quality software solutions and media services that help businesses and individuals optimise their online presence and achieve their goals.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 4, // Show only 2 lines initially
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  secondChild: Text(
                    'The company\'s mission is to provide high-quality software solutions and media that help businesses and individuals optimise their online presence and achieve their goals. With a team of experienced professionals and a commitment to excellence, Social Swirl is dedicated to providing personalised, reliable, and affordable services to its clients.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(_isExpanded ? 'Read Less' : 'Read More'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF3164F4),
              elevation: 8, // Add elevation for shadow effect
              shadowColor:
              Colors.black.withOpacity(0.5), // Set shadow color and opacity
            ),
            child: Text(
              'Courses',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Our Services',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4, // Adjust based on screen height
            child: PageView.builder(
              controller: _pageController,
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return _buildServiceCard(service.imagePath, service.title, service.description, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String imagePath, String title, String description, int index) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(ECommerce(), AnimationType.scale));
            break;
          case 1:
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(const WebsiteDesign(), AnimationType.scale));
            break;
          case 2:
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(const SeoOptimization(), AnimationType.scale));
            break;
          case 3:
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(const Designing(), AnimationType.scale));
            break;
          case 4:
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(const DigitalMarketing(), AnimationType.scale));
            break;
          case 5:
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(const CrmSolution(), AnimationType.scale));
            break;
          case 6:
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(const ConsultingService(), AnimationType.scale));
          case 7:
            Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(BusinessWebsites(), AnimationType.scale));
            break;

        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MouseRegion(
          onEnter: (_) => _onHoverEnter(index),
          onExit: (_) => _onHoverExit(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: _hoveredIndex == index
                ? Matrix4.translationValues(0, -10, 0)
                : Matrix4.identity(),
            child: Card(
              color: Colors.white,
              elevation: _hoveredIndex == index ? 12 : 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensures the card wraps tightly around the content
                  crossAxisAlignment: CrossAxisAlignment.center, // Centers the content
                  children: [
                    // Image container with dynamic size
                    Flexible(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2, // Image height relative to screen size
                        width: MediaQuery.of(context).size.height * 0.2,  // Square image
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain, // Ensures the image fits nicely
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Title Text
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),

                    // Description Text
                    if (description.isNotEmpty)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            description,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                            maxLines: 5, // Limit the description to avoid overflow
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildELearningSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // E-Learning Section Title
          Text(
            'E-Learning',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 16),

          // Grid of service cards with fixed height
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 cards in a row
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7, // Adjust to control the height of each card
            ),
            itemCount: 2, // Only show the first 2 items
            itemBuilder: (context, index) {
              final service = elearningServices[index];
              return _buildServiceCard(
                  service.imagePath, service.title, service.description, index);
            },
          ),
          const SizedBox(height: 16),

          // Paragraph
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Explore our e-learning courses designed to help you build essential skills for the future.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          // Enroll Now Button
          ElevatedButton(
            onPressed: () {
              // Navigate to e-learning enrollment
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF3164F4),
              elevation: 8, // Add elevation for shadow effect
              shadowColor: Colors.black.withOpacity(0.5), // Set shadow color and opacity
            ),
            child: Text(
              'Enroll Now',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const SizedBox(height: 16),

          // Remaining service cards
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7, // Ensure a fixed card size
            ),
            itemCount: elearningServices.length - 2, // Remaining items
            itemBuilder: (context, index) {
              final service = elearningServices[index + 2]; // Adjust index for remaining items
              return _buildServiceCard(
                  service.imagePath, service.title, service.description, index + 2);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExpertCard(String imagePath, String name, String post, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        onEnter: (_) => _onHoverEnter(index),
        onExit: (_) => _onHoverExit(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: _hoveredIndex == index
              ? Matrix4.translationValues(0, -10, 0)
              : Matrix4.identity(),
          child: Card(
            color: Colors.white,
            elevation: _hoveredIndex == index ? 12 : 6,
            child: Padding(
              padding: const EdgeInsets.all(12.0), // Added padding inside the card
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // CircleAvatar dynamically sized for responsiveness
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width < 600 ? 80 : 100, // Responsive avatar size
                    backgroundImage: AssetImage(imagePath),
                  ),
                  const SizedBox(height: 10), // Small space between avatar and text

                  // Name text
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5), // Reduced space

                  // Post text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      post,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 15), // Reduced space

                  // Dot indicators, centered
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(experts.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        height: currentPage == index ? 10.0 : 6.0,
                        width: currentPage == index ? 10.0 : 6.0,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? Colors.blueAccent
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpertsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Our Experts',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5, // Dynamically sized for responsiveness
            child: PageView.builder(
              controller: _pageController,
              itemCount: experts.length,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                final expert = experts[index];
                return _buildExpertCard(
                    expert.imagePath, expert.name, expert.post, index);
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildRemoteCareerSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Remote Career',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),

          // Subtitle
          Text(
            'Over 50+ employees working',
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),

          // The Paragraph with "Read More"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: Text(
                    'Discover endless opportunities with our curated list of remote jobs. Whether you\'re seeking flexibility, a better work-life balance, or exploring new career paths, find your dream job from the comfort of your home. Join the remote work revolution today!',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 3, // Show only 2 lines initially
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  secondChild: Text(
                    'Discover endless opportunities with our curated list of remote jobs. Whether you\'re seeking flexibility, a better work-life balance, or exploring new career paths, find your dream job from the comfort of your home. Join the remote work revolution today!',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(_isExpanded ? 'Read Less' : 'Read More'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Image
          Image.asset(
            'assets/Home_Remote.png',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16),

          // Apply Now Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle Apply Now button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF3164F4),
                elevation: 8, // Add elevation for shadow effect
                shadowColor:
                Colors.black.withOpacity(0.5), // Set shadow color and opacity
              ),
              child: Text(
                'Apply Now',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildgettingstarted(BuildContext context) {
    return Container(
      color: const Color(0xFF57A5F9), // Background color
      padding: const EdgeInsets.symmetric(
          vertical: 40.0, horizontal: 20.0), // Padding inside the container
      child: Column(
        mainAxisSize: MainAxisSize.min, // Keep column compact
        mainAxisAlignment: MainAxisAlignment.center, // Center content
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            'Start a Project with us Today',
            style: GoogleFonts.poppins(
              color: Colors.white, // Title color
              fontSize: 24.0, // Title font size
              fontWeight: FontWeight.bold, // Title font weight
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10), // Spacing between title and subtitle
          // Subtitle/Paragraph
          Text(
            'Call us now to schedule an online appointment and get your project successfully completed.',
            style: GoogleFonts.poppins(
              color: Colors.white, // Subtitle color
              fontSize: 16.0, // Subtitle font size
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20), // Spacing between subtitle and button
          // Button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(ContactFormPage(), AnimationType.scale));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4196f2), // Button color
              padding: const EdgeInsets.symmetric(
                  horizontal: 24.0, vertical: 12.0), // Button padding
              elevation: 8, // Add elevation for shadow effect
              shadowColor:
                  Colors.black.withOpacity(0.5), // Set shadow color and opacity
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Optional: Rounded corners
              ),
            ),
            child: Text(
              'Getting Started',
              style: GoogleFonts.poppins(
                color: Colors.white, // Button text color
                fontSize: 16.0, // Button text font size
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onHoverEnter(int index) {
    if (kIsWeb ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows) {
      setState(() {
        _hoveredIndex = index;
      });
    }
  }

  void _onHoverExit(int index) {
    if (kIsWeb ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows) {
      setState(() {
        _hoveredIndex = -1;
      });
    }
  }
}

class Service {
  final String imagePath;
  final String title;
  final String description;

  Service(this.imagePath, this.title, this.description);
}

class Expert {
  final String imagePath;
  final String name;
  final String post;

  Expert(
    this.imagePath,
    this.name,
    this.post,
  );
}
