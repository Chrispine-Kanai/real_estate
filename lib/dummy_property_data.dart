import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:real_estate/enums.dart';

class DummyPropertyData {
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "propertyname": WordPair.random(),
            "propertytype": PropertyTypes.values
                .elementAt(Random().nextInt(PropertyTypes.values.length)),
            "propertyuse": PropertyUse.values
                .elementAt(Random().nextInt(PropertyUse.values.length)),
            "businesstype": BusinessType.values
                .elementAt(Random().nextInt(BusinessType.values.length)),
            "cost": "Kshs ${Random().nextInt(1000000)}",
            "location": Random().nextInt(10000),
            "status":
                Status.values.elementAt(Random().nextInt(Status.values.length))
          });

  List<Map<String, dynamic>> _myData() {
    return List.generate(
        200,
        (index) => {
              "propertyname": WordPair.random(),
              "propertytype": PropertyTypes.values
                  .elementAt(Random().nextInt(PropertyTypes.values.length)),
              "propertyuse": PropertyUse.values
                  .elementAt(Random().nextInt(PropertyUse.values.length)),
              "businesstype": BusinessType.values
                  .elementAt(Random().nextInt(BusinessType.values.length)),
              "cost": "Kshs ${Random().nextInt(1000000)}",
              "location": Random().nextInt(10000),
              "status": Status.values
                  .elementAt(Random().nextInt(Status.values.length))
            });
  }
}
