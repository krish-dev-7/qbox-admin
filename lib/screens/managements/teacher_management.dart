import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qbox_admin/models/teacher_model.dart';
import 'package:qbox_admin/utilities/dimensions.dart';

class TeacherManagement extends StatefulWidget {
  const TeacherManagement({Key? key}) : super(key: key);

  @override
  State<TeacherManagement> createState() => _TeacherManagementState();
}

class _TeacherManagementState extends State<TeacherManagement> {
  final _teacherFormKey = GlobalKey<FormState>();
  final _teacherController = TextEditingController();
  bool _signUpFetching = false;
  // final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  double? titleSize;
  double? padding;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmedPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _roleController = TextEditingController();
  final _courseController = TextEditingController();
  final _subjectController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmedPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _roleController.dispose();
  }

  // String? errorMessage;
  @override
  Widget build(BuildContext context) {
    double padding20 = MediaQuery.of(context).size.height * (20 / 1563);
    if ((MediaQuery.of(context).size.width) <= 600) {
      padding = MediaQuery.of(context).size.width * (150 / 1563);
      titleSize = 60;
      //smallTextSize = MediaQuery.of(context).size.width * (32 / 1563);
    } else if (MediaQuery.of(context).size.width <= 1000) {
      padding = MediaQuery.of(context).size.width * (300 / 1563);
      titleSize = 60;
      //smallTextSize = MediaQuery.of(context).size.width * (32 / 1563);
    } else {
      padding = MediaQuery.of(context).size.width * (450 / 1563);
      titleSize = MediaQuery.of(context).size.width * (78 / 1563);
      //smallTextSize = 15;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: SingleChildScrollView(
                    child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return AlertDialog(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Add Teacher'),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                },
                                icon: const Icon(Icons.close_rounded))
                          ],
                        ),
                        contentPadding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * (2 / 153.6)),
                        content: Form(
                          key: _teacherFormKey,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                (700 / 1563),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(padding20 / 2),
                                  child: TextFormField(
                                    controller: _firstNameController,
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      _firstNameController.text = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please Enter Your First Name");
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      hintText: "First Name",
                                      fillColor: Colors.grey[100],
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(padding20 / 2),
                                  child: TextFormField(
                                    controller: _lastNameController,
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      _lastNameController.text = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please Enter Your Last Name");
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      hintText: "Last Name",
                                      fillColor: Colors.grey[100],
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(padding20 / 2),
                                  child: TextFormField(
                                    controller: _phoneNumberController,
                                    keyboardType: TextInputType.number,
                                    onSaved: (value) {
                                      _phoneNumberController.text = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please Enter Your Phone Number");
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      hintText: "Phone Number",
                                      fillColor: Colors.grey[100],
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(padding20 / 2),
                                  child: TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) {
                                      _emailController.text = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please Enter Your Email");
                                      }
                                      if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return ("Please Enter a valid email");
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      hintText: "Email",
                                      fillColor: Colors.grey[100],
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(padding20 / 2),
                                  child: TextFormField(
                                    controller: _subjectController,
                                    onSaved: (value) {
                                      _subjectController.text = value!;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      hintText: "Subject",
                                      fillColor: Colors.grey[100],
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(padding20 / 2),
                                  child: TextFormField(
                                    controller: _courseController,
                                    onSaved: (value) {
                                      _courseController.text = value!;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      hintText: "Course",
                                      fillColor: Colors.grey[100],
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(padding20 / 2),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _passwordController,
                                    onSaved: (value) {
                                      _passwordController.text = value!;
                                    },
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      RegExp regex = RegExp(r'^.{6,}$');
                                      if (value!.isEmpty) {
                                        return ("Password is required for signUp");
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("Enter Valid Password(Min. 6 Character)");
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      hintText: "password",
                                      fillColor: Colors.grey[100],
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(padding20 / 2),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _confirmedPasswordController,
                                    onSaved: (value) {
                                      _confirmedPasswordController.text =
                                          value!;
                                    },
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      RegExp regex = RegExp(r'^.{6,}$');
                                      if (value!.isEmpty) {
                                        return ("Password is required for signUp");
                                      }
                                      if (_passwordController.text !=
                                          _confirmedPasswordController.text) {
                                        return ("Password should be same");
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("Enter Valid Password(Min. 6 Character)");
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius12),
                                      ),
                                      hintText: "confirm password",
                                      fillColor: Colors.grey[100],
                                      filled: true,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      (40 / 792),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _signUpFetching = true;
                                    });
                                    signUp();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(padding20 / 2),
                                    child: Container(
                                      width: double.infinity,
                                      height: 51,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.borderRadius5),
                                      ),
                                      child: Center(
                                        child: _signUpFetching
                                            ? const CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : const Text(
                                                "Create Teacher",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              });
        },
        label: const Text("Add Teacher"),
      ),
      body: Container(
        padding:
            EdgeInsets.all(MediaQuery.of(context).size.width * (1 / 153.6)),
        child: Column(
          children: [
            Text(
              'Teachers',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 32,
              ),
            ),
            const Divider(
              color: Colors.amberAccent,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * (1 / 153.6),
                ),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('teachers')
                        .where("role", isEqualTo: "teacher")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong!');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      // var data = snapshot.data!.docs[0].data();

                      return ListView(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot documentSnapshot) {
                          Map<String, dynamic> data =
                              documentSnapshot.data()! as Map<String, dynamic>;
                          return ListTile(
                            title: Text(
                                data['firstName'] + " " + data['lastName']),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
                            ),
                          );
                        }).toList(),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    if (_teacherFormKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      try {
        await _auth
            .createUserWithEmailAndPassword(
                email: email, password: _passwordController.text.trim())
            .then((uid) => {
                  setState(() {
                    _signUpFetching = false;
                  }),
                  Fluttertoast.showToast(msg: 'Sign Up Successful'),
                  // Navigator.popAndPushNamed(context, HomePage.routeName),
                  Navigator.pop(context)
                });
        await FirebaseFirestore.instance
            .collection('teachers')
            .doc(email)
            .set(TeacherModel(
              firstName: _firstNameController.text.trim(),
              lastName: _lastNameController.text.trim(),
              phoneNumber: int.parse(_phoneNumberController.text.trim()),
              email: email,
              role: "teacher",
              courses: [_courseController.text.trim()],
              subjects: [_subjectController.text.trim()],
            ).toJson())
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
    setState(() {
      _signUpFetching = false;
    });
  }
}
