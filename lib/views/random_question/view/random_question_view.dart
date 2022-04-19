import 'package:flutter/material.dart';
import 'package:random_question/products/widgets/text/custom_text.dart';

class RandomQuestionView extends StatefulWidget {
  const RandomQuestionView({Key? key}) : super(key: key);

  @override
  _RandomQuestionViewState createState() => _RandomQuestionViewState();
}

class _RandomQuestionViewState extends State<RandomQuestionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          elevation: 8,
          shadowColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: const [
                  Center(
                      child: Icon(
                    Icons.question_mark_sharp,
                    size: 50,
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: CustomText(
                      text: 'Sizin İçin Seçtiğimiz Soru',
                    ),
                  )
                ],
              ),
              const Center(
                child: CustomText(
                  text: 'What is Up?',
                  textStyle: TextStyle(
                      color: Color.fromARGB(255, 123, 31, 162),
                      fontWeight: FontWeight.w800),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: CustomText(
                    text:
                        'Soruyu Favorinize Eklemek İçin Aşağıdaki + Butonuna Tıklayınız.',
                    textStyle: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.purple[700],
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomText(text: 'Yeni Soru'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildFloatingAction() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
