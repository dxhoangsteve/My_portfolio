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
      name: "Restaurant Management | 2023",
      role: "Member (3 members), UI/UX Designer, Backend Developer, QA/QC",
      tech:
          "Languages and Frameworks: C#, MSSQL, WinForms, Synfusion for Windows Form",
      tools: "Tools: Github",
      github: "https://github.com/dxhoangsteve/Winform_programming_project",
      features: []),
  ProjectItem(
      name: "Phoneshop | 2025",
      role: "Member (3 members), UI/UX Designer, Backend Developer, QA/QC",
      tech: "Languages and Frameworks: Flutter, Express.js, MySQL",
      tools: "Tools: GitHub, Android Studio, MySQL Workbench",
      github: "https://github.com/TQBao2ca3/DoAnLapTrinhDiDong",
      features: [
        "Product Management: Display product lists, view details, and add items to the cart",
        "Order Processing: Manage cart items, adjust quantities, and complete payments",
        "User Profile Management: Update personal information and track order history",
        "Payment Integration: Support multiple payment methods for seamless checkout"
      ]),
  ProjectItem(
      name: "Control ESP8266 with telegram bot via mqtt | 2025",
      role: "Personal project",
      tech: "Languages and Frameworks: C++, Python",
      tools: "Tools: GitHub, Platformio, mosquitto, MQTT explorer",
      github: "https://github.com/dxhoangsteve/ESP8266_MQTT",
      features: [
        "Built a system to control IoT devices (ESP8266) via MQTT protocol and Telegram bot",
        "Enabled real-time communication for device control and status updates",
        "Ensured secure and efficient message publishing/subscribing through MQTT broker"
      ]),
];
