import 'package:aasf_iiitmg/src/controller/eventsData.dart';
import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';

import 'package:intl/intl.dart';
import 'package:aasf_iiitmg/src/widgets/appabhishar.dart';
import 'package:aasf_iiitmg/src/widgets/appbottomappbar.dart';
import 'package:aasf_iiitmg/src/widgets/appdrawer.dart';
import 'package:aasf_iiitmg/src/widgets/apptabbar.dart';
import 'package:aasf_iiitmg/src/widgets/appevents.dart';
import 'package:aasf_iiitmg/src/widgets/appblogs.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  String? authToken;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController?.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primarycolor(),
      appBar: BaseStyle.appbar(
        context: context,
        backbtn: true,
      ),
      endDrawer: const AppDrawer(),
      bottomNavigationBar: const AppBottomAppbar(),
      body: Column(
        children: [
          AppTabBar(
            screenmode: true,
            isiscrollable: false,
            tabController: _tabController,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FutureBuilder<List<dynamic>>(
                  future: EventDeatils.fetchEventsData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error: Failed to fetch data'),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Asset 1 2 (1).png'),
                            const SizedBox(height: 10),
                            const Text('No events available'),
                          ],
                        ),
                      );
                    } else {
                      // Check if data is already stored in local storage
                      if (snapshot.data != null) {
                        return eventsTag(_tabController!, snapshot.data ?? []);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                  },
                ),
                FutureBuilder<List<dynamic>>(
                  future: EventDeatils.fetchBlogsData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text('Error: Failed to fetch data'));
                    } else {
                      // Check if data is already stored in local storage
                      if (snapshot.data != null) {
                        return blogsTag(_tabController!, snapshot.data ?? []);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                  },
                ),
                FutureBuilder<List<dynamic>>(
                  future: EventDeatils.fetchAbhisharData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text('Error: Failed to fetch data'));
                    } else {
                      // Check if data is already stored in local storage
                      if (snapshot.data != null) {
                        return abhisharTag(
                            _tabController!, snapshot.data ?? []);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget eventsTag(TabController tabController, List<dynamic> eventData) {
  return ListView.builder(
    itemCount: eventData.length,
    itemBuilder: (context, index) {
      Map<String, dynamic> event = eventData[index];

      // Parse the start date string

      var parsedstartDate =
          DateFormat('yyyy-MM-ddTHH:mm:ss').parse(event['start_date']);
      var startDate = DateFormat("dd MM yy HH:mm")
          .format(parsedstartDate); // Use 'HH' for 24-hour format
      List<String> dateTimeParts = startDate.split(" ");

      String sdate =
          "${dateTimeParts[0]}/${dateTimeParts[1]}/${dateTimeParts[2]}";
      String stime = dateTimeParts[3];

      var parsedendDate =
          DateFormat('yyyy-MM-ddTHH:mm:ss').parse(event['end_date']);
      var endDate = DateFormat("dd MM yy HH:mm")
          .format(parsedendDate); // Use 'HH' for 24-hour format
      List<String> enddateTimeParts = endDate.split(" ");

      String edate =
          "${enddateTimeParts[0]}/${enddateTimeParts[1]}/${enddateTimeParts[2]}";
      String etime = " ${enddateTimeParts[3]}";

      // List<dynamic> eventImages = event["event_images"];
      // String posterUrl =
      //     eventImages.isNotEmpty ? eventImages[0]['image_url'] : '';

      return
          // Display the event widget
          AppHomeEvents(
              // eventTitle: "Events",
              iconUrl: 'assets/images/register.svg',
              icontitle: 'Register',
              event: event,
              // posterUrl: posterUrl,
              tabController: tabController,
              startdate: sdate,
              enddate: edate,
              starttime: stime,
              endtime: etime);
    },
  );
}

Widget blogsTag(TabController tabController, List<dynamic> blogsData) {
  return ListView.builder(
      itemCount: blogsData.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> blog = blogsData[index];

        return AppHomeBlogs(
          blog: blog,
          // eventTitle: "Online Card Transactions",
          // posterUrl: 'assets/images/Pic (1).png',
          tabController: tabController, posterUrl: 'assets/images/Pic (1).png',
        );
      });
}

Widget abhisharTag(TabController tabController, List<dynamic> abhisharData) {
  return ListView.builder(
      itemCount: abhisharData.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> abhishar = abhisharData[index];

        return AppAbhishar(tabController: tabController, abhishar: abhishar);
      });
}















// class HomePage extends StatefulWidget {
//   final String authToken;
//   const HomePage({super.key, required this.authToken});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   TabController? _tabController;
//   List<dynamic> eventData = [];
//   List<dynamic> blogsData = [];
//   List<dynamic> abhisharData = [];

//   Future<void> fetchEventsData() async {
//     try {
//       // Create a Dio instance
//       Dio dio = Dio();

//       // Make the HTTP request
//       Response response = await dio.get("${ConstantsVar.url}/events");

//       // Return the response data
//       Map<String, dynamic> responseData = response.data;
//       if (responseData['success'] == 1) {
//         eventData = responseData['data'];
//         // print(eventData);
//       }
//     } catch (e) {
//       // Handle any errors

//       print(e.toString());
//       print('Error: Failed to fetch data');
//     }
//   }

//   Future<void> fetchBlogsData() async {
//     try {
//       // Create a Dio instance
//       Dio dio = Dio();

//       // Make the HTTP request
//       Response response = await dio.get("${ConstantsVar.url}/blogs");

//       // Return the response data
//       Map<String, dynamic> responseData = response.data;
//       if (responseData['success'] == 1) {
//         blogsData = responseData['data']['items'];
//       }
//       print(response.data);
//       print(blogsData);
//     } catch (e) {
//       // Handle any errors
//       print(e.toString());
//       print('Error: Failed to fetch data');
//     }
//   }

//   Future<void> fetchAbhisharData() async {
//     try {
//       // Create a Dio instance
//       Dio dio = Dio();

//       // Make the HTTP request
//       Response response = await dio.get("${ConstantsVar.url}/abhishar");

//       // Return the response data
//       Map<String, dynamic> responseData = response.data;
//       if (responseData['success'] == 1) {
//         abhisharData = responseData['data'];
//       }

//       print(abhisharData);
//     } catch (e) {
//       // Handle any errors
//       print(e.toString());
//       print('Error: Failed to fetch data');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(vsync: this, length: 3);
//     _tabController?.addListener(_handleTabSelection);
//     fetchEventsData();
//     fetchBlogsData();
//     fetchAbhisharData();
//   }

//   void _handleTabSelection() {
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     _tabController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolors.primarycolor(),
//       appBar: BaseStyle.appbar(
//         context: context,
//         backbtn: true,
//       ),
//       endDrawer: const AppDrawer(),
//       bottomNavigationBar: AppBottomAppbar(
//         token: widget.authToken,
//       ),
//       body: Column(
//         children: [
//           AppTabBar(
//               screenmode: true,
//               isiscrollable: false,
//               tabController: _tabController),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 // allTag(_tabController!),
//                 eventsTag(_tabController!, eventData),
//                 blogsTag(_tabController!, blogsData),
//                 abhisharTag(_tabController!, abhisharData),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }