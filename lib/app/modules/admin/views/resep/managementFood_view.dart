import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../widgets/colors.dart';
import '../../controllers/admin_controller.dart';

import 'addfood_view.dart';
import 'editfood_view.dart'; // Import your Makanan model

class AdminAddFood extends GetView<AdminController> {
  const AdminAddFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manajemen Data Makanan',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: hijauSage,
        actions: [
          IconButton(
              onPressed: () => Get.to(() => AddFood()),
              icon: const Icon(Iconsax.add5))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.foods.length,
            itemBuilder: (context, index) {
              final food = controller.foods[index];
              return Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 10),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: hijauSage.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          "${index + 1}.",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          food.recipeName,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        IconButton(
                          color: Colors.blue[400],
                          onPressed: () {
                            Get.to(EditFood(food: food, index: index));
                          },
                          icon: const Icon(Iconsax.edit_25),
                        ),
                        IconButton(
                          color: Colors.red[400],
                          onPressed: () {
                            controller.deleteFood(index);
                          },
                          icon: const Icon(Iconsax.trash),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
