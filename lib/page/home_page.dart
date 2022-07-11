import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:uites/controller/home_controller.dart';
import 'package:uites/models/icons_fitur.dart';
import 'package:uites/widget/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeController>().getapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          appbar(),
          Expanded(
              child: ListView(
            children: [
              cover(),
              fitur(context),
              Container(
                color: const Color(0xffF5F5F5),
                // color: Colors.red,
                margin: const EdgeInsets.only(top: 18),
                height: 18,
                width: double.infinity,
              ),
              iklan(),
              Container(
                color: const Color(0xffF5F5F5),
                // color: Colors.red,
                // margin: EdgeInsets.only(top: 18),
                height: 18,
                width: double.infinity,
              ),
              Consumer<HomeController>(builder: (context, value, _) {
                return (value.loading)
                    ? const LinearProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: List.generate(
                              value.data.length,
                              (index) => CardHome(
                                    model: value.data[index],
                                  )),
                        ),
                      );
              })
            ],
          ))
        ],
      )),
    );
  }

  Container iklan() {
    return Container(
      width: double.infinity,
      height: 143,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(("assest/Mask Group 2.png")),
          ),
          Container(
            alignment: Alignment.center,
            // height: 20,
            margin: const EdgeInsets.only(top: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    6,
                    (index) => Container(
                        margin: const EdgeInsets.only(left: 6),
                        height: 7.5,
                        width: index == 5 ? 24 : 7.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: index == 5
                                ? const Color(0xff0093DD)
                                : const Color(0xffD6D6D6))))),
          )
        ],
      ),
    );
  }

  Container cover() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      // height: 143,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
            colors: [Color(0xff0093DD), Color(0xffDD127B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Text(
              "INFO ANTRIAN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            height: 1.2,
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        backgroundColor: Colors.transparent,
                        radius: 35.0,
                        lineWidth: 3.0,
                         startAngle: 330,
                        percent: 0.90,
                        center: const Text("21",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white)),
                        progressColor: const Color(0xffFFF9AA),
                      ),
                      const SizedBox(height: 2),
                      const Text("Nomor antrian",
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        backgroundColor: Colors.transparent,
                        // startAngle: .5,
                      startAngle: 180,
                        radius: 35.0,
                        lineWidth: 3.0,
                        percent: 0.90,
                        center: const Text("5",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white)),
                        progressColor: const Color(0xffFFF9AA),
                      ),
                      const SizedBox(height: 2),
                      const Text("Sisa antrian",
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .04,
                ),
                Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Dokter anda",
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFFF9AA)),
                        ),
                        SizedBox(height: 4),
                        Text("dr.Rina Agustina",
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(height: 6),
                        Text("Klinik / RS anda",
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFFF9AA))),
                        SizedBox(height: 4),
                        Text("RS. National Hospital",
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding fitur(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            iconsFitur.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Column(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width - 24) / 3,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                                height: 55.78,
                                width: 55.78,
                                margin: const EdgeInsets.all(5.5),
                                decoration: BoxDecoration(
                                    color: iconsFitur[index].colors,
                                    borderRadius: BorderRadius.circular(20)),
                                padding: (index != 0)
                                    ? const EdgeInsets.all(12)
                                    : const EdgeInsets.all(8),
                                child: Image.asset(iconsFitur[index].image)),
                            if (index == 3)
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: 17,
                                    height: 17,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff50DEE3),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.white,
                                        )),
                                  ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        iconsFitur[index].name,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5A5A5A)),
                      )
                    ],
                  ),
                )),
      ),
    );
  }

  SizedBox appbar() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Hi,Bagus",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              ),
              const SizedBox(width: 12),
              Image.asset(
                "assest/user (1).png",
                width: 20,
              ),
              const SizedBox(
                width: 12,
              )
            ],
          ),
          Container(
            height: 39,
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: const Color(0xffE3E3E3)),
                color: const Color(0xffF4F4F4)),
            child: const TextField(
                decoration: InputDecoration(
                    hintText: "Cari klinik / Rumah Sakit",
                    hintStyle: TextStyle(color: Color(0xffB7B7B7)),
                    border: InputBorder.none)),
          ),
        ],
      ),
    );
  }
}
