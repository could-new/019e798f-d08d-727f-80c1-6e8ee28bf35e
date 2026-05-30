import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mechanical Engineer Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2C3E50), // Sleek, professional dark blue
          primary: const Color(0xFF2C3E50),
          secondary: const Color(0xFFE67E22), // Accent orange (industrial feel)
          background: const Color(0xFFF8F9FA),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ResumeScreen(),
      },
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 850) {
              return _buildDesktopLayout(context, constraints);
            } else {
              return _buildMobileLayout(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, BoxConstraints constraints) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: _SidebarContent(),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 2,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: _MainContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                textTheme: Theme.of(context).textTheme.apply(
                      bodyColor: Colors.white,
                      displayColor: Colors.white,
                    ),
                iconTheme: const IconThemeData(color: Colors.white70),
              ),
              child: _SidebarContent(isMobile: true),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: _MainContent(),
          ),
        ],
      ),
    );
  }
}

class _SidebarContent extends StatelessWidget {
  final bool isMobile;

  const _SidebarContent({this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    final color = isMobile ? Colors.white : Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            child: Icon(
              Icons.engineering,
              size: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            'Alex Carter',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Mechanical Engineer',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
          ),
        ),
        const SizedBox(height: 32),
        _buildContactInfo(Icons.email_outlined, 'alex.carter@example.com'),
        const SizedBox(height: 12),
        _buildContactInfo(Icons.phone_outlined, '+1 (555) 123-4567'),
        const SizedBox(height: 12),
        _buildContactInfo(Icons.location_on_outlined, 'San Francisco, CA'),
        const SizedBox(height: 12),
        _buildContactInfo(Icons.link, 'linkedin.com/in/alexcarter-mech'),
        const SizedBox(height: 32),
        Text(
          'CORE SKILLS',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: isMobile ? Colors.white70 : Colors.grey[600],
              ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildSkillChip('SolidWorks', context, isMobile),
            _buildSkillChip('AutoCAD', context, isMobile),
            _buildSkillChip('ANSYS (FEA/CFD)', context, isMobile),
            _buildSkillChip('GD&T', context, isMobile),
            _buildSkillChip('DFM / DFA', context, isMobile),
            _buildSkillChip('Rapid Prototyping', context, isMobile),
            _buildSkillChip('Thermodynamics', context, isMobile),
            _buildSkillChip('Python / MATLAB', context, isMobile),
          ],
        ),
      ],
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String label, BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isMobile
            ? Colors.white.withOpacity(0.2)
            : Theme.of(context).colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isMobile
              ? Colors.white30
              : Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isMobile ? Colors.white : Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('PROFESSIONAL SUMMARY', context),
        const SizedBox(height: 16),
        const Text(
          'Innovative Mechanical Engineer with over 5 years of experience in product design, 3D CAD modeling, and advanced manufacturing processes. Proven track record of optimizing complex mechanical assemblies for manufacturability (DFM) and cost efficiency. Strong background in thermal dynamics, structural analysis (FEA), and leading cross-functional engineering teams from concept to production.',
          style: TextStyle(fontSize: 15, height: 1.6),
        ),
        const SizedBox(height: 32),
        _buildSectionTitle('EXPERIENCE', context),
        const SizedBox(height: 24),
        _buildExperienceItem(
          context,
          title: 'Senior Mechanical Engineer',
          company: 'Nexus Robotics',
          date: 'Jan 2023 - Present',
          description:
              '• Lead the mechanical design of robotic end-effectors for industrial automation, reducing manufacturing costs by 15%.\n'
              '• Conduct extensive thermal and stress analysis using ANSYS to ensure reliability under high-load conditions.\n'
              '• Collaborate with electrical engineers and software developers to integrate sensors and actuators seamlessly.',
        ),
        const SizedBox(height: 24),
        _buildExperienceItem(
          context,
          title: 'Mechanical Designer',
          company: 'Apex Industrial Solutions',
          date: 'Jun 2020 - Dec 2022',
          description:
              '• Designed advanced HVAC systems and custom sheet metal enclosures using SolidWorks.\n'
              '• Created detailed 2D engineering drawings with rigorous GD&T standards for overseas manufacturers.\n'
              '• Managed rapid prototyping cycles using SLA and FDM 3D printing technologies to validate ergonomic designs.',
        ),
        const SizedBox(height: 32),
        _buildSectionTitle('EDUCATION', context),
        const SizedBox(height: 24),
        _buildExperienceItem(
          context,
          title: 'B.S. in Mechanical Engineering',
          company: 'State University College of Engineering',
          date: 'Aug 2016 - May 2020',
          description:
              '• GPA: 3.8/4.0 | Dean\\'s List\n'
              '• Senior Capstone: Designed and built an automated fluid mixing system for small-scale chemical processing.\n'
              '• Extracurriculars: Baja SAE Team Lead (Chassis and Suspension Design).',
        ),
        const SizedBox(height: 32),
        _buildSectionTitle('NOTABLE PROJECTS', context),
        const SizedBox(height: 24),
        _buildProjectItem(
          context,
          title: 'Automated Assembly Line Refit',
          description: 'Spearheaded a complete mechanical redesign of a legacy conveyor system, improving throughput by 22% and reducing maintenance downtime by 30%.',
        ),
        const SizedBox(height: 16),
        _buildProjectItem(
          context,
          title: 'Baja SAE Suspension Optimization',
          description: 'Engineered a custom double A-arm front suspension system. Reduced unsprung mass by 10% while increasing travel and shock absorption capabilities.',
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 3,
          width: 40,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }

  Widget _buildExperienceItem(
    BuildContext context, {
    required String title,
    required String company,
    required String date,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    company,
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: const TextStyle(fontSize: 14, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildProjectItem(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.precision_manufacturing, size: 20, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }
}
