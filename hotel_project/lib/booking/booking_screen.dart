// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:hotel_project/booking/string_generator.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class RuPhoneInputFormatter extends TextInputFormatter{
  
//форматированный телефон
  String _formattedPhone = "";
  //Российский ли номер
  bool _isRu=false;

  //Добавляем возможность указать номер по дефолту
  RuPhoneInputFormatter({
    String? initialText,
  }) {
    if (initialText != null) {
      formatEditUpdate(
          TextEditingValue.empty, TextEditingValue(text: initialText));
    }
  }

    ///Иетод возвращает форматированнный телефон
  String getMaskedPhone() {
    return _formattedPhone;
  }
  ///возвращает чистый телефон. для России начинается с 9
  String getClearPhone() {
    if(_formattedPhone.isEmpty){
      return '';
    }
    if(!_isRu){
      return _formattedPhone.replaceAll(RegExp(r'\D'), '');
    }
    return _formattedPhone.replaceAll(RegExp(r'\D'), '').substring(
        1,
        (_formattedPhone.replaceAll(RegExp(r'\D'), '').length >= 11)
            ? 11
            : _formattedPhone.replaceAll(RegExp(r'\D'), '').length);
  }
  ///Проверяет заполнил ли пользователь телефон. Актуально только для Российских телефонов
  bool isDone(){
    if(!_isRu){
      return true;
    }
    return (_formattedPhone.replaceAll(RegExp(r'\D'), '').length>10);
  }
  ///возвращает флаг Российски ли номер
  get isRussian=>_isRu;

  String _formattingPhone(String text){
  //регулярка протиа букв. в телефоне только цифры
    text=text.replaceAll(RegExp(r'\D'), '');
    if(text.isNotEmpty){
      String phone='';
      //проверяем российски ли номер
      if(['7','8','9'].contains(text[0])){
        _isRu=true;
        //если пользователь начал с 9, то добавим 7
        if(text[0]=='9'){
          text='7$text';
        }
        //Проверяем нужен ли +
        String firstSymbols=(text[0]=='8') ? '8':'+7';
        //само форматирование
        phone='$firstSymbols ';
        if(text.length>1){
          phone+='(${text.substring(1,(text.length<4)?text.length:4)}';
        }if(text.length>=5){
          phone+=') ${text.substring(4,(text.length<7)?text.length:7)}';
        }
        if(text.length>=8){
          phone+='-${text.substring(7,(text.length<9)?text.length:9)}';
        }
        if(text.length>=10){
          phone+='-${text.substring(9,(text.length<11)?text.length:11)}';
        }
        return phone;
      }else{
        _isRu=false;
        return '+$text';
      }
    }
    return '';
  }
  
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text=newValue.text.replaceAll(RegExp(r'\D'), '');
    int selectionStart=oldValue.selection.end;

    //проверяем стерает ли пользователь все символы?
    if(oldValue.text=='${newValue.text} '){
      _formattedPhone='';
      return TextEditingValue(
          text: _formattedPhone,
          selection: TextSelection(
              baseOffset: _formattedPhone.length,
              extentOffset: _formattedPhone.length,
              affinity: newValue.selection.affinity,
              isDirectional: newValue.selection.isDirectional
          )
      );
    }

    //проверяем редактирует ли пользователь телефон где то по середине
    if(selectionStart!=_formattedPhone.length){
      _formattedPhone= _formattingPhone(text);
      //если да, то не перекидываем курсов в самый конец

      return TextEditingValue(
          text: _formattedPhone,
          selection: TextSelection(
              baseOffset: newValue.selection.baseOffset,
              extentOffset: newValue.selection.extentOffset,
              affinity: newValue.selection.affinity,
              isDirectional: newValue.selection.isDirectional
          )
      );
    }

    _formattedPhone= _formattingPhone(text);

    //если пользователь просто вводит телефон, 
    //то переносим курсор в конец форматированной строки
    return TextEditingValue(
        text: _formattedPhone,
        selection: TextSelection(
            baseOffset: _formattedPhone.length,
            extentOffset: _formattedPhone.length,
            affinity: newValue.selection.affinity,
            isDirectional: newValue.selection.isDirectional
        )
    );
  }
}

class _BookingScreenState extends State<BookingScreen> {
  
  int cartCount = 2;
  
  final maskFormatter =  RuPhoneInputFormatter();

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)
        ),
        shadowColor: Color(0),
        backgroundColor: Colors.white,
        title: Text(
          "Бронирование",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(top: 10),
            height: 151,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 35,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(20, 255, 153, 0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
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
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Steigenberger Makadi",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: (){}, 
                    child: const Text(
                      "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
                      style: TextStyle(
                        fontSize: 14
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 10),
            height: 330,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Вылет из",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 78),
                      child: Text(
                        "Санкт-Петербург",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Страна, город",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, top: 20),
                      child: Text(
                        "Египет, Хургада",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Даты",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 110, top: 20),
                      child: Text(
                        "19.09.2023 – 27.09.2023",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Кол-во ночей",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 45, top: 20),
                      child: Text(
                        "7 ночей",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Отель",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 105, top: 20),
                      child: Text(
                        "Steigenberger Makadi",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Номер",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 100, top: 20),
                      child: Text(
                        "Стандартный с видом на \nбассейн или сад",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Питание",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 85, top: 20),
                      child: Text(
                        "Все включено",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 10),
            height: 270,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Информация о покупателе",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight:FontWeight.w500
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    inputFormatters:[maskFormatter],
                    decoration: InputDecoration(
                      label: Text(
                        "Номер телефона"
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Почта"
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    validator:(value) {
                          if(value!.isEmpty){
                            return "Введите ваш Email";
                          }
                          if(value.isEmpty ||!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                            return "Введите правильный Email";
                          }else{
                            return null;
                          }   
                        },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Эти данные никому не передаются. После оплаты мы вышлим чек на указанный вами номер и почту",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                    ),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(

            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cartCount,
            itemBuilder:(context, index) => CartTourist(), 
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 10),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Добавить туриста",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 13, 114, 255),
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: IconButton(
                    onPressed: (){
                      setState(() {
                        cartCount++;
                      });
                    }, 
                    icon: Icon(Icons.add, color: Colors.white,)
                  ),
                )
              ]
            )
          )
        ],
      ),
    );
  }
}

class CartTourist extends StatefulWidget {

  
  const CartTourist({super.key});

  @override
  State<CartTourist> createState() => _CartTouristState();
}

class _CartTouristState extends State<CartTourist> {
  final formKey = GlobalKey<FormState>();
   bool isIcon = true;
  bool _isHaded = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 10),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Турист",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(22, 33, 149, 243),
                          borderRadius: BorderRadius.circular(6)
                        ),   
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              
                              _isHaded = !_isHaded;
                              isIcon = !isIcon;
                            });
                          }, 
                          icon: Icon(isIcon?Icons.keyboard_arrow_up_sharp: Icons.keyboard_arrow_down_sharp, color: Colors.blue,)
                        ),
                      )
                    ],
                  ),
                ),
              ),
      
            
          Offstage(
            offstage: _isHaded,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              height: 430,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:BorderRadius.circular(10)
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      validator:(value) {
                        if(value == null) {
                          return "Это поле должно быть заполнено";
                        }
                      },
                      onChanged: (value) {
                        formKey.currentState!.validate();
                      },
                      decoration: InputDecoration(
                        label: Text(
                          "Имя"
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    TextFormField(
                      validator:(value) {
                        if(value == null) {
                          return "Это поле должно быть заполнено";
                        }
                      },
                      decoration: InputDecoration(
                        label: Text(
                          "Фамилия"
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    TextFormField(
                      validator:(value) {
                        if(value == null) {
                          return "Это поле должно быть заполнено";
                        }
                      },
                      decoration: InputDecoration(
                        label: Text(
                          "Дата рождения"
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    TextFormField(
                      validator:(value) {
                        if(value == null) {
                          return "Это поле должно быть заполнено";
                        }
                      },
                      decoration: InputDecoration(
                        label: Text(
                          "Гражданство"
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    TextFormField(
                      validator:(value) {
                        if(value == null) {
                          return "Это поле должно быть заполнено";
                        }
                      },
                      decoration: InputDecoration(
                        label: Text(
                          "Номер загранпаспорта"
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    TextFormField(
                      validator:(value) {
                        if(value == null) {
                          return "Это поле должно быть заполнено";
                        }
                      },
                      decoration: InputDecoration(
                        label: Text(
                          "Срок действия загранпаспорта"
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ]
    );
  }

}