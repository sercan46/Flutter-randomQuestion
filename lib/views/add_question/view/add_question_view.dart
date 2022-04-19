import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../products/widgets/text/custom_text.dart';

class AddQuestionView extends StatefulWidget {
  const AddQuestionView({Key? key}) : super(key: key);

  @override
  State<AddQuestionView> createState() => _AddQuestionViewState();
}

class _AddQuestionViewState extends State<AddQuestionView> {
  TextEditingController addQuestionTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          elevation: 8,
          shadowColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.purple[700],
                    fontSize: 13,
                  ),
                  maxLength: 120,
                  onSaved: (value) {},
                  textInputAction: TextInputAction.next,
                  controller: addQuestionTxt,
                  cursorColor: Theme.of(context).primaryColor,
                  validator: FormBuilderValidators.required(
                    errorText: 'LocaleKeys.error_requiredField.locale',
                  ),
                  decoration: InputDecoration(
                    labelText: 'Soru Giriniz...',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[700],
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromARGB(255, 123, 31, 162),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 123, 31, 162),
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 123, 31, 162),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 123, 31, 162),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 123, 31, 162),
                      ),
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
                      CustomText(text: 'Yeni Soru Gönder'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.send,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildFloatingAction() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
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
