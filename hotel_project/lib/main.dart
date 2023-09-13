import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_project/models/hotel_model.dart';
import 'package:hotel_project/number_screen/number_screen.dart';
import 'package:hotel_project/services/api.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HotelModel? data;
  @override
  void initState() {
    // TODO: implement initState;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Api api = Api();
      // data = await api.getData();

      // setState(() {

      // });
    });
  }
  @override
  Widget build(BuildContext context) {
    // if(data == null) {
    //   return Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator.adaptive(),
    //     ),
    //   );
    // }
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 600,
            padding: const EdgeInsets.only(top: 25),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
            ), 
            child: Column(
              children: [
                const Text(
                  "Отель",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  height: 300,
                  width: 380,
                  child: AnotherCarousel(
                    borderRadius: true,
                    autoplay: false,
                    images: const [
                      AssetImage("assets/Club_Privé_by_Belek_Club_House.jpg"),
                      AssetImage("assets/The_Makadi_Spa_Hotel_02.jpg"),
                      AssetImage("assets/article_1eb0a64d00.jpg"),
                    ]
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 230),
                  height: 35,
                  width: 160,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(20, 255, 153, 0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.orange,),
                      Text(
                        "5 Превосходно",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 113, top: 13),
                  child: Text(
                    "Madinat Makadi",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 33),
                  child: TextButton(
                    onPressed: (){}, 
                    child: const Text(
                      "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
                    )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 10),
                  child: Row(
                    children: [
                      const Text(
                        "от 134 673 ₽",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: const Text(
                          "за тур с перелётом",
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 550,
            padding: const EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ), 
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 270),
                  child: const Text(
                    "Об отеле",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 15, top: 15),
                      height: 35,
                      width: 115,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Text(
                        "3-я линия",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 10, top: 15),
                      height: 35,
                      width: 230,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Text(
                        "Платный Wi-Fi в фойе",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 15, top: 15),
                      height: 35,
                      width: 210,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Text(
                        "30 км до аэропорта",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 10, top: 15),
                      height: 35,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Text(
                        "1 км до пляжа",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: const Text(
                    "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(15),
                  height: 225,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InfoButton(
                        icon: "assets/emoji-happy.svg",
                        title: "Удобства",
                        subtitle:"Самое необходимое",
                        icons: Icons.arrow_forward_ios_outlined,
                      ),
                      const Divider(),
                      InfoButton(
                        icon: "assets/tick-square.svg",
                        title: "Что включено",
                        subtitle:"Самое необходимое",
                        icons: Icons.arrow_forward_ios_outlined,
                      ),
                      const Divider(),
                      InfoButton(
                        icon: "assets/close-square.svg",
                        title: "Что не включено",
                        subtitle:"Самое необходимое",
                        icons: Icons.arrow_forward_ios_outlined,
                        
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), 
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              height: 60,
              width: 370,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 114, 255),
                borderRadius: BorderRadius.circular(15)
              ),
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const NumberScreen())));
                }, 
                child: const Text(
                  "К выбору номера",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                )
              ),
            )
          )
        ],
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
   InfoButton({super.key, required this.icon, required this.title, required this.subtitle, required this.icons});

  final String icon;
  final String title;
  final String subtitle;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          SvgPicture.asset(icon, height: 30,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 16
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Icon(icons)
        ]
      ),
    );
  }
}