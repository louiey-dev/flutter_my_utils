import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:slider_button/slider_button.dart';
import 'package:flutter_my_utils/utils/my_utils.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  List<bool> toggleSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Demo'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  utils.showSnackbar(context, "ElevatedButton pressed");
                },
                child: const Text('ElevatedButton'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  utils.showSnackbar(context, "OutlinedButton pressed");
                },
                child: const Text('OutlinedButton'),
              ),
              const SizedBox(height: 10),
              IconButton(
                onPressed: () {
                  utils.showSnackbar(context, "IconButton pressed");
                },
                icon: const Icon(Icons.alarm),
                iconSize: 50,
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    utils.showSnackbar(context, "TextButton pressed");
                  },
                  child: const Text('TextButton')),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  utils.showSnackbar(context, "FloatingActionButton pressed");
                },
                heroTag: "0",
                // child: const Text("FloatingActionButton"),
                child: const Icon(Icons.navigation),
              ),
              const SizedBox(height: 10),
              FloatingActionButton.extended(
                label: const Text("Extended FloatingActionButton"),
                onPressed: () {
                  utils.showSnackbar(context, "FloatingActionButton pressed");
                },
                // child: const Text("FloatingActionButton"),
                icon: const Icon(Icons.navigation),
                heroTag: "1",
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () {
                  utils.showSnackbar(context, "FilledButton pressed");
                },
                child: const Text("FilledButton"),
              ),
              const SizedBox(height: 10),
              FilledButton.tonalIcon(
                onPressed: () {
                  utils.showSnackbarMs(
                      context, 200, "FilledButton.tonalIcon pressed");
                },
                icon: const Icon(Icons.color_lens),
                label: const Text("FilledButton.tonalIcon"),
              ),
              const SizedBox(height: 10),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Toggle Button"),
                  const SizedBox(width: 20),
                  ToggleButtons(
                    isSelected: toggleSelected,
                    onPressed: (int idx) {
                      setState(() {
                        toggleSelected[idx] = !toggleSelected[idx];
                      });
                      utils.log(
                          'Clicked $idx, ${toggleSelected[idx] ? "selected" : "unselected"}');
                    },
                    color: Colors.pink,
                    selectedColor: Colors.white,
                    fillColor: Colors.pink,
                    borderRadius: BorderRadius.circular(12),
                    selectedBorderColor: Colors.pink[300],
                    children: const [
                      Icon(Icons.free_breakfast),
                      Icon(Icons.wifi),
                      Icon(Icons.local_parking),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),

              /// SliderButton
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Slider Button\nreturn true will close button"),
                  const SizedBox(height: 10),
                  SliderButton(
                    buttonColor: Colors.yellow,
                    // height: 20,
                    action: () async {
                      ///Do something here OnSlide
                      return true;
                    },
                    label: const Text(
                      "Slider Button",
                      style: TextStyle(
                          color: Color(0xff4a4a4a),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    // buttonSize: 20,
                    icon: const Text(
                      "X",
                      style: TextStyle(
                        color: Colors.blue,
                        // backgroundColor: Colors.yellow,
                        fontWeight: FontWeight.w400,
                        fontSize: 44,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SliderButton(
                    action: () async {
                      ///Do something here OnSlide
                      return false;
                    },

                    ///Put label over here
                    label: const Text(
                      "Slide to cancel !",
                      style: TextStyle(
                          color: Color(0xff4a4a4a),
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    icon: const Center(
                        child: Icon(
                      Icons.power_settings_new,
                      color: Colors.white,
                      size: 40.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    )),

                    ///Change All the color and size from here.
                    width: 230,
                    radius: 10,
                    buttonColor: const Color(0xffd60000),
                    backgroundColor: const Color(0xff534bae),
                    highlightedColor: Colors.white,
                    baseColor: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),

              /// slidable_button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Text("SlidableButton"),
                  const SizedBox(width: 20),
                  HorizontalSlidableButton(
                    width: 250,
                    buttonWidth: 140.0,
                    color: Colors.blue[100],
                    buttonColor: Colors.blue[300],
                    dismissible: false,
                    label: const Center(child: Text('SlidableButton')),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'ON',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            'OFF',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onChanged: (position) {
                      setState(() {
                        if (position == SlidableButtonPosition.end) {
                          utils.showSnackbarMs(context, 200, "ON");
                          utils.log('Button is on the right');
                        } else {
                          utils.showSnackbarMs(context, 200, "OFF");
                          utils.log('Button is on the left');
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  VerticalSlidableButton(
                    height: MediaQuery.of(context).size.height / 3,
                    buttonHeight: 150.0,
                    color: Colors.amber[100],
                    buttonColor: Theme.of(context).primaryColor,
                    dismissible: false,
                    label: const Center(child: Text('SlidableButton')),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Top'),
                          Text('Bottom'),
                        ],
                      ),
                    ),
                    onChanged: (position) {
                      setState(() {
                        if (position == SlidableButtonPosition.end) {
                          utils.showSnackbarMs(context, 200, "ON");
                          utils.log('Button is on the bottom');
                        } else {
                          utils.showSnackbarMs(context, 200, "OFF");
                          utils.log('Button is on the top');
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
