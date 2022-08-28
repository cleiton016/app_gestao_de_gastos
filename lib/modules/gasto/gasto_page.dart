import 'package:app_gestao_de_gastos/models/GastoModel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './gasto_controller.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GastoPage extends GetView<GastoController> {
  TextEditingController nome = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController dataReferente = TextEditingController();
  final banco = ValueNotifier('');
  final fatura = ValueNotifier('');
  final categoria = ValueNotifier('');
  final corbotao = ValueNotifier(Colors.blue.shade400);
  void initState() {
    dataReferente.text = ""; //set the initial value of text field
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(title: const Text('Lançamento de Gastos'),),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      inputDropdow(
                        label: "Banco",
                        varText: banco,
                        arrayItens: ["Inter"]
                      ),
                      inputDropdow(
                        label: "Fatura",
                        varText: fatura,
                        arrayItens: ["Janeiro"]
                      ),
                    ],
                  ),
                ),
                
                
                inputText(
                  labelName:"Nome",
                  textVar: nome,
                  context: context,
                  
                ),
                Row(
                  children: [
                    Expanded(
                      child: inputText(
                        labelName: "Valor",
                        textVar: valor,
                        context: context,
                        inputType: TextInputType.number
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 16),
                      child: inputDropdow(
                        label: "Categoria",
                        varText: categoria,
                        arrayItens: []
                      ),
                    )
                  ],
                ),
                inputText(
                  labelName:"Data Referente",
                  textVar: dataReferente,
                  context: context,
                  inputType: TextInputType.datetime,
                  max: 10,
                  mask: [
                    MaskTextInputFormatter(
                      mask: '####-##-##', 
                      filter: { "#": RegExp(r'[0-9]') },
                      type: MaskAutoCompletionType.lazy
                    )
                  ],
                  func: () {
                    showDatePicker(
                      cancelText: "Cancelar",
                      
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2030)
                    ).then((value) => {
                      dataReferente.text = DateFormat('yyyy-MM-dd').format(value!)
                    });
                  }
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: corbotao.value,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: const Color(0xFFFFFFFF),
                          width: 1.5,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        child: Text(
                          "Salvar",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lexendDeca(
                            color: Colors.white,
                            fontSize: 16
                          )
                        ),
                      ),
                    )
                    
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }

  inputDropdow({required String label, String? hintText = '', required List arrayItens, varText}) {
    return ValueListenableBuilder(
      valueListenable: varText,
      builder: (BuildContext context, String value, _){
        return SizedBox(
          width: 160,
          child: DropdownButtonFormField(
            isExpanded: true,
            icon: const Icon(Icons.category),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueAccent.shade100,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.white,
              
              label: Text(label),
              labelStyle: GoogleFonts.lexendDeca(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
            hint: Text(hintText==''?'Selecione ...': hintText!),
            value: (value.isEmpty? null: value),
            onChanged: (escola) => varText.value = escola.toString(),
            items: arrayItens.map((op) => DropdownMenuItem(
              child: Text(op),
              value: op,
            )).toList(),
          ),
        );
      }
    );
  }

  Padding inputText({
    required String labelName,
    required TextEditingController textVar,
    required BuildContext context,
    List<MaskTextInputFormatter>? mask,
    int? max,
    TextInputType? inputType = TextInputType.text,
    void Function()? func }
  ) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: TextFormField(
        controller: textVar,
        keyboardType: inputType,
        inputFormatters: mask,
        maxLength: max,
        onTap: func,
        obscureText: false,
        decoration: InputDecoration(
          labelText: labelName,
          labelStyle: GoogleFonts.lexendDeca(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.background,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent.shade100,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
          
        ),
      ),
    );
  }
}