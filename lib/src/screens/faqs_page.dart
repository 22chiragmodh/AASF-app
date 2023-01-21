import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppFaqsDragdown.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';

class FaqsPage extends StatelessWidget {
  const FaqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolors.primarycolor(),
        appBar:
            BaseStyle.appbar(backbtn: false, title: "FAQs", context: context),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 314,
              height: 209,
              child: Image.asset('assets/images/FAQs-cuate 1.png'),
            ),
            AppVerifyTextField(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                text: 'About AASF',
                textstyle: Textstyle.winningtext(Appcolors.yew(), 14.0),
                textalign: TextAlign.start),
            const AppFaqsDragdown(
              title: 'What is AASF?',
              description:
                  "AASF works to conjugate knowledge and skills into a single bunch. The forum also aims to inculcate in the students the spirit of excellence in every field along with promoting innovative ideas.",
            ),
            const AppFaqsDragdown(
              title: 'How can I join AASF?',
              description:
                  "AASF works to conjugate knowledge and skills into a single bunch. The forum also aims to inculcate in the students the spirit of excellence in every field along with promoting innovative ideas.",
            ),
            const AppFaqsDragdown(
              title: 'How many members are there in AASF?',
              description:
                  "AASF works to conjugate knowledge and skills into a single bunch. The forum also aims to inculcate in the students the spirit of excellence in every field along with promoting innovative ideas.",
            ),
            const AppFaqsDragdown(
              title: 'What is Abhishar?',
              description:
                  "AASF works to conjugate knowledge and skills into a single bunch. The forum also aims to inculcate in the students the spirit of excellence in every field along with promoting innovative ideas.",
            ),
            const AppFaqsDragdown(
              title: 'How can I submit an article to medium?',
              description:
                  "AASF works to conjugate knowledge and skills into a single bunch. The forum also aims to inculcate in the students the spirit of excellence in every field along with promoting innovative ideas.",
            ),
            const SizedBox(
              height: 12,
            ),
            BaseStyle.linealignment(1.5),
            AppVerifyTextField(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                text: 'General quiries',
                textstyle: Textstyle.winningtext(Appcolors.yew(), 14.0),
                textalign: TextAlign.start),
            const AppFaqsDragdown(
                title: 'What is AASF?',
                description:
                    "AASF works to conjugate knowledge and skills into a single bunch. The forum also aims to inculcate in the students the spirit of excellence in every field along with promoting innovative ideas."),
            const AppFaqsDragdown(
                title: 'How can I join AASF?',
                description:
                    "AASF works to conjugate knowledge and skills into a single bunch. The forum also aims to inculcate in the students the spirit of excellence in every field along with promoting innovative ideas."),
            const AppFaqsDragdown(
                title: 'How many members are there in AASF?',
                description:
                    "AASF works to conjugate knowledge and skills into a single bunch. The forum also aims to inculcate in the students the spirit of excellence in every field along with promoting innovative ideas."),
            const AppFaqsDragdown(
                title: 'What is Abhishar?',
                description:
                    "AASF works to conjugate knowledge and skills into a single bunch. The forum also aims to inculcate in the students the spirit of excellence in every field along with promoting innovative ideas."),
            const AppFaqsDragdown(
                title: 'How can I submit an article to medium?',
                description:
                    "AASF works to conjugate knowledge and skills into a single bunch. The forum also aims to inculcate in the students the spirit of excellence in every field along with promoting innovative ideas."),
          ],
        ));
  }
}
