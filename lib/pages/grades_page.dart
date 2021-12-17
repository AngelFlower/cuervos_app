import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GradesPage extends StatefulWidget {
  @override
  GradesPageState createState() => GradesPageState();
}

class GradesPageState extends State<GradesPage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'blank',
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
        // load string var in controller

        _controller.loadUrl(Uri.dataFromString(webP(),
                mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
            .toString());
      },
    );
  }
}

String webP() {
  return ''' 
<table width="1000" class="textoForma" align="center">
 <tbody><tr>
  <td>
   <table width="100%" cellspacing="1" onmouseout="changeback('')" onmouseover="changeto('#eeddcc')">
  <tbody><tr>
    <td colspan="30" class="textoConsulta"><div align="center"><strong>CALIFICACIONES</strong></div></td>
  </tr>
</tbody></table>

<table width="1000" class="" align="center">
    <tbody><tr class="CeldaListado">
      <td class="textoForma" colspan="50"><strong>
        Cuatrimestre: 1 DSM 11&nbsp;&nbsp;
        (Septiembre-Diciembre de 2020)</strong>      </td>
    </tr>
    <tr class="CeldaListado">
      <td width="40%" class="textoConsulta" align="center"><b>Materias</b></td>
      <td width="40%" class="textoConsulta" align="center"><b>Profesor</b></td>

    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 1"><b>P1</b></label></td>


    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 2"><b>P2</b></label></td>


    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 3"><b>P3</b></label></td>


      <td class="textoConsulta" align="center"><label title="Calificación Final Ordinario"><b>CF</b></label></td>


      <td class="textoConsulta" align="center"><label title="Calificación Final Remedial ExtraOrdinaria 1"><b>E.E</b></label></td>

    <td class="textoConsulta" align="center"><label title="Calificación Absoluta"><b>Cal. Cuat.</b></label></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Algebra Lineal</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Fernando Gómez Ramírez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Desarrollo de Habilidades del pensamiento logico</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Abish Amparo Maldonado Martínez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Expresión Oral y Escrita</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Nallely Arriaga Arizmendi</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Fundamentos de Redes</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Pamela Elisa Rosales Aviles</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Formación SocioCultural</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Irma Ivonne Avelino Díaz</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Fundamentos de TI</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Juan Carlos Balderas Perez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Inglés I</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;José Luis Davila Gutierrez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">8.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">8.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">8.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">8.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">8.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Metodología de la Programación</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;José Jésus Apolinar Peña</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>
      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td class="textoConsulta" align="right" colspan="1"><i><strong>Promedio Cuatrimestral:&nbsp;</strong></i></td>
      <td colspan="50" class="textoConsulta" align="right"><strong>9.5&nbsp;</strong></td>
    </tr>
  </tbody></table>

<table width="1000" class="" align="center">
    <tbody><tr class="CeldaListado">
      <td class="textoForma" colspan="50"><strong>
        Cuatrimestre: 2 DSM 21&nbsp;&nbsp;
        (Enero-Abril de 2021)</strong>      </td>
    </tr>
    <tr class="CeldaListado">
      <td width="40%" class="textoConsulta" align="center"><b>Materias</b></td>
      <td width="40%" class="textoConsulta" align="center"><b>Profesor</b></td>

    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 1"><b>P1</b></label></td>


    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 2"><b>P2</b></label></td>


    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 3"><b>P3</b></label></td>


      <td class="textoConsulta" align="center"><label title="Calificación Final Ordinario"><b>CF</b></label></td>


      <td class="textoConsulta" align="center"><label title="Calificación Final Remedial ExtraOrdinaria 1"><b>E.E</b></label></td>

    <td class="textoConsulta" align="center"><label title="Calificación Absoluta"><b>Cal. Cuat.</b></label></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Base de Datos</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Olivia Deyanira Mercado Rangel</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Funciones Matemáticas</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Amanda Adglaé Dávila Vega</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Formación Sociocultural II</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Isela Ballesteros Juarez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Introducción al Diseño Digital</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Miguel Angel Orona Lopez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Inglés II</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Elizabeth Rivero Mora</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">8.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">8.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">8.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">8.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">8.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Interconexion de redes</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Pamela Elisa Rosales Aviles</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Metodologias y Modelado de Desarrollo de Software</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Francisco Castrejón López</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Programación Orientada aObjetos</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;José Jésus Apolinar Peña</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td class="textoConsulta" align="right" colspan="1"><i><strong>Promedio Cuatrimestral:&nbsp;</strong></i></td>
      <td colspan="50" class="textoConsulta" align="right"><strong>9.5&nbsp;</strong></td>
    </tr>
  </tbody></table>

<table width="1000" class="" align="center">
    <tbody><tr class="CeldaListado">
      <td class="textoForma" colspan="50"><strong>
        Cuatrimestre: 3 DSM 31&nbsp;&nbsp;
        (Mayo-Agosto de 2021)</strong>      </td>
    </tr>
    <tr class="CeldaListado">
      <td width="40%" class="textoConsulta" align="center"><b>Materias</b></td>
      <td width="40%" class="textoConsulta" align="center"><b>Profesor</b></td>

    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 1"><b>P1</b></label></td>


    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 2"><b>P2</b></label></td>


    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 3"><b>P3</b></label></td>


      <td class="textoConsulta" align="center"><label title="Calificación Final Ordinario"><b>CF</b></label></td>


      <td class="textoConsulta" align="center"><label title="Calificación Final Remedial ExtraOrdinaria 1"><b>E.E</b></label></td>

    <td class="textoConsulta" align="center"><label title="Calificación Absoluta"><b>Cal. Cuat.</b></label></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Aplicaciones Web</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Cruz Rosales Cruz</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Bases de Datos para Aplicaciones</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;David Cruz Hernandez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Cálculo Diferencial</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Fidelmar Lechuga Sanabria</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Formación Sociocultural III</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Isela Ballesteros Juarez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Inglés III</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;José Luis Davila Gutierrez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Integradora I</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Nallely Arriaga Arizmendi</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Probabilidad y Estadística</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Roxana Pérez Torres</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>
      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Sistemas Operativos</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Angel Perez Morales</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td class="textoConsulta" align="right" colspan="1"><i><strong>Promedio Cuatrimestral:&nbsp;</strong></i></td>
      <td colspan="50" class="textoConsulta" align="right"><strong>9.6&nbsp;</strong></td>
    </tr>
  </tbody></table>

<table width="1000" class="" align="center">
    <tbody><tr class="CeldaListado">
      <td class="textoForma" colspan="50"><strong>
        Cuatrimestre: 4 DSM-41&nbsp;&nbsp;
        (Septiembre-Diciembre de 2021)</strong>      </td>
    </tr>
    <tr class="CeldaListado">
      <td width="40%" class="textoConsulta" align="center"><b>Materias</b></td>
      <td width="40%" class="textoConsulta" align="center"><b>Profesor</b></td>

    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 1"><b>P1</b></label></td>


    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 2"><b>P2</b></label></td>


    <td class="textoConsulta" align="center"><label title="Calificación Parcial Ordinaria 3"><b>P3</b></label></td>


      <td class="textoConsulta" align="center"><label title="Calificación Final Ordinario"><b>CF</b></label></td>


      <td class="textoConsulta" align="center"><label title="Calificación Final Remedial ExtraOrdinaria 1"><b>E.E</b></label></td>


      <td class="textoConsulta" align="center"><label title="Calificación Final Remedial ExtraOrdinaria 2"><b>E.E</b></label></td>

    <td class="textoConsulta" align="center"><label title="Calificación Absoluta"><b>Cal. Cuat.</b></label></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Aplicaciones Web Orientadas a Servicios</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Fernando Bonifacio Morales.</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="#990000">0.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="#990000">0.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="#990000">0.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000">0.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#990000">0.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Diseño de APPS</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Cruz Rosales Cruz</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Estructura de Datos Aplicadas</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Olivia Deyanira Mercado Rangel</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Estándares  y Métricas para el Desarrollo de Software</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Angel Perez Morales</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Evaluación y Mejora para el Desarrollo de Software</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Sergio Mendoza Gonzalez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Formación Sociocultural IV</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Nallely Arriaga Arizmendi</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Inglés IV</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;José Luis Davila Gutierrez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">9.0</font></div></td>
    </tr>

    <tr class="SoloTexto">
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Principios para loT</td>
      <td width="40%" align="left" class="celdaListado1">&nbsp;&nbsp;Marco Antonio Romero Rodriguez</td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td align="right"><div align="center" class="textoConsulta"><font color="##000000">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>

      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
      <td class="textoConsulta" align="right"><div align="center"><font color="#990000"></font></div></td>
    
<td class="textoConsulta" align="right"><div align="center"><font color="#000066">10.0</font></div></td>
    </tr>

    <tr class="">
      <td class="textoConsulta" align="right" colspan="1"><i><strong>Promedio Cuatrimestral:&nbsp;</strong></i></td>
      <td colspan="50" class="textoConsulta" align="right"><strong>8.6&nbsp;</strong></td>
    </tr>
    <tr class="">
      <td class="textoConsulta" align="right" colspan="1"><b>Promedio General</b></td>
      <td colspan="50" class="textoConsulta" align="right"><b>9.3&nbsp;</b></td>
    </tr>
</tbody></table>
  </td>
</tr>
</tbody></table>
  ''';
}
