import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ContactUs.dart';
import '../home_screen.dart';
import '../widgets/TopBarDrawer.dart';
import '../widgets/custom_page_route.dart';

// Service description provider (dummy state for demonstration)
final serviceDescriptionProvider = Provider<String>((ref) {
  return 'Unlock the full potential of digital marketing with personalized campaigns that speak directly to your audience. Using advanced targeting and automation, we create meaningful connections that drive conversions and foster brand loyalty.';
});

class DigitalMarketing extends ConsumerWidget {
  const DigitalMarketing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceDescription = ref.watch(serviceDescriptionProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0,
                    horizontal: 20.0), // Padding inside the container
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Keep column compact
                  mainAxisAlignment: MainAxisAlignment.center, // Center content
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Digital Marketing',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                        height: 10), // Spacing between title and subtitle
                    Text(
                      'Expand your digital footprint and connect with your target audience through strategic digital marketing campaigns.',
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
              const SizedBox(
                height: 16,
              ),
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

  const ServiceDescriptionSection({super.key, required this.serviceDescription});

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
                            'assets/digitalmarketing.jpg',
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
                            _buildBulletPoint(
                                context, 'Social media strategy and management'),
                            _buildBulletPoint(
                                context, 'Paid advertising (PPC)'),
                            if (constraints.maxHeight < imageHeight) ...[
                              // Move the remaining points below if they don't fit next to the image
                              const SizedBox(height: 16),
                              _buildBulletPoint(
                                  context, 'Content creation and marketing'),
                              _buildBulletPoint(
                                  context, 'Email marketing campaigns'),
                              _buildBulletPoint(
                                  context, 'Analytics and performance tracking'),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),

                  // If there's enough space, show the remaining bullet points under the image
                  if (constraints.maxHeight >= imageHeight) ...[
                    const SizedBox(height: 16),
                    _buildBulletPoint(context, 'Content creation and marketing'),
                    _buildBulletPoint(context, 'Email marketing campaigns'),
                    _buildBulletPoint(context, 'Analytics and performance tracking'),
                  ],
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          _buildSection(context, 'Benefits', [
            'Enhanced Brand Awareness: Increase your brand\'s visibility and reach a wider audience through targeted digital marketing campaigns.',
            'Multi-Channel Engagement: Engage customers across multiple digital channels, including social media, email, and search, for maximum impact',
            'Measurable Results: Track and analyze campaign performance in real-time, allowing for data-driven optimization and improved ROI.',
            'Customer Relationship Building: Foster meaningful connections with your audience through personalized content and interactions, driving loyalty and advocacy',
            'Scalable Solutions: Scale your digital marketing efforts according to your budget and business goals, maximizing your return on investment..',
            'Competitive Edge: Stay ahead of competitors with innovative digital marketing strategies that captivate audiences and drive business growth.',
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
