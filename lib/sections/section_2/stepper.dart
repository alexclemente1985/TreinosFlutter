import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StepperWidgetState();
}

class StepperWidgetState extends State<StepperWidget>{
  late int _current;
  late List<Step> _steps;

  @override
  void initState(){
    _current = 0;
    _steps = <Step>[
      Step(title: Text("Step 1"), content: Text("Fazer algo"), isActive: true),
      Step(title: Text("Step 2"), content: Text("Fazer algo"), isActive: true),
      Step(title: Text("Step 3"), content: Text("Fazer algo"), isActive: true),
      Step(title: Text("Step 4"), content: Text("Fazer algo"), isActive: true),
    ];
  }

  void _stepContinue(){
    setState(() {
      _current++;
      if(_current >= _steps.length){
        _current = _steps.length - 1;
      }
    });
  }

  void _stepCancel(){
    setState(() {
      _current--;
      if(_current < 0){
        _current = 0;
      }
    });
  }

  void _stepTap(int index){
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper"),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Stepper(
            steps: _steps,
            type: StepperType.vertical,
            currentStep: _current,
            onStepCancel: _stepCancel,
            onStepContinue: _stepContinue,
            onStepTapped: _stepTap,
            ),
        ),
      ),
    );
  }
}