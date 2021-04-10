class News {
  final String title;
  final String subtitle;
  final String content;
  final String time;
  final String author;
  final int seen;
  final int favorite;
  final String image;

  News({
    this.author,
    this.content,
    this.favorite,
    this.image,
    this.seen,
    this.subtitle,
    this.time,
    this.title,
  });
}

List<News> trendingList = [
  News(
    author: "Dhiraj Gupta",
    favorite: 700,
    seen: 45,
    time: "Posted on 11/02/21 at 12:51 PM",
    title: "Bad road condition in my locality",
    image:
    "https://media.istockphoto.com/photos/broken-road-in-the-woods-picture-id531854696?s=612x612",
    subtitle:
    "Pavement with inadequate skid resistance. Hazards obstructing visibility at intersections and crosswalks. Absent, defective or improper warning signs.",
    content:
    "Auto accidents often occur in construction zones. Even after road construction has been completed, the actions of construction workers could increase the risk of a crash. Failure to properly follow approved plans, the uses sub-par materials or poor workmanship can all decrease the quality of road conditions and increase the likelihood of a collision. The government may try to argue that these types of wrecks are a direct result of driver error; however, bad road conditions are often a major contributing factor in these accidents. ",
  ),
  News(
    author: "Chaitanya Kumar",
    favorite: 502,
    seen: 121,
    time: "Posted on 31/11/20 at 12:51 PM",
    title: "Big Hole in the road",
    image:
    "https://media.istockphoto.com/photos/of-holes-road-for-cars-picture-id490064147?s=612x612",
    subtitle:
    "Ignoring evidence that accidents keep occurring on a certain road due to bad conditions , Changing patterns by pedestrians and vehicles ",
    content:
    "Even the best designed and constructed roads require routine maintenance in order to keep them safe. When road surfaces become damaged with potholes, for example, a car may hit the hole at an odd angle, causing the vehicle to spin and collide with other vehicles and obstacles in the road. Old guardrails are also often overlooked; they can become hazardous when they lose the strength necessary to keep vehicles on the road.",
  ),
  News(
    author: "Pratik Tiwari",
    favorite: 23,
    seen: 4051,
    time: "Posted on 18/03/21 at 16:51 PM",
    title: "Dangerous street drop-offs, like ravines or cliffs",
    image:
    "https://assets.change.org/photos/2/ma/ye/cqmaYEcvkOVzQbb-800x450-noPad.jpg?1509361645",
    subtitle:
    "Even the best designed and constructed roads require routine maintenance in order to keep them safe. When road surfaces become damaged with potholes, for example, a car may hit the hole at an odd angle, causing the vehicle to spin and collide with other vehicles and obstacles in the road.",
    content:
    "Even the best designed and constructed roads require routine maintenance in order to keep them safe. When road surfaces become damaged with potholes, for example, a car may hit the hole at an odd angle, causing the vehicle to spin and collide with other vehicles and obstacles in the road. Old guardrails are also often overlooked; they can become hazardous when they lose the strength necessary to keep vehicles on the road.",
  ),
  News(
    author: "Shubham J",
    favorite: 12,
    seen: 301,
    time: "Posted on 15/01/21 at 14:15 PM",
    title: " Hazards obstructing visibility at intersections and crosswalks",
    image:
    "https://media.istockphoto.com/photos/broken-road-in-the-woods-picture-id531854696?s=612x612",
    subtitle:
    "Poorly-maintained roads cause half of the fatal auto accidents that happen each year in the United States",
    content:
    "An 18-month study conducted by The Pacific Institute for Research and Evaluation examined information from the National Highway Traffic Safety Administration, Federal Motor Carrier Safety Administration and other government agencies and concluded that road problems like potholes and iced-over stretches of highway cause more than 42,000 deaths a year. \n\n Have you been involved in an accident due to bad roads? \n\nIf so, the auto accident lawyers at Greg Coleman Law want to speak with you. Our firm is prepared to fight for the maximum amount of compensation available to the victims of poor road conditions and can help to explain your legal option.",
  ),
  News(
    author: "Anonymous",
    favorite: 21,
    seen: 415,
    time: "Posted on 15/01/21 at 14:15 PM",
    title: "Hyderabad among nine Indian cities with poor road connectivity",
    image:
    "https://assets.change.org/photos/2/ma/ye/cqmaYEcvkOVzQbb-800x450-noPad.jpg?1509361645",
    subtitle:
    "Nine out of 100 cities with the worst street-network connectivity are from India, according to a new report. Vijayawada ranks 35th in the list with an SNDi (street-network disconnectedness index) score of 4.9, while Hyderabad ranks 80th with an SNDi score of 3.8. Notably, Vijayawada is the third-worst among the nine Indian cities.",
    content:
    "Nine out of 100 cities with the worst street-network connectivity are from India, according to a new report. Vijayawada ranks 35th in the list with an SNDi (street-network disconnectedness index) score of 4.9, while Hyderabad ranks 80th with an SNDi score of 3.8. Notably, Vijayawada is the third-worst among the nine Indian cities.\n\nIndian cities are planning their road networks poorly, creating longer commutes. Among the nine Indian cities, Pune ranked 15th, Kolkata was at 21, Vijayawada 35, Coimbatore 46, Mumbai 50, Kozhikode 53, Singrauli 65, and Jaipur ranked 93rd on the list. Hyderabad ranks 8th among the nine Indian cities and 80th overall. \n The street networks were divided into nodes (specific points) and edges (paths connecting the nodes) to measure the disconnectedness. Taking an example of two cars, the methodology determines which car will have to take the longer route, the index. The first step involves counting the number of connections for each node, the second step compares the route length with the shortest distance between neighbouring nodes, and the third step compares the road length with the shortest distance between connected nodes. The result shows the car's street network. Fewer connections, more dead-ends, and meandering routes and roads would represent a higher disconnectedness score. \n According to the report, India must pay attention to this problem as the number of people using it's urban street networks is set to balloon in the coming years. India is projected to have the fastest urbanisation between 2018 and 2050 by adding 416 million more urban dwellers, nearly doubling it's urban population, according to the world urbanisation prospects 2018. India already had the second-largest urban population in the world in 2018 after China, at 461 million urban dwellers. \n Talking about Hyderbad's roads, Anoop Kumar of Oscar Roads, said,  Honestly, the roads are in bad shape. There are no funds for road development, neither is there any plan to widen the roads. New roads are not being laid. The roads that we already have not been maintained for a very long time. All we see are potholes. Due to this, more time is wasted on roads and accidents occurs more frequently.",
  ),
];
