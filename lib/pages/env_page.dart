import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:infoz/constans/color.dart';
import 'package:infoz/controllers/controllers.dart';
import 'package:infoz/widgets/snakbar_widget.dart';

class EnvPage extends StatelessWidget {
  const EnvPage({super.key});

  @override
  Widget build(BuildContext context) {
    String output = "";
    final EnvController controller = Get.put(EnvController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Environment Variables',
          style: TextStyle(color: flexSchemeDark.primary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(text: output),
                );
                FloatingSnackBar(
                    context, 'All environment variables were copied');
              },
              icon: const Icon(Icons.copy_all),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.runCommand();
              output = "";
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            cacheExtent: double.maxFinite,
            itemCount: controller.envVars.length,
            itemBuilder: (context, index) {
              String key = controller.envVars.keys.elementAt(index);
              String value = controller.envVars[key]!;
              output += "$key=$value\n";
              List<String> words = key.toLowerCase().split('_');
              String splitKey = words
                  .map((word) => word[0].toUpperCase() + word.substring(1))
                  .join(' ');

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: Text(splitKey),
                  collapsedBackgroundColor:
                      flexSchemeDark.secondaryContainer.withOpacity(0.5),
                  backgroundColor: flexSchemeDark.secondaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SelectableText("$key:\n\n$value\n"),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                FloatingSnackBar(
                                    context, "Environment variable copied");
                                Clipboard.setData(ClipboardData(text: value));
                              },
                              child: const Text("Copy Env"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
