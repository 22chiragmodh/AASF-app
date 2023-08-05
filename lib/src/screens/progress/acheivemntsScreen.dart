import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/appwinningcard.dart';
import 'package:flutter/material.dart';

class WinningTabScreen extends StatelessWidget {
  Future<List<dynamic>> achievementsDataFuture;

  WinningTabScreen({
    Key? key,
    required this.achievementsDataFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: achievementsDataFuture,
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting &&
              dataSnapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (dataSnapshot.hasError) {
            return Center(
              child: Text('User Data Error: ${dataSnapshot.error}'),
            );
          } else if (dataSnapshot.hasData && dataSnapshot.data!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/Asset 2 1.png'),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text('Keep Trying',
                    style: Textstyle.winningtext(Appcolors.yew(), 22.0))
              ],
            );
          } else {
            if (dataSnapshot.data != null) {
              final data = dataSnapshot.data!;

              return ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child:
                        Image(image: AssetImage('assets/images/Asset 2 1.png')),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return AppWinningCard(
                          eventname: data[index]['event']['name'],
                          imgurl: data[index]['position'] == 1
                              ? 'assets/images/Asset 1.png'
                              : data[index]['position'] == 2
                                  ? 'assets/images/Asset 2.png'
                                  : 'assets/images/Asset 3.png');
                    },
                  ),
                  // Row(
                  //   children: const [
                  //     AppWinningCard(
                  //         eventname: 'Webkriti',
                  //         imgurl: 'assets/images/Asset 2.png'),
                  //     AppWinningCard(
                  //         eventname: 'Jest a Minute',
                  //         imgurl: 'assets/images/Asset 3.png'),
                  //   ],
                  // ),
                  // Row(
                  //   children: const [
                  //     AppWinningCard(
                  //         eventname: 'JPC-I',
                  //         imgurl: 'assets/images/Asset 1.png'),
                  //   ],
                  // ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        });
  }
}
