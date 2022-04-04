import 'package:feedback_capture/dbhelper/db_helper.dart';
import 'package:feedback_capture/dbhelper/imagedb_helper.dart';
import 'package:feedback_capture/views/pages/feedback_show.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FeedbackList extends StatefulWidget {
  const FeedbackList({Key? key}) : super(key: key);

  @override
  State<FeedbackList> createState() => _FeedbackListState();
}

class _FeedbackListState extends State<FeedbackList> {
  final dbHelper = DBHelper.instance;
  final imagedbHelper = ImageDBHelper.instance;
  String? userMail;
  int len = 0;
  Future<List> getAll(String email) async {
    var row = await dbHelper.getData(email);
    len = row.length;
    return row;
  }

  @override
  void initState() {
    super.initState();
    userMail = GetStorage().read("email");
    getAll(userMail!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getAll(userMail!),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          if (snapshot.hasError) {
            return const Center(
              child: Text("Some Error Occured"),
            );
          }
          return ListView.builder(
              itemCount: len,
              itemBuilder: (context, i) {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                  child: ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          Get.to(
                            FeedbackShow(
                              colId: (snapshot.data! as List)[i]['columnIndex'],
                              selectedOutletValue: (snapshot.data! as List)[i]
                                  ['OutletValue'],
                              selectedFeedbackValue: (snapshot.data! as List)[i]
                                  ['FeedbackValue'],
                              selectedCompanyValue: (snapshot.data! as List)[i]
                                  ['CompanyValue'],
                              selectedProductValue: (snapshot.data! as List)[i]
                                  ['ProductValue'],
                              selectedCategoryValue: (snapshot.data! as List)[i]
                                  ['CategoryValue'],
                              selectedSubCategoryValue: (snapshot.data!
                                  as List)[i]['SubCategoryValue'],
                              selectedGenreOfFeedback: (snapshot.data!
                                  as List)[i]['GenreOfFeedback'],
                              selectedFeedback: (snapshot.data! as List)[i]
                                  ['Feedback'],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        )),
                    tileColor: Colors.grey[200],
                    title: Text(
                        "Outlet Name: ${(snapshot.data! as List)[i]['OutletValue']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Category: ${(snapshot.data! as List)[i]['CategoryValue']}"),
                        Text(
                            "Sub Category: ${(snapshot.data! as List)[i]['SubCategoryValue']}"),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
