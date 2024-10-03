import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialswirl/widgets/CareerSectionWidget.dart';
import 'package:socialswirl/widgets/TopBarDrawer.dart';
import 'package:socialswirl/widgets/bottom_navigation.dart';
import 'package:socialswirl/widgets/custom_page_route.dart';

import 'ContactUs.dart';
import 'E learning.dart';
import 'Services.dart';
import 'about us.dart';
import 'home_screen.dart';

class RemoteJobs extends StatefulWidget {
  const RemoteJobs({super.key});

  @override
  State<RemoteJobs> createState() => _RemoteJobsState();
}

class _RemoteJobsState extends State<RemoteJobs> {
  final List<Expert> experts = [
    Expert('assets/muaaz.png', 'Muaaz', 'Sales Executive'),
    Expert('assets/abdullah.png', 'Abdullah', 'Digital Marketer'),
    Expert('assets/awais.jpg', 'Awais', 'Senior SEO Developer'),
    Expert('assets/farrukh.webp', 'Farrukh', 'MERN Stack Developer'),
    Expert('assets/hammad.jpg', 'Hammad', 'Graphic Designer'),
    Expert('assets/zaid.jpg', 'Zaid', 'Social Media Marketer'),
  ];

  final List<Widget> _pages = [
    RemoteJobs(), // Index 1
    ServicesPage(), // Index 2
    Elearning(), // Index 3
    AboutUsPage(), // Index 4
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;
  late PageController _pageController;
  int currentPage = 0;
  int _hoveredIndex = -1;
  bool _isExpanded = false;
  int _currentIndex = 0;

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

  void _onHoverEnter(int index) {
    setState(() {
      _hoveredIndex = index;
    });
  }

  void _onHoverExit(int index) {
    setState(() {
      _hoveredIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    _buildRemoteCareerSection(context),
                    const CareerSectionWidget(),
                    _buildEmployeeSection(context),
                    _buildOurCertification(context),
                    _buildRemoteInternshipSection(context),
                    _buildgettingstarted(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemoteCareerSection(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Work with us Remotely',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),

          // Subtitle
          Text(
            'Over 50+ employees working',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Colors.blue[800]),
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
                    'Work remotely with us and discover many options like Frontend, Backend, SEO, Human Resource, Graphic Designing and Social Media Marketing. Join us to unleash your potential and make a difference.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  secondChild: Text(
                    'Work remotely with us and discover many options like Frontend, Backend, SEO, Human Resource, Graphic Designing and Social Media Marketing. Join us to unleash your potential and make a difference.',
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
          // Apply Now Button
          Padding(
            padding: const EdgeInsets.all(
                8.0), // Reduced padding for more horizontal space
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1, // Adjust the size proportionally
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Apply Now button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF3164F4),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16), // Reduced padding
                    ),
                    child: FittedBox(
                      // FittedBox ensures text stays within the button
                      child: Text(
                        'Remote Job',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Reduced space between buttons
                Expanded(
                  flex: 1, // Adjust the size proportionally
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Apply Now button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF3164F4),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16), // Reduced padding
                    ),
                    child: FittedBox(
                      child: Text(
                        'Remote Internship',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Image
          Builder(
            builder: (context) {
              try {
                return Image.asset(
                  'assets/Remote Page Images.jpg',
                  fit: BoxFit.fitWidth,
                  width: screenWidth,
                );
              } catch (e) {
                return Center(
                  child: Text(
                    'Failed to load image',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.red),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Current Employee',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.5, // Dynamically sized for responsiveness
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

  Widget _buildExpertCard(
      String imagePath, String name, String post, int index) {
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
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double avatarRadius = constraints.maxWidth < 600
                          ? 60
                          : 100; // More responsive sizing
                      return CircleAvatar(
                        radius: avatarRadius,
                        backgroundImage: AssetImage(imagePath),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.width < 600 ? 16 : 20,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      post,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 600
                                ? 14
                                : 16,
                          ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(experts.length, (dotIndex) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        height: currentPage == dotIndex ? 10.0 : 6.0,
                        width: currentPage == dotIndex ? 10.0 : 6.0,
                        decoration: BoxDecoration(
                          color: currentPage == dotIndex
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

  Widget _buildOurCertification(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Overall padding around the content
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center content horizontally
        children: [
          // Title
          Text(
            'Our Certification',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16), // Space between title and description

          // Description
          Text(
            'At Social Swirl, our internship program has been providing valuable industry experience since 2021. '
            'Our certification is recognized for its comprehensive training and practical exposure to real-world projects. '
            'Interns gain hands-on experience with cutting-edge technologies, making our certificate a testament to their skills and dedication. '
            'This valuable credential significantly enhances career prospects and professional growth.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24), // Space between description and image

          // Image Section
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the certificate card
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow effect
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/Remote Jobs/certificates.png', // Replace with your image path
                fit: BoxFit.cover, // Make the image cover its container
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRemoteInternshipSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Remote Internships',
            style: Theme.of(context).textTheme.displayLarge,
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
                    'Explore Social Swirl\'s internship program for a chance to gain hands-on experience, develop your skills in a dynamic environment, and work on real-world projects. Enhance your career prospects with our comprehensive and supportive training.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 3, // Show only 2 lines initially
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  secondChild: Text(
                    'Explore Social Swirl\'s internship program for a chance to gain hands-on experience, develop your skills in a dynamic environment, and work on real-world projects. Enhance your career prospects with our comprehensive and supportive training.',
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
            'assets/Remote Jobs/apply.png',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 10),

          // Apply Now Button
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF3164F4),
                elevation: 8, // Add elevation for shadow effect
                shadowColor: Colors.black
                    .withOpacity(0.5), // Set shadow color and opacity
              ),
              child: Text(
                'Get Started',
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
              Navigator.of(context).push(AnimatedPageRoute.getAnimatedPageRoute(
                  ContactFormPage(), AnimationType.scale));
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
}

class Expert {
  final String imagePath;
  final String name;
  final String post;

  Expert(this.imagePath, this.name, this.post);
}
