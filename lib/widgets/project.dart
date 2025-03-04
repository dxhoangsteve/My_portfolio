import 'package:flutter/material.dart';
import 'package:portfolio/items/projectItems.dart';
import 'package:portfolio/styles/color.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ProjectButton extends StatefulWidget {
  final ProjectItem project;

  const ProjectButton({
    Key? key,
    required this.project,
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
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isHovered ? CustomColor.hoverColor : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.project.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.tittle,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Role: ${widget.project.role}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tech: ${widget.project.tech}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tools: ${widget.project.tools}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              if (widget.project.features.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  'Key Features:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                ...widget.project.features.map((feature) => Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                      child: Text(
                        '• $feature',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    )),
              ],
            ],
          ),
        ),
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
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        constraints: BoxConstraints(
          minHeight: screenHeight * 0.9,
        ),
        decoration: const BoxDecoration(
          color: CustomColor.projectBG,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Dự án của mình",
                style: TextStyle(
                  color: CustomColor.tittle,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              children: [
                for (var project in projects) ProjectButton(project: project),
              ],
            ),
          ],
        ));
  }
}
