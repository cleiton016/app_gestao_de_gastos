import 'package:app_gestao_de_gastos/models/bancos_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class CartaoBanco extends StatelessWidget {
  const CartaoBanco({
    Key? key,
    required double scremsizeW,
    required double scremsizeH,
    required BancosModel banco,
  }) : 
  _scremsizeW = scremsizeW,
  _scremsizeH = scremsizeH,
  _banco = banco,
  
  super(key: key);

  final double _scremsizeW;
  final double _scremsizeH;
  final BancosModel _banco;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
      child: InkWell(
        onTap: () => { print("Lista de Gasto de ${_banco.nome}") },
        child: Container(
          width: 100,
          height: 250,
          decoration: BoxDecoration(
            // color: fromHex(_cor),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: const Alignment(0.8, 1),
              colors: fromGrandientHex(_banco.cor), // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 20, 10, 5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          onTap: () => { print('Editar ultimo gasto') },
                          contentPadding: const EdgeInsetsDirectional.all(0),
                          title: Text(
                            'Ultimo Gastos',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)
                          ),
                          subtitle: const Text("Aluguel: R\$1100,00"),
                          dense: false,
                        ),
                      ),
                    ),
                    _dashbord()
                  ],
                ),
                Row(
                  children: [
                    Text(
                      _banco.nome,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  _dashbord() {
    final percentual =  _percentual(_banco.credito_limite, _banco.credito_disponivel);
    return CircularPercentIndicator(
                  percent: percentual['percent'],
                  radius: 60,
                  lineWidth: 18,
                  animation: true,
                  animationDuration: 800,
                  restartAnimation: true,
                  progressColor: percentual['cor']?const Color(0xFFD45959) :const Color(0xFF79C77B),
                  backgroundColor: const Color(0xFFF1F4F8),
                  center: Text("${percentual['valor']}%"),
                );
  }

  _percentual(limite, limiteUtilizado) {
    double p1 =  double.parse(limite);
    double p2 =  double.parse(limiteUtilizado);
    if(p1 != 0){
      double percent = double.parse(((p2*100)/p1).toStringAsFixed(2));
      return {'percent':percent/100, 'valor': percent, 'cor': percent>=50 };
    }

    return {'percent': 0.0, 'valor': "0", 'cor': false } ;
  }

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  List<Color> fromGrandientHex(List listHex) {
    List<Color> data = [];
    for (var hexString in listHex) {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      data.add(Color(int.parse(buffer.toString(), radix: 16)));
    }
    return data;
    


  }
}

