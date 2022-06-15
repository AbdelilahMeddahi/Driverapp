import 'package:drivers_app/global/global.dart';
import 'package:drivers_app/splashScreen/splash_screen.dart';
import 'package:drivers_app/tabPages/home_tab.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatefulWidget
{

  @override
  _CarInfoScreenState createState() => _CarInfoScreenState();
}



class _CarInfoScreenState extends State<CarInfoScreen>
{
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  List<String> carTypesList = ["Sedan", "MiniVan", "Van"];
  String? selectedCarType;
  saveCarInfo()
  {
    Map driverCarInfoMap =
    {
      "car_color": carColorTextEditingController.text.trim(),
      "car_number": carNumberTextEditingController.text.trim(),
      "car_model": carModelTextEditingController.text.trim(),
      "type": selectedCarType,
    };

    DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
    driversRef.child(currentFirebaseUser!.uid).child("car_details").set(driverCarInfoMap);

    Fluttertoast.showToast(msg: "Car Details has been saved, Congratulations.");
    Navigator.push(context, MaterialPageRoute(builder: (c)=> HomeTabPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              const SizedBox(height: 24,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/illustration-3.png"),
              ),

              const SizedBox(height: 10,),

              const Text(
                "Write Car Details",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),


              TextField(
                controller: carModelTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(
                        color:
                        Theme
                            .of(context)
                            .colorScheme
                            .tertiary),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 20),
                  labelText: 'Car Model',
                  hintText: "Car Model",
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              TextField(
                controller: carNumberTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(
                        color:
                        Theme
                            .of(context)
                            .colorScheme
                            .tertiary),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 20),
                  labelText: 'Car Number',
                  hintText: "Car Number",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: carColorTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(
                        color:
                        Theme
                            .of(context)
                            .colorScheme
                            .tertiary),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 20),
                  labelText: 'Car Color',
                  hintText: "Car Color",
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              const SizedBox(height: 10,),

              DropdownButton(
                iconSize: 26,
                dropdownColor: Colors.black,
                hint: const Text(
                  "Please choose Car Type",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                value: selectedCarType,
                onChanged: (newValue)
                {
                  setState(() {
                    selectedCarType = newValue.toString();
                  });
                },
                items: carTypesList.map((car){
                  return DropdownMenuItem(
                    child: Text(
                      car,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    value: car,
                  );
                }).toList(),
              ),

              const SizedBox(height: 100,),

              ElevatedButton(
                onPressed: ()
                {
                  if(carColorTextEditingController.text.isNotEmpty
                      && carNumberTextEditingController.text.isNotEmpty
                      && carModelTextEditingController.text.isNotEmpty && selectedCarType != null)
                  {
                    saveCarInfo();
                  }
                },

                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF77E21),
                ),
                child: const Text(
                  "Save Now",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
