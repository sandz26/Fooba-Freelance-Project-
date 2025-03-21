import 'package:checkout/widgets/live_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() {
    return _TrackOrderScreenState();
  }
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Track Order'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 6,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 326),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFD9D9D9),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                height: 90,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.person_crop_circle,
                      size: 60,
                    ),
                    SizedBox(width: 4),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'John Musa',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Text(
                          'GP 780-09',
                          style:
                              TextStyle(color: Color(0x4D000000), fontSize: 16),
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.phone_in_talk_rounded)
                  ],
                ),
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFD9D9D9),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                height: 192,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 30,
                        ),
                        SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              '13974 Rosebank Ave ',
                              style: TextStyle(
                                  color: Color(0x4D000000), fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.clock,
                          size: 30,
                        ),
                        SizedBox(width: 6),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Delivery Time',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              '20-25 min (on the way) ',
                              style: TextStyle(
                                  color: Color(0x4D000000), fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     // builder: (context) => LiveChatScreen(),
          //   ),
          // );
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.chat_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
