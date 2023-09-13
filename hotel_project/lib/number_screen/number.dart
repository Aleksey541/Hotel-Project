// import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:hotel_project/booking/booking_screen.dart';

class Number extends StatefulWidget {
  const Number({super.key, required this.title, required this.prise});

  final String title;
  final String prise;

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
          height: 660,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)
                ),
                height: 300,
                width: 380,
                
                // child: AnotherCarousel(
                //   borderRadius: true,
                //   autoplay: false,
                //   images: const [
                //     AssetImage("assets/Club_Privé_by_Belek_Club_House.jpg"),
                //     AssetImage("assets/The_Makadi_Spa_Hotel_02.jpg"),
                //     AssetImage("assets/article_1eb0a64d00.jpg"),
                //   ]
                // ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 14, top: 10),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 15, left: 15),
                    height: 35,
                    width: 155,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Text(
                      "Все включено",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 15, left: 10),
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Text(
                      "Кондиционер",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(20, 33, 149, 243),
                  borderRadius: BorderRadius.circular(5)
                ),
                margin: EdgeInsets.only(right: 180, top: 15),
                child: TextButton.icon(
                  onPressed: (){}, 
                  icon: Text(
                    "Подробнее о номере"
                  ), 
                  label: Icon(Icons.arrow_forward_ios)
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 14),
                    child: Text(
                      widget.prise,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 35),
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "за 7 ночей с перелётом",
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  )
                ],
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
                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const BookingScreen())));
                }, 
                child: const Text(
                  "Выбрать номер",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                )
              ),
            )
          )
            ]
          )
      );
  }
}