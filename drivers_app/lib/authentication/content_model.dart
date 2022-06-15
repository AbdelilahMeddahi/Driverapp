class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Make money',
    image: 'images/img1.svg',
    discription: "With increased Prime Time pricing during peak hours,you make more with Quicki Taxi"
  ),
  UnbordingContent(
    title: 'Accept a Job',
    image: 'images/img2.svg',
    discription: "Work with your convenience, take the job whenever you need it. "
  ),
  UnbordingContent(
    title: 'Tracking Real  ''    Time',
    image: 'images/img3.svg',
    discription: "Know where your costumer is currently located with the real time tracking"
  ),
];
