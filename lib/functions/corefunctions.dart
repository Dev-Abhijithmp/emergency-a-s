import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eas/functions/geolocation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sms_advanced/sms_advanced.dart';
import 'package:url_launcher/url_launcher.dart';

void sendmessage(String address, String messages) async {
  SmsSender sender = SmsSender();

  SmsMessage message = SmsMessage(address, messages);

  try {
    await sender.sendSms(message);
  } catch (e) {
    print(e.toString());
  }
}

Future<void> makecall(String number) async {
  Uri url = Uri.parse("tel:$number");
  await canLaunchUrl(url)
      ? await launchUrl(url)
      : Fluttertoast.showToast(msg: "can't call now");
}

Future<DocumentSnapshot> findnearest(
    List<DocumentSnapshot> data, Position position) async {
  List<double> tempdistance = [];

  for (var item in data) {
    double dis = await getdistance(position.latitude, position.longitude,
        item['loc'].latitude, item['loc'].longitude);
    print(dis.toString());
    tempdistance.add(dis);
  }
  double minimum = tempdistance
      .reduce((value, element) => value < element ? value : element);
  print(minimum);
  int index = tempdistance.indexOf(minimum);
  print(index.toString());
  return data[index];
}
