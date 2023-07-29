import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteAccount extends StatefulWidget {
  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User _user;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('حذف حساب مدير قسم'),
        ),
        body: _isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('users').where('desc', whereNotIn: ['admin', 'user']).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final documents = snapshot.data!.docs.where((doc) => doc.id != _user.uid).toList();

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final user = documents[index];
                return Card(
                  child: ListTile(
                    title: Text(user['name']),
                    subtitle: Text(user['email']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _showConfirmationDialog(user.id),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _showConfirmationDialog(String userId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('حذف الحساب'),
        content: Text('هل أنت متأكد من حذف الحساب'),
        actions: [
          TextButton(
            child: Text('إلغاء'),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: Text('حذف'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirmed != null && confirmed) {
      _deleteUser(userId);
    }
  }

  void _deleteUser(String userId) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _firestore.collection('users').doc(userId).delete();
      await _auth.currentUser!.delete();

      Fluttertoast.showToast(
        msg: 'تم حذف الحساب ينجاح',
        backgroundColor: Colors.green,
      );

      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(
        msg: ' فشلت عملية الحذف : ${e.toString()}',
        backgroundColor: Colors.red,
      );

      setState(() {
        _isLoading = true;
      });
    }
  }
}