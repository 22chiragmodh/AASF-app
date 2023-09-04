import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:aasf_iiitmg/src/widgets/appleaderboardcard.dart';
import 'package:aasf_iiitmg/src/widgets/appstackimage.dart';
import 'package:flutter/material.dart';

class LeaderboardTabScreen extends StatelessWidget {
  final Future<List<dynamic>> dataFuture;
  final Future<Map<String, dynamic>> userdataFuture;

  const LeaderboardTabScreen({
    Key? key,
    required this.dataFuture,
    required this.userdataFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: dataFuture,
      builder: (context, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting &&
            dataSnapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (dataSnapshot.hasError) {
          return Center(
            child: Text('Data Error: ${dataSnapshot.error}'),
          );
        } else if (dataSnapshot.data!.isEmpty && dataSnapshot.hasData) {
          return const Center(child: Text("No Leaderboard data available"));
        } else {
          final data = dataSnapshot.data!;

          return FutureBuilder<Map<String, dynamic>>(
            future: userdataFuture,
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting &&
                  dataSnapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (userSnapshot.hasError) {
                return Center(
                  child: Text('User Data Error: ${userSnapshot.error}'),
                );
              } else if (userSnapshot.hasData &&
                  userSnapshot.data!.isNotEmpty) {
                final userData = userSnapshot.data!;

                return ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    AppStackedImages(data: data),
                    AppVerifyTextField(
                      padding: const EdgeInsets.only(left: 25, top: 20),
                      text: 'Your Rank',
                      text1: '',
                      textstyle: Textstyle.inputtext(
                        Appcolors.white(),
                        15.0,
                        FontWeight.w400,
                      ),
                      textalign: TextAlign.left,
                    ),
                    AppLeadrboardCard(
                      rank: userData['ranking'].toString(),
                      name:
                          '${userData["first_name"]} ${userData["last_name"]}',
                      score: userData['final_score'] ?? 0,
                      imgUrl: userData['image'],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BaseStyle.linealignment(1.5),
                    ),
                    AppVerifyTextField(
                      padding: const EdgeInsets.only(left: 25, top: 2),
                      text: 'Overall Ranking',
                      text1: '',
                      textstyle: Textstyle.inputtext(
                        Appcolors.white(),
                        15.0,
                        FontWeight.w400,
                      ),
                      textalign: TextAlign.left,
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          data.length - 3,
                          (index) => AppLeadrboardCard(
                            imgUrl: data[index + 3]['image'],
                            rank: data[index + 3]['ranking'].toString(),
                            name:
                                "${data[index + 3]['first_name']} ${data[index + 3]['last_name']}",
                            score: data[index + 3]['final_score'] ?? 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        }
      },
    );
  }
}
