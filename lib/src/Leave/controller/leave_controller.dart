import 'package:get/get.dart';
import 'package:unified_alerts/src/Leave/model/leave_credit_model.dart';
import 'package:unified_alerts/src/Leave/model/leave_model.dart';

const data = [
  {
    "id": 1,
    "employeeId": "EMP001",
    "name": "John Doe",
    "leaveType": "Vacation",
    "startDate": "2024-10-20",
    "endDate": "2024-10-25",
    "status": "Approved",
    "reason": "Family vacation",
    "timeline": [
      {
        "status": "Requested",
        "date": "2024-10-15T09:00:00",
        "description": "Leave request submitted."
      },
      {
        "status": "Approved by HR",
        "date": "2024-10-16T10:00:00",
        "description": "HR has approved the leave request."
      },
      {
        "status": "Approved by Division Head",
        "date": "2024-10-17T11:00:00",
        "description": "Division Head approved the leave."
      },
      {
        "status": "Approved by Chief",
        "date": "2024-10-18T12:00:00",
        "description": "Chief has finalized the approval."
      }
    ]
  },
  {
    "id": 2,
    "employeeId": "EMP001",
    "name": "John Doe",
    "leaveType": "Sick",
    "startDate": "2024-10-15",
    "endDate": "2024-10-17",
    "status": "Pending",
    "reason": "Flu",
    "timeline": [
      {
        "status": "Requested",
        "date": "2024-10-10T09:30:00",
        "description": "Leave request submitted due to flu."
      }
    ]
  },
  {
    "id": 3,
    "employeeId": "EMP001",
    "name": "John Doe",
    "leaveType": "Vacation",
    "startDate": "2024-11-05",
    "endDate": "2024-11-10",
    "status": "Approved",
    "reason": "Trip to Europe",
    "timeline": [
      {
        "status": "Requested",
        "date": "2024-10-01T10:00:00",
        "description": "Leave request submitted for a trip."
      },
      {
        "status": "Approved by HR",
        "date": "2024-10-02T11:00:00",
        "description": "HR has approved the leave request."
      },
      {
        "status": "Approved by Division Head",
        "date": "2024-10-03T12:00:00",
        "description": "Division Head approved the leave."
      },
      {
        "status": "Approved by Chief",
        "date": "2024-10-04T13:00:00",
        "description": "Chief has finalized the approval."
      }
    ]
  },
  {
    "id": 4,
    "employeeId": "EMP001",
    "name": "John Doe",
    "leaveType": "Sick",
    "startDate": "2024-09-30",
    "endDate": "2024-10-01",
    "status": "Declined",
    "reason": "Migraine",
    "timeline": [
      {
        "status": "Requested",
        "date": "2024-09-29T08:00:00",
        "description": "Leave request submitted for migraine."
      },
      {
        "status": "Declined by HR",
        "date": "2024-09-30T09:30:00",
        "description": "HR has declined the leave request."
      }
    ]
  },
  {
    "id": 5,
    "employeeId": "EMP001",
    "name": "John Doe",
    "leaveType": "Vacation",
    "startDate": "2024-12-15",
    "endDate": "2024-12-20",
    "status": "Approved",
    "reason": "Christmas holiday",
    "timeline": [
      {
        "status": "Requested",
        "date": "2024-11-01T10:30:00",
        "description": "Leave request submitted for Christmas holiday."
      },
      {
        "status": "Approved by HR",
        "date": "2024-11-02T11:00:00",
        "description": "HR has approved the leave request."
      },
      {
        "status": "Approved by Division Head",
        "date": "2024-11-03T12:00:00",
        "description": "Division Head approved the leave."
      },
      {
        "status": "Approved by Chief",
        "date": "2024-11-04T13:00:00",
        "description": "Chief has finalized the approval."
      }
    ]
  },
  {
    "id": 6,
    "employeeId": "EMP001",
    "name": "John Doe",
    "leaveType": "Sick",
    "startDate": "2024-10-10",
    "endDate": "2024-10-12",
    "status": "Approved",
    "reason": "Stomach flu",
    "timeline": [
      {
        "status": "Requested",
        "date": "2024-10-09T08:15:00",
        "description": "Leave request submitted due to stomach flu."
      },
      {
        "status": "Approved by HR",
        "date": "2024-10-10T09:45:00",
        "description": "HR has approved the leave request."
      },
      {
        "status": "Approved by Division Head",
        "date": "2024-10-11T10:15:00",
        "description": "Division Head approved the leave."
      },
      {
        "status": "Approved by Chief",
        "date": "2024-10-12T11:00:00",
        "description": "Chief has finalized the approval."
      }
    ]
  },
  {
    "id": 7,
    "employeeId": "EMP001",
    "name": "John Doe",
    "leaveType": "Vacation",
    "startDate": "2024-11-25",
    "endDate": "2024-11-30",
    "status": "Pending",
    "reason": "Beach vacation",
    "timeline": [
      {
        "status": "Requested",
        "date": "2024-11-15T09:00:00",
        "description": "Leave request submitted for beach vacation."
      }
    ]
  },
  {
    "id": 8,
    "employeeId": "EMP001",
    "name": "John Doe",
    "leaveType": "Sick",
    "startDate": "2024-09-20",
    "endDate": "2024-09-22",
    "status": "Approved",
    "reason": "Cold",
    "timeline": [
      {
        "status": "Requested",
        "date": "2024-09-19T08:30:00",
        "description": "Leave request submitted for cold."
      },
      {
        "status": "Approved by HR",
        "date": "2024-09-20T09:00:00",
        "description": "HR has approved the leave request."
      },
      {
        "status": "Approved by Division Head",
        "date": "2024-09-21T10:00:00",
        "description": "Division Head approved the leave."
      },
      {
        "status": "Approved by Chief",
        "date": "2024-09-22T11:00:00",
        "description": "Chief has finalized the approval."
      }
    ]
  },
  {
    "id": 9,
    "employeeId": "EMP001",
    "name": "John Doe",
    "leaveType": "Vacation",
    "startDate": "2024-11-01",
    "endDate": "2024-11-07",
    "status": "Approved",
    "reason": "Visit family",
    "timeline": [
      {
        "status": "Requested",
        "date": "2024-10-15T10:30:00",
        "description": "Leave request submitted for family visit."
      },
      {
        "status": "Approved by HR",
        "date": "2024-10-16T11:00:00",
        "description": "HR has approved the leave request."
      },
      {
        "status": "Approved by Division Head",
        "date": "2024-10-17T12:00:00",
        "description": "Division Head approved the leave."
      },
      {
        "status": "Approved by Chief",
        "date": "2024-10-18T13:00:00",
        "description": "Chief has finalized the approval."
      }
    ]
  },
  {
    "id": 10,
    "employeeId": "EMP001",
    "name": "John Doe",
    "leaveType": "Sick",
    "startDate": "2024-10-05",
    "endDate": "2024-10-08",
    "status": "Approved",
    "reason": "Back pain",
    "timeline": [
      {
        "status": "Requested",
        "date": "2024-10-04T08:00:00",
        "description": "Leave request submitted for back pain."
      },
      {
        "status": "Approved by HR",
        "date": "2024-10-05T09:00:00",
        "description": "HR has approved the leave request."
      },
      {
        "status": "Approved by Division Head",
        "date": "2024-10-06T10:00:00",
        "description": "Division Head approved the leave."
      },
      {
        "status": "Approved by Chief",
        "date": "2024-10-07T11:00:00",
        "description": "Chief has finalized the approval."
      }
    ]
  }
];

const leaveCredit = {
  "employeeId": "E12345",
  "employeeName": "John Doe",
  "leaveCredits": {
    "totalLeave": 30,
    "usedLeave": {"sickLeave": 5, "vacationLeave": 10, "personalLeave": 2},
    "remainingLeave": {
      "sickLeave": 15,
      "vacationLeave": 20,
      "personalLeave": 8
    },
    "leaveTypes": [
      {
        "leaveType": "Sick Leave",
        "totalCredits": 15,
        "usedCredits": 5,
        "remainingCredits": 10
      },
      {
        "leaveType": "Vacation Leave",
        "totalCredits": 20,
        "usedCredits": 10,
        "remainingCredits": 10
      },
      {
        "leaveType": "Personal Leave",
        "totalCredits": 10,
        "usedCredits": 2,
        "remainingCredits": 8
      }
    ]
  },
  "lastUpdated": "2024-10-15T14:30:00Z"
};

class LeaveController extends GetxController {
  RxList<LeaveModel> leaves = RxList<LeaveModel>(
          data.map((leave) => LeaveModel.fromJson(leave)).toList())
      .obs();

  Rxn<LeaveCreditModel> credit =
      Rxn<LeaveCreditModel>(LeaveCreditModel.fromJson(leaveCredit)).obs();
}
