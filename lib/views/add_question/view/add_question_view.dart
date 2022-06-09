import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:random_question/core/extension/string_extension.dart';
import 'package:random_question/core/init/lang/locale_keys.g.dart';
import 'package:random_question/core/init/network/network_manager.dart';
import 'package:random_question/views/add_question/service/add_question_service.dart';
import 'package:random_question/views/add_question/view-model/add_question_view_model.dart';
import '../../../products/widgets/text/custom_text.dart';

class AddQuestionView extends StatefulWidget {
  const AddQuestionView({Key? key}) : super(key: key);

  @override
  State<AddQuestionView> createState() => _AddQuestionViewState();
}

class _AddQuestionViewState extends State<AddQuestionView> {
  final TextEditingController addQuestionTxt = TextEditingController();
  final AddQuestionViewModel _addQuestionViewModel = AddQuestionViewModel(
      service: AddQuestionService(NetworkManager.instance.networkManager));
  final GlobalKey<FormState> _addQuestion = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        return Future.value(true);
      },
      child: Scaffold(
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
                  child: Form(
                    key: _addQuestion,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.purple[700],
                        fontSize: 13,
                      ),
                      maxLength: 120,
                      textInputAction: TextInputAction.next,
                      controller: addQuestionTxt,
                      cursorColor: Theme.of(context).primaryColor,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText:
                              LocaleKeys.error_message_request_field.locale,
                        ),
                        FormBuilderValidators.minLength(5,
                            errorText:
                                LocaleKeys.error_message_min5Length.locale)
                      ]),
                      decoration: InputDecoration(
                        labelText:
                            LocaleKeys.add_question_add_new_question.locale,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.purple[700],
                      ),
                    ),
                    onPressed: () {
                      if (_addQuestion.currentState!.validate()) {
                        _addQuestion.currentState!.save();
                        _addQuestionViewModel
                            .addQuestion(addQuestionTxt.text)
                            .then((value) {
                          if (value!.text!.isNotEmpty) {
                            var snackBar = SnackBar(
                              action: SnackBarAction(
                                  label: 'Close',
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  }),
                              content: CustomText(
                                  text: LocaleKeys
                                      .add_question_success_question.locale),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            addQuestionTxt.clear();
                          }
                        }).catchError((error) {
                          var snackBar = SnackBar(
                            content: CustomText(text: error.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: LocaleKeys
                                .add_question_send_new_question.locale),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
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
      ),
    );
  }
}
