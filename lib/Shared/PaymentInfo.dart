import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/CartCubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'Components.dart';

class PaymentInfo extends StatefulWidget {
  final String amount;
  List<Map<String, dynamic>> items = [];
  PaymentInfo({
    required this.amount,
    required this.items,
  });
  @override
  _PaymentInfo createState() => _PaymentInfo();
}

class _PaymentInfo extends State<PaymentInfo> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _birthYearController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String get amount => widget.amount;
  List<Map<String, dynamic>> get items=> widget.items;
  bool _isLoading = false;


  @override
  void dispose() {
    _mobileNumberController.dispose();
    _birthYearController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    setState(() {
      _isLoading = true;
    });

    // Make the API request
    final url = Uri.parse('https://api.plutus.ly/api/v1/transaction/sadadapi/verify');
    final headers = <String, String>{
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWU5Mjg3NmUxMjA2ZTdjMmE3MDNkNjNjN2IzM2Y3OWFhOWJmODE5ZWNjZmFkMWJjZGY2ZWQzOGQwYWYzMTJjM2E2YWRiOWNiOTQ3MTc3YjEiLCJpYXQiOjE2ODk3MjYzNjYuNzA2NTc4MDE2MjgxMTI3OTI5Njg3NSwibmJmIjoxNjg5NzI2MzY2LjcwNjU4MTExNTcyMjY1NjI1LCJleHAiOjIwMDUzNDU1NjYuNjk3ODk3OTExMDcxNzc3MzQzNzUsInN1YiI6IjY0NiIsInNjb3BlcyI6WyJzYW5kYm94Il19.J8jGsJvPcP5zl8CyDaAgmA4vz3bOfWHJYmPILXjrYHzV_06UiCP6EyBK_zSYHFCEMiT-L9SF1nMqEqnSyNoQHkxOz1C2h91Kk6IBLYe-Z7OvlEOp5E0-R69v9dl0FHHHIcbd_ZxJo6qqGgO7nqXe2Ydy1aQ75qbSRoU2jF72HhKn121ZPlIBEfjf_noxHKx5u_zzhsjJTXMVsYZEQVbIKhgCxwQC42QQTl3zW6DVHFvjdQch8LKkQPTElroKs0xAUcSGAI4ryncRA0J3B9dG0-eSz2dyLOL8YmxKKp6P4G6cv7A5DBoLahNoadw1ua8rbjwGA4FuHeGYUi0rdhsM16jr-_myU1-5T4YPdDq2NFsh508_jq_g5fPBd-BrIDCid2URjuj6L54Z-_Ns54ERPdp5h2XKDFaKSL0UB7_i_bodG1TRxOfuMvLbUx_4BXqXO3P2n8Ubm7_igV5j_vbUZQLAJt93J4Hq0xckeRq6VhhDYUDGvg2ZuKkSHwGCPbcDbC0OPtxpOgx0B8wr0-qVb-P7PPkXa-ptJCAn9a2ijBXrTqyo30lL5OQxFZ_QGgG_f1BKpUdMbmlJqZj2JQY5E2tetU-t36kZ2WvNiNqNmtcacU9obmVny6CMt4UDcwIeqspymNFJ8b_EgfsG3_-1XRy_SIt78U6zluyz1bgFxLA',
      'x-api-key': '984adf4c-44e1-418f-829b',
    };
    final body = <String, String>{
      'mobile_number': _mobileNumberController.text,
      'birth_year': _birthYearController.text,
      'amount': amount,
    };
    final response = await http.post(url, headers: headers, body: body);

    setState(() {
      _isLoading = false;
    });

    // Show the OTP input modal if the response is successful
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final processId = responseData['result']['process_id'];
      print("---------------${processId}----------------");
      await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return _buildOTPInputModal(processId);
        },
      );
    } else {
      print("-------------ERROR------------");
    }
  }

  Widget _buildOTPInputModal(int processId) {


    return Container(
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ادخل رمز التحقق OTP'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'OTP',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('الغاء'),
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  final url = Uri.parse('https://api.plutus.ly/api/v1/transaction/sadadapi/confirm');
                  final headers = <String, String>{
                    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWU5Mjg3NmUxMjA2ZTdjMmE3MDNkNjNjN2IzM2Y3OWFhOWJmODE5ZWNjZmFkMWJjZGY2ZWQzOGQwYWYzMTJjM2E2YWRiOWNiOTQ3MTc3YjEiLCJpYXQiOjE2ODk3MjYzNjYuNzA2NTc4MDE2MjgxMTI3OTI5Njg3NSwibmJmIjoxNjg5NzI2MzY2LjcwNjU4MTExNTcyMjY1NjI1LCJleHAiOjIwMDUzNDU1NjYuNjk3ODk3OTExMDcxNzc3MzQzNzUsInN1YiI6IjY0NiIsInNjb3BlcyI6WyJzYW5kYm94Il19.J8jGsJvPcP5zl8CyDaAgmA4vz3bOfWHJYmPILXjrYHzV_06UiCP6EyBK_zSYHFCEMiT-L9SF1nMqEqnSyNoQHkxOz1C2h91Kk6IBLYe-Z7OvlEOp5E0-R69v9dl0FHHHIcbd_ZxJo6qqGgO7nqXe2Ydy1aQ75qbSRoU2jF72HhKn121ZPlIBEfjf_noxHKx5u_zzhsjJTXMVsYZEQVbIKhgCxwQC42QQTl3zW6DVHFvjdQch8LKkQPTElroKs0xAUcSGAI4ryncRA0J3B9dG0-eSz2dyLOL8YmxKKp6P4G6cv7A5DBoLahNoadw1ua8rbjwGA4FuHeGYUi0rdhsM16jr-_myU1-5T4YPdDq2NFsh508_jq_g5fPBd-BrIDCid2URjuj6L54Z-_Ns54ERPdp5h2XKDFaKSL0UB7_i_bodG1TRxOfuMvLbUx_4BXqXO3P2n8Ubm7_igV5j_vbUZQLAJt93J4Hq0xckeRq6VhhDYUDGvg2ZuKkSHwGCPbcDbC0OPtxpOgx0B8wr0-qVb-P7PPkXa-ptJCAn9a2ijBXrTqyo30lL5OQxFZ_QGgG_f1BKpUdMbmlJqZj2JQY5E2tetU-t36kZ2WvNiNqNmtcacU9obmVny6CMt4UDcwIeqspymNFJ8b_EgfsG3_-1XRy_SIt78U6zluyz1bgFxLA',
                    'x-api-key': '984adf4c-44e1-418f-829b',
                  };
                  final body = <String, String>{
                    'process_id': processId.toString(),
                    'amount': amount.toString(),
                    'code': _otpController.text.toString(),
                    'invoice_no': '1',
                  };
                  final response = await http.post(url, headers: headers, body: body);
                  setState(() {
                    _isLoading = false;
                  });
                  if (response.statusCode == 200) {
                    print("coooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
                    // List<Map<String, dynamic>> items = BlocProvider.of<CartCubit>(context).state;
                    print("${items}");
                    saveProcessData(items);
                    print("ciiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");

                    BlocProvider.of<CartCubit>(context).deleteAllItems();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    showSuccessToast("تمت عملية التبرع بنجاح !",context);
                  } else {
                    print("noooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
                  }
                },
                child: Text('تأكيد'),
              ),
            ],
          ),
        ],
      ),
    );
  }
   void saveProcessData(List<Map<String, dynamic>> items) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    if(items.length>0) {
      for (var item in items) {
        // You can access the properties of each item using item['propertyName']
        String itemId = item['id'];
        String section = item['section'];

        // Create a document reference with a unique ID
        DocumentReference documentRef = firestore.collection(section).doc(
            itemId);
        int total = (item["total"]);
        int paid = (item['amount']);
        total = total + paid;
        print(total);
        // Create a map of data to be stored in Firestore
        Map<String, dynamic> itemData = {
          "image": item['image'],
          "title": item['title'],
          "description": item['description'],
          "req": item['req'],
          "mostafid": item["mostafid"],
          "location": item["location"],
          "date": item["date"],
          "total": total,
          "section": item["section"],
          "uId": item["uId"]
        };
        await documentRef.set(itemData)
            .then((value) => print('Item with ID $itemId sent to Firestore.'))
            .catchError((error) =>
            print('Error sending item with ID $itemId: $error'));
      }
    }
    else
      {
        // TO DO
        print("======================== nothing=========================");
      }
  }

  @override
  Widget build(BuildContext context) {
    _amountController.text=amount.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('نموذج التبرع'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 16.0),
                TextField(
                  controller: _mobileNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'رقم الهاتف',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _birthYearController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'سنة الميلاد',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'القيمة',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('ارسال'),
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}