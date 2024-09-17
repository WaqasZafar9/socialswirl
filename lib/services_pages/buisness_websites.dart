import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ContactUs.dart';
import '../home_screen.dart';
import '../widgets/TopBarDrawer.dart';
import '../widgets/custom_page_route.dart';

// Service description provider (dummy state for demonstration)
final serviceDescriptionProvider = Provider<String>((ref) {
  return 'Elevate your online presence with a business website that grows with you.'
      'Our scalable solutions are designed to adapt to your evolving needs, providing the flexibility  '
      ' and power you need to thrive in the digital landscape.';
});

class BusinessWebsites extends ConsumerWidget {
   BusinessWebsites({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceDescription = ref.watch(serviceDescriptionProvider);

    return Scaffold(key: _scaffoldKey,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First container with title and subtitle
              Container(
                color: const Color(0xFF57A5F9), // Background color
                padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0), // Padding inside the container
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Keep column compact
                  mainAxisAlignment: MainAxisAlignment.center, // Center content
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Business websites',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10), // Spacing between title and subtitle
                    Text(
                      'Power up your business with custom-designed websites engineered for success in the digital arena.',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ServiceDescriptionSection(
                    serviceDescription: serviceDescription),
              ),
              SizedBox(height: 16,),
              _buildgettingstarted(context),
            ],
          ),
        ),
      ),
    );
  }
}

// The service description layout
class ServiceDescriptionSection extends StatelessWidget {
  final String serviceDescription;

  const ServiceDescriptionSection({required this.serviceDescription});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Description',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            serviceDescription, // Dynamic data from Riverpod
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.black87,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),

          // Row with image on the left and bullet points on the right
          LayoutBuilder(
            builder: (context, constraints) {
              final double imageHeight = screenSize.width * 0.5;
              final double imageWidth = screenSize.width * 0.5;

              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Container (Left side)
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            'assets/BusinessWebsites.jpg',
                            fit: BoxFit.cover,
                            height: imageHeight,
                            width: imageWidth,
                          ),
                        ),
                      ),
                      const SizedBox(width: 11),

                      // Bullet Points (Right side)
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBulletPoint(context, 'Professional and polished design'),
                            _buildBulletPoint(context, 'SEO-optimized structure'),
                            if (constraints.maxHeight < imageHeight) ...[
                              // Move the remaining points below if they don't fit next to the image
                              const SizedBox(height: 16),
                              _buildBulletPoint(context, 'Integration with business tools'),
                              _buildBulletPoint(context, 'Secure payment gateways'),
                              _buildBulletPoint(context, 'Analytics and reporting'),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),

                  // If there's enough space, show the remaining bullet points under the image
                  if (constraints.maxHeight >= imageHeight) ...[
                    const SizedBox(height: 16),
                    _buildBulletPoint(context, 'Integration with business tools'),
                    _buildBulletPoint(context, 'Secure payment gateways'),
                    _buildBulletPoint(context, 'Analytics and reporting'),
                  ],
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          _buildSection(context, 'Benefits', [
            'Professional Image: Impress clients and prospects with a polished and professional online presence that reflects your brand\'s credibility.',
            'Lead Generation: Capture leads effortlessly with strategically placed calls-to-action and lead generation forms, driving business growth.',
            'Competitive Edge: Stand out from competitors with unique features and functionalities tailored to your industry and target audience..',
            'Streamlined Operations: Automate processes and integrate tools for seamless workflow management, improving efficiency and productivity.',
            'Analytics and Insights: Gain valuable insights into user behavior and website performance through advanced analytics, informing data-driven decisions.',
            'Ongoing Support: Receive dedicated support and maintenance services to keep your website running smoothly and secure against threats.',
          ]),
        ],
      ),
    );
  }

  // Widget to build a bullet point with a checkmark and text
  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 24,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build a section with title and list of items
  Widget _buildSection(BuildContext context, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        ...items.map((item) => _buildBenefitPoint(context, item)).toList(),
      ],
    );
  }

  // Widget to build a benefit point
  Widget _buildBenefitPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ', // Bullet point symbol
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
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