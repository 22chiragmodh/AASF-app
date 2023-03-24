class ConstantsVar {
  static List<String> timelinetextlist = [
    "Timeline",
    "May",
    "June",
    "July",
    "Augest",
    "September",
    "October",
    "November",
    "December",
    "January",
    "February",
    "March",
    "April"
  ];

  static List<String> hometextlist = [
    "All",
    "Events",
    "Abhishar",
    "Blogs",
  ];
  static Map<String, List> monthEventslist = {
    "May": [
      "Technical Blog Writing",
      "JPC 3",
      "Jest a Minute",
      "Web Week: Backend",
      "Demystifying Blockchain",
      "Unravelling Reseach",
    ],
    "June": [
      "JPC 3",
      "Jest a Minute",
      "Web Week: Backend",
      "Demystifying Blockchain",
      "Unravelling Reseach",
    ],
    "Augest": [
      "Technical Blog Writing",
      "Web Week: Backend",
    ],
    "September": [],
    "July": [],
    "October": [],
    "November": [],
    "December": [],
    "January": [],
    "February": [],
    "March": [],
    "April": [],
    "Timeline": [],
  };

  static Map<String, dynamic> studentData = {};
  static Map<String, dynamic> eventData = {};

  static String url = "http://192.168.64.185:3000";
}
