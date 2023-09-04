import 'package:aasf_iiitmg/src/widgets/appprogressindicator.dart';
import 'package:aasf_iiitmg/src/widgets/appstatscard.dart';
import 'package:flutter/material.dart';

class StatsTabScreen extends StatelessWidget {
  final Future<Map<String, dynamic>> userDataFuture;
  final Future<List<dynamic>> statiticsDataFuture;
  const StatsTabScreen(
      {Key? key,
      required this.userDataFuture,
      required this.statiticsDataFuture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: userDataFuture,
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting &&
              userSnapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (userSnapshot.hasError) {
            return Center(
              child: Text('User Data Error: ${userSnapshot.error}'),
            );
          } else {
            final userData = userSnapshot.data!;
            return FutureBuilder<List<dynamic>>(
              future: statiticsDataFuture,
              builder: (context, snapshotData) {
                if (snapshotData.connectionState == ConnectionState.waiting &&
                    snapshotData.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshotData.hasError) {
                  return Center(
                    child: Text('Data Error: ${snapshotData.error}'),
                  );
                } else if (snapshotData.hasData && snapshotData.data!.isEmpty) {
                  return const Center(
                      child: Text("No Statistics Data Available!"));
                } else {
                  if (snapshotData.data != null) {
                    final statiticsData = snapshotData.data!;
                    return ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 292,
                          height: 121,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppProgressIndicator(
                                percent: (userData['technical_score'] == 0 &&
                                            userData['final_score'] == 0) ||
                                        (userData['technical_score'] == null ||
                                            userData['final_score'] == null)
                                    ? 0
                                    : (userData['technical_score'] /
                                            userData['final_score'] *
                                            100.0)
                                        .toInt(),
                                title: 'Technical',
                              ),
                              AppProgressIndicator(
                                percent: (userData['managerial_score'] == 0 &&
                                            userData['final_score'] == 0) ||
                                        (userData['technical_score'] == null ||
                                            userData['final_score'] == null)
                                    ? 0
                                    : (userData['managerial_score'] /
                                            userData['final_score'] *
                                            100.0)
                                        .toInt(),
                                title: 'Managerial',
                              ),
                              AppProgressIndicator(
                                percent: (userData['oratory_score'] == 0 &&
                                            userData['final_score'] == 0) ||
                                        (userData['technical_score'] == null ||
                                            userData['final_score'] == null)
                                    ? 0
                                    : (userData['oratory_score'] /
                                            userData['final_score'] *
                                            100.0)
                                        .toInt(),
                                title: 'Oratory',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            for (var data in statiticsData)
                              for (var subEvent in data['sub_events'])
                                AppStatsCard(
                                  pa: subEvent['attendance'].length == 0
                                      ? false
                                      : true,
                                  eventname: data['name'],
                                  day: subEvent['day'] as int,
                                ),
                          ],
                        )
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
              },
            );
          }
        });
  }
}
