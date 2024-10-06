import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool changeSeparately = false;
  int sliderAll = 0;
  int sliderTopL = 0;
  int sliderTopR = 0;
  int sliderBotL = 0;
  int sliderBotR = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Border changer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            changeSeparately
                ? Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text('Left top side'),
                              Slider(
                                value: sliderTopL.toDouble(),
                                label: ' $sliderTopL',
                                max: 100,
                                onChanged: (double value) {
                                  setState(() {
                                    sliderTopL = value.round();
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Right top side'),
                              Slider(
                                value: sliderTopR.toDouble(),
                                label: ' $sliderTopR',
                                max: 100,
                                onChanged: (double value) {
                                  setState(() {
                                    sliderTopR = value.round();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text('Left bottom side'),
                              Slider(
                                value: sliderBotL.toDouble(),
                                label: ' $sliderBotL',
                                max: 100,
                                onChanged: (double value) {
                                  setState(() {
                                    sliderBotL = value.round();
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Right bottom side'),
                              Slider(
                                value: sliderBotR.toDouble(),
                                label: ' $sliderBotR',
                                max: 100,
                                onChanged: (double value) {
                                  setState(() {
                                    sliderBotR = value.round();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                : Slider(
                    value: sliderAll.toDouble(),
                    label: ' $sliderAll',
                    max: 100,
                    onChanged: (double value) {
                      setState(() {
                        sliderAll = value.round();
                      });
                    },
                  ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              child: ClipRRect(
                borderRadius: changeSeparately
                    ? BorderRadius.only(
                        topLeft: Radius.circular(sliderTopL.toDouble()),
                        topRight: Radius.circular(sliderTopR.toDouble()),
                        bottomLeft: Radius.circular(sliderBotL.toDouble()),
                        bottomRight: Radius.circular(sliderBotR.toDouble()),
                      )
                    : BorderRadius.circular(sliderAll.toDouble()),
                child: Image.asset(
                  'assets/images/cat.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: changeSeparately,
                    onChanged: (value) {
                      setState(() {
                        changeSeparately = value!;
                      });
                    }),
                const Text('Change border separately'),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    sliderAll = 0;
                    sliderTopL = 0;
                    sliderTopR = 0;
                    sliderBotL = 0;
                    sliderBotR = 0;
                  });
                },
                child: const Text('Reset values')),
          ],
        ),
      ),
    );
  }
}
