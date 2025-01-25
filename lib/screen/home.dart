import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var height = TextEditingController();
  var weight = TextEditingController();
  var height2 = TextEditingController();

  var result = '';
  var condition = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        leading: Icon(
          Icons.calculate,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "BMI",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: height,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.height),
                      hintText: 'Enter your feet',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: height2,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.height),
                      hintText: 'Enter your inch  ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: weight,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.line_weight),
                      hintText: 'Enter your weight in kg',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  var hei = height.text;
                  var weg = weight.text;
                  var hei2 = height2.text;

                  if (hei != '' && weg != " " && hei2 != "") {
                    setState(() {
                      var heig = int.parse(hei);
                      var weig = int.parse(weg);
                      var heig2 = int.parse(hei2);
                      var totalheight = (heig * 12) + heig2;
                      var meter = totalheight * 0.0254;
                      var bmi = weig / (meter * meter);

                      result = ' Your BMI is :  ${bmi.toStringAsFixed(2)}';

                      if (bmi < 18.5 && bmi > 0) {
                        condition = 'Under Weight';
                      } else if (bmi >= 18.5 && bmi <= 24.9) {
                        condition = 'Normal';
                      } else if (bmi >= 25.0 && bmi <= 29.9) {
                        condition = 'Over Weight';
                      } else if (bmi >= 30.0 && bmi <= 34.9) {
                        condition = 'Obese';
                      } else if (bmi >= 35.0) {
                        condition = 'Extrenely obese';
                      } else if (bmi >= 0) {
                        condition = 'Invalid';
                      } else {
                        condition = 'Invalid';
                      }
                      //    setState(() {});
                    });
                  } else {
                    setState(() {
                      result = 'please enter the value first!!';
                    });
                  }
                },
                child: Text("Calculate"),
              ),
              Container(
                margin: EdgeInsets.all(18),
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Text(condition)
            ],
          ),
        ),
      ),
    );
  }
}

