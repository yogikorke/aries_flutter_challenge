import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/options/options_bloc.dart';
import '../../../blocs/options/options_event.dart';

class OptionsInput extends StatefulWidget {
  const OptionsInput({super.key});

  @override
  OptionsInputState createState() => OptionsInputState();
}

class OptionsInputState extends State<OptionsInput> {
  final _formKey = GlobalKey<FormState>();
  String _optionType = 'Call';
  double _strikePrice = 0.0;
  double _premium = 0.0;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: _optionType,
              onChanged: (value) {
                setState(() {
                  _optionType = value!;
                });
              },
              items: ['Call', 'Put'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Option Type'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Strike Price'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _strikePrice = double.parse(value!);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Premium'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _premium = double.parse(value!);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _quantity = int.parse(value!);
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                context.read<OptionsBloc>().add(AddOptionContract(
                    _optionType, _strikePrice, _premium, _quantity));
              }
            },
            child: const Text('Add Option Contract'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<OptionsBloc>().add(const CalculateRiskReward());
            },
            child: const Text('Calculate Risk & Reward'),
          ),
        ],
      ),
    );
  }
}
