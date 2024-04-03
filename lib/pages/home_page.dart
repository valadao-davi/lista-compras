import 'dart:js_interop_unsafe';

import 'package:atividade/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
   Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //variavel que recebe oque é digitado no form
  final valor = TextEditingController();
  final valorPreco = TextEditingController();

 List Compras = [
    {
      "name": "Macarrão",
      "isBought": false,
      'preco': 12
    }, 
    {  
      "name": 'Maionese',
      "isBought": false,            
      'preco': 5

    },   
    {  
      "name": 'Arroz',
      "isBought": false,
      'preco': 10
    }, 
  ];

  void addItem(value, number){
     setState(() {
      Compras.add({'name': value.text, 'isBought': false, 'preco': number});
       print(Compras);
    });
    }
  void deleteItem(value){
    setState(() {
      print(value);
      Compras.removeAt(value);
    });
  }

   void riscarItem(value) {
    setState(() {
        var isBought = Compras[value]['isBought'];
        Compras[value]['isBought'] = !isBought;
      });

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de compras', style: GoogleFonts.roboto(),),
      ),
      body: Column(
        children:[ 
           TextField(
            controller: valor,
            decoration: const InputDecoration(
              hintText: 'Digite um item',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: valorPreco,
            decoration: InputDecoration(
              hintText: 'Digite um preço',
              border: OutlineInputBorder(),
            ),
          ),
          Container(
            width: double.infinity,
            height: 30,
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: (){
                if(valor.text.isNotEmpty && int.parse(valorPreco.value.text) >= 0){
                  addItem(valor, int.parse(valorPreco.value.text));
                }
              }, 
              child: const Text('Adicionar item'))),
          Expanded(
            child: ListView.builder(
            itemCount: Compras.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Compras[index]['name'], style: GoogleFonts.roboto(color: Colors.white, decoration: Compras[index]['isBought']? TextDecoration.lineThrough: null), textAlign: TextAlign.start,),
                        Text('${Compras[index]['isBought']? 'Comprado' : 'Para comprar'}', style: GoogleFonts.roboto(color: Colors.white), textAlign: TextAlign.start),
                        Text('Valor: ${Compras[index]['preco']} Reais', style: GoogleFonts.roboto(color: Colors.white), textAlign: TextAlign.start),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(onPressed:()=> deleteItem(index), icon: Icon(Icons.delete)),
                        IconButton(onPressed: ()=> riscarItem(index), icon: Compras[index]['isBought']? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank)),
                      ],
                    )
                  ],
                ),

              );
            }),
          ),

          ],
      )
      );
  }
}