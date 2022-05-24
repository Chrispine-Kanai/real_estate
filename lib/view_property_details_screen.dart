import 'package:flutter/material.dart';
import 'package:real_estate/view_property_on_map_screen.dart';

class ViewPropertyDetails extends StatefulWidget {
  const ViewPropertyDetails({Key? key}) : super(key: key);

  @override
  State<ViewPropertyDetails> createState() => _ViewPropertyDetailsState();
}

class _ViewPropertyDetailsState extends State<ViewPropertyDetails> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Details'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      onSaved: (onSaveValue) => onSaveValue!,
                      onChanged: (onChangeValue) => onChangeValue,
                      validator: (validatorValue) {
                        if (validatorValue == null || validatorValue.isEmpty) {
                          return 'Please enter the property name';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the property name',
                        labelText: 'Property Name',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      onSaved: (onSaveValue) => onSaveValue!,
                      onChanged: (onChangeValue) => onChangeValue,
                      validator: (validatorValue) {
                        if (validatorValue == null || validatorValue.isEmpty) {
                          return 'Please enter the property type';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the property type',
                        labelText: 'Property Type',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      onSaved: (onSaveValue) => onSaveValue!,
                      onChanged: (onChangeValue) => onChangeValue,
                      validator: (validatorValue) {
                        if (validatorValue == null || validatorValue.isEmpty) {
                          return 'Please enter the property use';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the property use',
                        labelText: 'Property Use',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      onSaved: (onSaveValue) => onSaveValue!,
                      onChanged: (onChangeValue) => onChangeValue,
                      validator: (validatorValue) {
                        if (validatorValue == null || validatorValue.isEmpty) {
                          return 'Please enter the business type';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the business type',
                        labelText: 'Business Type',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      onSaved: (onSaveValue) => onSaveValue!,
                      onChanged: (onChangeValue) => onChangeValue,
                      validator: (validatorValue) {
                        if (validatorValue == null || validatorValue.isEmpty) {
                          return 'Please enter the property cost';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the property cost',
                        labelText: 'Property Cost',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      onSaved: (onSaveValue) => onSaveValue!,
                      onChanged: (onChangeValue) => onChangeValue,
                      validator: (validatorValue) {
                        if (validatorValue == null || validatorValue.isEmpty) {
                          return 'Please enter the property status';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the property status',
                        labelText: 'Property Status',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ViewPropertyOnMap(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * .7, 40),
                      ),
                      child: const Text(
                        'View On Map',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
