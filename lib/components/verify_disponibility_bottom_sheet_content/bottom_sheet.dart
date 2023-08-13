import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/theme/app_colors.dart';

class DraggableBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.network(
              'https://images.unsplash.com/photo-1541532713592-79a0317b6b77?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=688&q=80',
              height: 340.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              children: [
                Text('Bienvenue à IDWEY',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: primary)),
                SizedBox(height: 20.h),
                Text(
                  'l’application IDWEY.tn vous permet en quelques étapes de chercher, explorer, réserver et payer les bons plans aventures Outdoor.',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton.primary(
                    onPressed: () {
                      // Handle login button press
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Se connecter'),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton.secondaryColor(
                    onPressed: () {
                      // Handle sign-up button press
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('S’inscrire'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
