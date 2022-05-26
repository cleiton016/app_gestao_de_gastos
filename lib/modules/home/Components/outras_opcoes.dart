import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutrasOpcoes extends StatelessWidget {
  const OutrasOpcoes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 350),
      child: Container(
        height: 100,
        decoration:  const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Color.fromARGB(94, 0, 0, 0),
              offset: Offset(5, 10),
              spreadRadius: 0,
            )
          ],
          color: Colors.white,
          //border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _cardOpcao(
                nome: "Detalhes",
                rota:"detalhamento",
                icon: const Icon(
                  Icons.receipt_long_outlined,
                  color: Color(0xFF95A1AC),
                  size: 32,
                ),
              ),
              _cardOpcao(
                nome: "asdasd",
                rota:"asdasda",
                icon: const Icon(
                  Icons.receipt_long_outlined,
                  color: Color(0xFF95A1AC),
                  size: 32,
                ),
              ),
              _cardOpcao(
                nome: "123123",
                rota:"123123",
                icon: const Icon(
                  Icons.receipt_long_outlined,
                  color: Color(0xFF95A1AC),
                  size: 32,
                ),
              )
            ],
          ),
        )
        
      ),
    );
  }

  _cardOpcao(
    {
    required Icon icon,
    required String rota,
    required nome
    }
  )
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,0),
      child: InkWell(
        onTap: () => {print(rota)},
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFFF1F4F8),
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Text(
                nome,
                textAlign: TextAlign.center,
                style: GoogleFonts.lexendDeca(
                      color: const Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
