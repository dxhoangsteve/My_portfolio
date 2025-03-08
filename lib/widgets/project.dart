import 'package:flutter/material.dart';
import 'package:portfolio/items/projectItems.dart';
import 'package:portfolio/styles/color.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProjectButton extends StatefulWidget {
  final ProjectItem project;
  final int index;

  const ProjectButton({
    Key? key,
    required this.project,
    required this.index,
  }) : super(key: key);

  @override
  State<ProjectButton> createState() => _ProjectButtonState();
}

class _ProjectButtonState extends State<ProjectButton> {
  bool isHovered = false;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launcher.launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () => _launchURL(widget.project.github),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: isHovered
              ? (Matrix4.identity()..translate(0, -8))
              : Matrix4.identity(),
          width: 320,
          height: 500,
          decoration: BoxDecoration(
            color: isHovered ? CustomColor.hoverColor : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? CustomColor.primary.withOpacity(0.2)
                    : Colors.black.withOpacity(0.05),
                blurRadius: isHovered ? 15 : 10,
                spreadRadius: isHovered ? 2 : 0,
                offset: const Offset(0, 5),
              ),
            ],
            border: isHovered
                ? Border.all(
                    color: CustomColor.primary.withOpacity(0.5), width: 1.5)
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project image header
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: CustomColor.primary.withOpacity(0.1),
                  child: Center(
                    child: Icon(
                      Icons.code,
                      size: 50,
                      color: CustomColor.primary.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              // Project content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.project.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.tittle,
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.hardEdge,
                              child: IconButton(
                                icon: const Icon(Icons.link),
                                color: CustomColor.primary,
                                onPressed: () =>
                                    _launchURL(widget.project.github),
                                iconSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildInfoRow(
                            Icons.work, 'Role: ${widget.project.role}'),
                        _buildInfoRow(
                            Icons.code, 'Tech: ${widget.project.tech}'),
                        _buildInfoRow(
                            Icons.build, 'Tools: ${widget.project.tools}'),
                        if (widget.project.features.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          const Text(
                            'Key Features:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.tittle,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...widget.project.features.map((feature) => Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      size: 14,
                                      color: CustomColor.primary,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        feature,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: CustomColor.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const ProjectCard(
      {Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
      constraints: BoxConstraints(
        minHeight: screenHeight * 0.9,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColor.projectBG,
            CustomColor.projectBG.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Dự án của tôi",
            style: TextStyle(
              color: CustomColor.tittle,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .moveY(begin: -20, end: 0),
          const SizedBox(height: 50),
          AnimationLimiter(
            child: LayoutBuilder(builder: (context, constraints) {
              final crossAxisCount =
                  screenWidth > 1200 ? 3 : (screenWidth > 800 ? 2 : 1);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 750),
                    columnCount: crossAxisCount,
                    delay: Duration(milliseconds: 150 * index),
                    child: SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: ProjectButton(
                          project: projects[index],
                          index: index,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
