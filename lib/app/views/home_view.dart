import 'package:conversor_moeda/app/components/currency_fields.dart';
import 'package:conversor_moeda/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeController homeController;
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/logo.jpeg'),
                SizedBox(height: 50),
                CurrencyFields(
                  selectedItem: homeController.toCurrency,
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                  },
                ),
                SizedBox(height: 10),
                CurrencyFields(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                  },
                ),
                SizedBox(height: 50),
                RaisedButton(
                  color: Colors.amber,
                  child: Text('CONVERTER'),
                  onPressed: () {
                    homeController.convert();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
