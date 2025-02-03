
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 291,
        height: 144.5,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xffFF2E21).withOpacity(0.8),
              const Color(0xffFF7C21).withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '    BUY NOW !',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text('       SAVE 50%',
                style: TextStyle(fontSize: 22, color: Colors.white)),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Shop Now',
                        style: TextStyle(
                          color: Color(0xffFF2E21),
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Color(0xffFF2E21),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}