import 'package:feedback_capture/dbhelper/db_helper.dart';
import 'package:feedback_capture/dbhelper/imagedb_helper.dart';
import 'package:flutter/material.dart';

class FeedbackList extends StatefulWidget {
  const FeedbackList({Key? key}) : super(key: key);

  @override
  State<FeedbackList> createState() => _FeedbackListState();
}

class _FeedbackListState extends State<FeedbackList> {
  final dbHelper = DBHelper.instance;
  final imagedbHelper = ImageDBHelper.instance;

  int len = 0;
  Future<List> getAll() async {
    var row = await dbHelper.getData();
    len = row.length;
    return row;
  }

  @override
  void initState() {
    super.initState();
    getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback List"),
      ),
      body: FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return const Center(
              child: Text("No Data Found"),
            );
          }
          if (snapshot.hasData) {
            // return Center(
            //     child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(snapshot.data.toString()),
            // ));
            return ListView.builder(
              itemCount: len,
              itemBuilder: (context, index) {
                return ListTile(
                  // title: Text(snapshot.data![]['columnIndex'].toString()),
                  title: Text(snapshot.data!.toString()),
                );
              },
            );
          }
          return const Text("No Data Found");
        },
      ),
    );
  }
}
