import 'package:get/get.dart';
import 'package:process_run/stdio.dart';

class EnvController extends GetxController {
  var output = "".obs;
  var envVars = <String, String>{}.obs;
  var isLoading = false.obs;
  var result;

  @override
  void onInit() {
    super.onInit();
    runCommand();
  }

  void runCommand() async {
    isLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      result = await Process.run("env", []);
      output.value = result.stdout;
      _splitEnvVars();
    } finally {
      isLoading(false);
    }
  }

  void _splitEnvVars() {
    List<String> lines = output.value.trim().split("\n");
    var varsMap = <String, String>{};
    for (var line in lines) {
      var keyValue = line.split("=");
      if (keyValue.length == 2) {
        varsMap[keyValue[0].trim()] = keyValue[1].trim();
      }
    }
    envVars.assignAll(varsMap);
  }
}
