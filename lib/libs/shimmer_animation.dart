import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return skeleton(context);
  }

  Container skeleton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green.shade700,
            Colors.green.shade800,
          ],
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.07,
            child: null,
            backgroundColor: Colors.white,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            width: 300,
            height: 20,
            decoration: BoxDecoration(
                // No border
                borderRadius: BorderRadius.circular(20),
                color: Colors.white),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            decoration: BoxDecoration(
                // No border
                borderRadius: BorderRadius.circular(30),
                color: Colors.white),
            width: 100,
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            width: MediaQuery.of(context).size.width * 0.90,
            height: 200,
            decoration: BoxDecoration(
              // No border
              borderRadius: BorderRadius.circular(10),

              gradient: LinearGradient(
                colors: [
                  Colors.green.shade700,
                  Colors.green.shade800,
                ],
              ),
            ),
            child: null,
          ),
        ]),
      ),
    );
  }
}
