import 'package:flutter/material.dart';
import 'package:maps/home/widgets/custom_text_form_field_widget.dart';
import 'package:maps/services/coords_tile_service.dart';
import 'package:maps/services/validator_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController xController;
  late final TextEditingController yController;
  late final TextEditingController zController;
  final _formKey = GlobalKey<FormState>();

  late final CoordsTileService coordsTileService;
  late final ValidatorService validatorService;
  Offset? result;

  @override
  void initState() {
    super.initState();
    coordsTileService = CoordsTileService();
    validatorService = ValidatorService();
    xController = TextEditingController();
    yController = TextEditingController();
    zController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormF(
                controller: xController,
                hint: 'X - Широта',
                validator: validatorService.latitudeValidator,
              ),
              const SizedBox(height: 15),
              CustomTextFormF(
                controller: yController,
                hint: 'Y - Долгота',
                validator: validatorService.longitudeValidator,
              ),
              const SizedBox(height: 15),
              CustomTextFormF(
                controller: zController,
                hint: 'Z - Зум',
              ),
              Visibility(
                visible: result == null ? false : true,
                child: InteractiveViewer(
                  maxScale: double.tryParse(zController.text) ?? 1,
                  child: Container(
                    color: Colors.amber,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      children: [
                        Text(
                          'x: ${result?.dx}',
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white),
                        ),
                        Text(
                          'y: ${result?.dy}',
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  if (_formKey.currentState?.validate() ?? false) {
                    result = coordsTileService.countTileXY(
                        double.tryParse(xController.text) ?? 0,
                        double.tryParse(yController.text) ?? 0,
                        double.tryParse(zController.text) ?? 0);
                  }
                },
                child: const Text('GET COORDS TILE'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
