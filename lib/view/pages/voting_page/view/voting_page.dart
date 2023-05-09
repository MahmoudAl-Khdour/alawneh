import 'package:alawneh/view/components/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';

class VotingPage extends StatelessWidget {
  const VotingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isVote = false;

    return Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: polls().length,
          itemBuilder: (BuildContext context, int index) {
            final Map<String, dynamic> poll = polls()[index];

            final int days = DateTime(
              poll['end_date'].year,
              poll['end_date'].month,
              poll['end_date'].day,
            )
                .difference(DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                ))
                .inDays;

            return Container(
              // margin: const EdgeInsets.only(bottom: 20),
              child: FlutterPolls(
                votedProgressColor: AppColor.globalDefaultColor,
                pollOptionsHeight: 45,

                votesTextStyle: const TextStyle(
                  color: AppColor.globalDefaultColor,
                ),
                pollOptionsBorder: Border.all(
                  color: Colors.grey[200]!.withOpacity(0.6),
                ),
                pollOptionsBorderRadius: BorderRadius.circular(25),
                votedPollOptionsRadius: const Radius.circular(25),
                pollOptionsFillColor: Colors.grey[200]!.withOpacity(0.6),
                heightBetweenOptions: 10,
                // heightBetweenTitleAndOptions: 20,
                leadingVotedProgessColor: AppColor.globalDefaultColor,
                pollId: poll['id'].toString(),
                // hasVoted: hasVoted.value,
                // userVotedOptionId: userVotedOptionId.value,
                onVoted: (PollOption pollOption, int newTotalVotes) async {
                  await Future.delayed(const Duration(seconds: 1));
                  setState() => {
                        isVote = true,
                      };

                  /// If HTTP status is success, return true else false
                  return true;
                },
                pollEnded: days < 0,
                pollTitle: const Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 20,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ''
                      // poll['question']
                      ,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                pollOptions: List<PollOption>.from(
                  poll['options'].map(
                    (option) {
                      var a = PollOption(
                        id: option['id'],
                        title: Text(
                          option['title'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue[300],
                          ),
                        ),
                        votes: option['votes'],
                      );
                      return a;
                    },
                  ),
                ),
                votedPercentageTextStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.globalDefaultColor),
                // metaWidget: Row(
                //   children: [
                //     const SizedBox(width: 6),
                //     const Text(
                //       '•',
                //     ),
                //     const SizedBox(
                //       width: 6,
                //     ),
                //     Text(
                //       days < 0 ? "ended" : "ends $days days",
                //     ),
                //   ],
                // ),
              ),
            );
          },
        ),
      ),
    );
  }

  List polls() => [
        {
          'id': 1,
          'question':
              'Is Flutter the best framework for building cross-platform applications?',
          'end_date': DateTime(2045, 5, 21),
          'options': [
            {
              'id': 1,
              'title': 'Absolutely',
              'votes': 40,
            },
            {
              'id': 2,
              'title': 'Maybe',
              'votes': 20,
            },
            {
              'id': 3,
              'title': 'Meh!',
              'votes': 10,
            },
          ],
        }
      ];
}
