import 'package:flutter/material.dart';

import '../services/services.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({
    super.key,
  });

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isRemember = false;
  bool isRemember2 = false;
  bool isSelected = false;
  bool _isItemSelected = false;
  Future<List<dynamic>>? _genresFuture;
  List<String> selectedItems = [];

  @override
  void initState() {
    super.initState();
    _genresFuture = fetchGenres();
  }

  void _addItem(String item) {
    setState(() {
      selectedItems.add(item);
    });
  }

  void _removeItem(String item) {
    setState(() {
      selectedItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101629),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "SignUp",
                            style: TextStyle(
                                color: Color(0xFFD2D3D8),
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 22,
                            child: Icon(
                              Icons.close,
                              color: Color(0xFF101629),
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                          text: const TextSpan(
                              text: "Let's create an ",
                              style: TextStyle(
                                  fontSize: 29, fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: "Account",
                                style: TextStyle(color: Color(0xFFFF9F00)))
                          ])),
                      const SizedBox(
                        height: 40,
                      ),
                      const TextfieldPage(
                        text: "First Name",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextfieldPage(
                        text: "Last Name",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextfieldPage(
                        text: "Mobile No",
                        text1: "+91",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextfieldPage(
                        text: "Email",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Genre",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFD2D3D8)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                backgroundColor: const Color(0xFF101629),
                                appBar: AppBar(
                                  automaticallyImplyLeading: false,
                                  elevation: 0,
                                  centerTitle: false,
                                  backgroundColor: Colors.transparent,
                                  title: const Text(
                                    "Geners",
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                ),
                                body: SingleChildScrollView(
                                    child: FutureBuilder<List<dynamic>>(
                                        future: _genresFuture,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else if (snapshot.hasError) {
                                            return const Center(
                                              child:
                                                  Text('Failed to load genres'),
                                            );
                                          } else {
                                            final List<dynamic> genres =
                                                snapshot.data!;
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              child: SingleChildScrollView(
                                                child: Wrap(
                                                  spacing: 10.0,
                                                  runSpacing: 5.0,
                                                  children: List.generate(
                                                      genres.length, (index) {
                                                    return ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape:
                                                            ContinuousRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        backgroundColor:
                                                            Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        _addItem(genres[index]
                                                            ['name'][0]);
                                                      },
                                                      child: Text(
                                                        genres[index]['name'],
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                          }
                                        })),
                                bottomNavigationBar: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.amber),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.amber),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: TextFormField(
                          onTap: () {
                            setState(() {
                              _isItemSelected = false;
                            });
                          },
                          enableInteractiveSelection: false,
                          focusNode: FocusNode(),
                          enabled: _isItemSelected,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15)),
                              suffixIcon: const Icon(
                                Icons.arrow_downward_rounded,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 5.0,
                        children: List.generate(selectedItems.length, (index) {
                          return Stack(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      backgroundColor: Colors.amber),
                                  onPressed: () {
                                    _addItem(selectedItems[index]);
                                  },
                                  child: Text(
                                    selectedItems[index],
                                    style: const TextStyle(color: Colors.black),
                                  )),
                              Positioned(
                                  right: -15,
                                  top: -10,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                      onPressed: () {
                                        _removeItem(selectedItems[index]);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                            ],
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Performace Type*",
                        style:
                            TextStyle(color: Color(0xFFD2D3D8), fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Transform.scale(
                              scale: 1.6,
                              child: Checkbox(
                                  value: isRemember,
                                  onChanged: (value) {
                                    setState(() {
                                      isRemember = value!;
                                    });
                                  },
                                  activeColor: const Color(0xFFFF9F00),
                                  side: const BorderSide(
                                      color: Color(0xFFFF9F00),
                                      width: 2.0,
                                      style: BorderStyle.solid)),
                            ),
                            const Text(
                              "In Person",
                              style: TextStyle(
                                  color: Color(0xFFD2D3D8), fontSize: 17),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Transform.scale(
                              scale: 1.6,
                              child: Checkbox(
                                  value: isRemember2,
                                  onChanged: (value) {
                                    setState(() {
                                      isRemember2 = value!;
                                    });
                                  },
                                  activeColor: const Color(0xFFFF9F00),
                                  side: const BorderSide(
                                      color: Color(0xFFFF9F00),
                                      width: 2.0,
                                      style: BorderStyle.solid)),
                            ),
                            const Text(
                              "Virtual",
                              style: TextStyle(
                                  color: Color(0xFFD2D3D8), fontSize: 17),
                            ),
                          ]),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFFF9F00)),
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent),
                              onPressed: () {},
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class TextfieldPage extends StatefulWidget {
  final String text;
  final IconData? icon;
  final String? text1;
  const TextfieldPage({
    super.key,
    required this.text,
    this.icon,
    this.text1,
  });

  @override
  State<TextfieldPage> createState() => _TextfieldPageState();
}

class _TextfieldPageState extends State<TextfieldPage> {
  final bool isOsbscuretext = false;
  final TextEditingController countryCode = TextEditingController();

  @override
  void dispose() {
    countryCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.text}*",
          style: const TextStyle(fontSize: 18, color: Color(0xFFD2D3D8)),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: countryCode,
          keyboardType: TextInputType.phone,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(15)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(15)),
              suffixIcon: Icon(
                widget.icon,
                color: Colors.white,
                size: 30,
              )),
        ),
      ],
    );
  }
}
