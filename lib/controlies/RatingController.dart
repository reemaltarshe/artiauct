import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_rx/get_rx.dart';

class RatingController extends GetxController {
  double rating = 0;
  RxInt totalRatings = 0.obs;
  Widget buildRating() => RatingBar.builder(
    initialRating: rating,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    updateOnDrag: true,
    onRatingUpdate: (newRating) {
      rating = newRating;
      update();
    },
  );
    void showRating(BuildContext context) => showDialog(context: context, builder: (context) => AlertDialog(
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      color: Colors.black),
      title:const Center(
        child: Text("How do you see this product?"),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Please click on the star to rate!", style: TextStyle(fontSize: 16),),
          SizedBox(height: 32),
          buildRating(),
        ],
      ),
        actions: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: (){final controller = Get.find<RatingController>();
          controller.cancelRating(context);},
              child: Text("Cancel"),
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                        return  Color(0xFFFFA45D);
                        }
                       return Colors.white;
                        },
                      ),
                 ),
          ),

        TextButton(onPressed: (){final controller = Get.find<RatingController>();
                        controller.submitRating(context);},
                        child: Text("Send"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return  Color(0xFFFFA45D);
                }
                return Colors.white;
              },
            ),
          ),)

        ])
      ],

      ),
    );


  void submitRating(BuildContext context) {
    totalRatings.value++;
    update();
    Navigator.of(context).pop(rating);
    Get.back();
    // Get.offAll(() => MainScreen());
  }

  void cancelRating(BuildContext context) {

    Navigator.of(context).pop();
    Get.back();
  }

  }




