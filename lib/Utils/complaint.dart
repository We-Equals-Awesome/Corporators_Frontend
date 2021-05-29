//class complaints
// Dummy complaint

class Complaint {
  final String title;
  final String time;
  final String status;


  Complaint({

    this.title,
    this.time,
    this.status,
  });
}

List<Complaint> complaintList = [
  Complaint(
    title: "Title",
    time: "20/11/20",
    status:"Active",
  ),
  Complaint(
    title: "Drainage",
    time: "20/11/20",
    status:"Active",
  ),
  Complaint(
    title: "Electric",
    time: "11/11/20",
    status:"Active",
  ),
  Complaint(
    title: "Sewage",
    time: "22/05/20",
    status:"Closed",
  ),
  Complaint(
    title: "Issue No 23",
    time: "01/11/20",
    status:"Active",
  ),
  Complaint(
    title: "Drainage text over flow check",
    time: "20/11/20",
    status:"Closed",
  ),
];
