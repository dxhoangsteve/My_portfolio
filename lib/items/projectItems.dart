class ProjectItem {
  final String name;
  final String role;
  final String tech;
  final String tools;
  final String github;
  final List<String> features;

  ProjectItem(
      {required this.name,
      required this.role,
      required this.tech,
      required this.tools,
      required this.github,
      required this.features});
}

List<ProjectItem> projects = [
  ProjectItem(
      name: "THE AZURE HOTEL MANAGEMENT APP | 2024",
      role: "Team Leader (3 members), UI/UX Designer, Backend Developer, QA/QC",
      tech:
          "Languages and Frameworks: C#, MSSQL, WinForms, Synfusion for Windows Form",
      tools: "Tools: Github, Trello, Figma",
      github:
          "https://github.com/phamanhtuan-coder/The-Azure-Hotel-Management-App",
      features: [
        "Guest Management: Manage guest information, including check-in and check-out processes",
        "Room Management: Oversee room availability, assignments, and status updates",
        "Booking System: Handle reservations and cancellations efficiently",
        "Billing: Generate invoices and manage payments",
        "Reporting: Create various reports for analysis and decision-making"
      ]),
  ProjectItem(
      name: "My Portfolio Web App | 2024",
      role: "Personal Project, Full-Stack",
      tech:
          "Languages and Frameworks: Dart, Firebase, Flutter, Synfusion for Dart",
      tools: "Tools: Github, Trello, Figma",
      github: "https://github.com/phamanhtuan-coder/dart_my_portfolio",
      features: []),
  ProjectItem(
      name:
          "E-commerce Mobile Application For Selling Technology Products | 2024-2025 (Working)",
      role: "Leader (Team of 4), UI/UX Designer, Backend, QA/QC",
      tech:
          "Languages and Frameworks: Kotlin, Firebase, Sqlite, Jetpack Compose",
      tools: "Tools: Github, Trello, Jira, Slack, Figma, Notion",
      github: "Work in progress",
      features: []),
];
