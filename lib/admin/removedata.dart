import 'package:eas/admin/adddata.dart';
import 'package:eas/colors.dart';
import 'package:eas/managedata/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Removefromfirestore extends StatelessWidget {
  late final String category;
  Removefromfirestore({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        title: Text("remove from " + category),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "Phone",
                focusedBorder: outlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                border: outlineInputBorder(),
                enabledBorder: outlineInputBorder(),
                disabledBorder: outlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              if (controller.text == "") {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => alert(context));
              } else {
                int flag = await removefromfirebase(controller.text, category);
                if (flag == 0) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => success(context));
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => failed(context));
                }
              }
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: MyColors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text("Submit"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
