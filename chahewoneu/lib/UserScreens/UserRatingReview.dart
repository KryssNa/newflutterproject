import 'dart:io';
import 'package:chahewoneu/viewmodels/authenti_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../models/ratingreview_model.dart';

class UserRatingReview extends StatefulWidget {
  const UserRatingReview({Key? key}) : super(key: key);

  @override
  State<UserRatingReview> createState() => _UserRatingReviewState();
}

class _UserRatingReviewState extends State<UserRatingReview> {
  TextEditingController review = new TextEditingController();
  final form = GlobalKey<FormState>();
  double newRating = 0.0;
  hintStyle() {
    const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
  formsOutline() {
    OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(30));
  }
  Future<void> submitRatingReview(AuthViewModel auth) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final data = RatingReviewModel(
      rating: "$newRating",
      review: review.text,
      username: auth.loggedInUser!.username.toString()
    );
    db.collection("ratingreview").add(data.toJson()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Rating and review submitted ")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, auth, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Rating and review'),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: form,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Rating and Review',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            newRating = rating;
                            print(rating);
                          });
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            controller: review,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "review is required";
                              }
                              if (!RegExp(r"^[a-zA-Z]").hasMatch(value)) {
                                return "Please review ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: "Review",
                              hintStyle: hintStyle(),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                submitRatingReview(auth);
                              },
                              child: const Text("Submit"))
                        ],
                      ),
                    ]),
              ),
            ));
      }
    );
  }
}
