import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';

class PendingPayment extends StatelessWidget {
  const PendingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Karas.primary,
        foregroundColor: Colors.white,
          title: Text('Payment Confirmation', style: TextStyle(fontSize: 18),),
          centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    color: Karas.primary,
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          spreadRadius: 0.5,
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(9), bottomLeft: Radius.circular(9)),
                              child: Image.asset('assets/mtn.png', fit: BoxFit.cover, height: double.infinity, width: double.infinity,),
                          ),
                        ),
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('A prompt message has been initiated on'
                                      ' +260952332233, confirm with your PIN to approve '
                                      'the payment of K2,500.', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),)
                                ],
                              ),
                            ) 
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                  child: Container(
                    width: 50,
                    color: Karas.action,
                    child: LoadingIndicator(
                        indicatorType: Indicator.squareSpin,
                    ),
                  ),
                ),
            ),
            SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}
