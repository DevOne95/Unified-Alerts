import 'package:get/get.dart';
import 'package:unified_alerts/src/Account/model/account_model.dart';

const accounts = [
  {
    "systemName": "GitHub",
    "systemUrl": "https://github.com",
    "systemLogo":
        "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
    "username": "johndoe",
    "email": "johndoe@example.com",
    "loginHistory": [
      {
        "loginDate": "2024-10-10T10:15:00",
        "ipAddress": "192.168.1.1",
        "device": "Windows 10 - Chrome",
        "location": "New York, USA"
      },
      {
        "loginDate": "2024-09-20T12:30:00",
        "ipAddress": "192.168.1.2",
        "device": "macOS - Safari",
        "location": "Los Angeles, USA"
      }
    ]
  },
  {
    "systemName": "Google",
    "systemUrl": "https://google.com",
    "systemLogo":
        "https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_2015_logo.svg",
    "username": "johndoe",
    "email": "johndoe@gmail.com",
    "loginHistory": [
      {
        "loginDate": "2024-10-12T08:45:00",
        "ipAddress": "203.0.113.5",
        "device": "Android Phone",
        "location": "London, UK"
      },
      {
        "loginDate": "2024-09-30T18:15:00",
        "ipAddress": "203.0.113.6",
        "device": "Windows 11 - Edge",
        "location": "Berlin, Germany"
      }
    ]
  },
  {
    "systemName": "Facebook",
    "systemUrl": "https://facebook.com",
    "systemLogo": "https://static.xx.fbcdn.net/rsrc.php/y1/r/4lCu2zih0ca.svg",
    "username": "john_doe123",
    "email": "johndoe123@example.com",
    "loginHistory": [
      {
        "loginDate": "2024-10-13T14:10:00",
        "ipAddress": "198.51.100.7",
        "device": "iPhone - Safari",
        "location": "Paris, France"
      },
      {
        "loginDate": "2024-09-22T10:05:00",
        "ipAddress": "198.51.100.8",
        "device": "Windows 10 - Firefox",
        "location": "Toronto, Canada"
      }
    ]
  }
];

class AccountController extends GetxController {
  RxList<AccountModel> accountList = RxList<AccountModel>(
    accounts.map((account) => AccountModel.fromJson(account)).toList(),
  ).obs();
}
