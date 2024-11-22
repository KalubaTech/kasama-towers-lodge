import 'package:flutter/material.dart';
import 'package:kasama_towers_lodge/controllers/user_controller.dart';
import 'package:kasama_towers_lodge/views/page_anchor.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';
import 'package:get/get.dart';

class PendingPayment extends StatefulWidget {
  final String totalPrice;
  final String nights;
  final String room;

  PendingPayment({
    required this.room,
    required this.totalPrice,
    required this.nights,
  });

  @override
  State<PendingPayment> createState() => _PendingPaymentState();
}

class _PendingPaymentState extends State<PendingPayment> {
  final UserController _userController = Get.find();
  bool isProcessing = true;

  @override
  void initState() {
    super.initState();
    _simulatePaymentProcess();
  }

  void _simulatePaymentProcess() async {
    await Future.delayed(Duration(seconds: 5)); // Simulate payment delay
    setState(() {
      isProcessing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Karas.primary,
        foregroundColor: Colors.white,
        title: Text(
          'Payment Confirmation',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPaymentPrompt(),
            const SizedBox(height: 20),
            Expanded(
              child: isProcessing
                  ? Center(
                child: SizedBox(
                  width: 50,
                  child: LoadingIndicator(
                    indicatorType: Indicator.squareSpin,
                    colors: [Karas.primary],
                  ),
                ),
              )
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 50,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Payment Successful!',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('Wait for the lodge manager to approve', style: TextStyle(fontWeight: FontWeight.w200),),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Get.offAll(PageAnchor()); // Navigate back or to the next screen
                      },
                      child: Text('Back to Home'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentPrompt() {
    String userPhone = _userController.user.first.phone;
    bool isAirtel = userPhone.contains('097');

    return Stack(
      children: [
        Container(
          color: Karas.primary,
          height: 50,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9),
                    bottomLeft: Radius.circular(9),
                  ),
                  child: Image.asset(
                    'assets/${isAirtel ? 'airtel.jpg' : 'mtn.png'}',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'A prompt message has been initiated on $userPhone. '
                        'Confirm with your PIN to approve the payment of K${widget.totalPrice}.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
