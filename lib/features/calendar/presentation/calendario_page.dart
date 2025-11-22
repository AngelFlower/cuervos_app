import 'dart:io';
import 'package:cuervos_app/core/services/utvt/calendario_escolar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

// Views/widgets
import 'views/calendar_app_bar.dart';
import 'views/loading_view.dart';
import 'views/calendar_fabs.dart';
import 'views/gesture_instructions.dart';
import 'views/help_sheet.dart';

// Modals
import 'modals/share_dialog.dart';

class CalendarioPage extends StatelessWidget {
  const CalendarioPage({Key? key}) : super(key: key);

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<String> get _calendarioEscolar async {
    return await CalendarioEscolar().obtenerCalendario();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _calendarioEscolar,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildCalendarView(context, snapshot.data.toString());
        } else {
          return _buildLoadingView(context);
        }
      },
    );
  }

  Widget _buildCalendarView(BuildContext context, String imageUrl) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade900,
      appBar: buildCalendarAppBar(context),
      body: Stack(
        children: [
          // Imagen con zoom
          PhotoView(
            backgroundDecoration: BoxDecoration(color: Colors.grey.shade900),
            imageProvider: NetworkImage(imageUrl),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 3,
            initialScale: PhotoViewComputedScale.contained,
            loadingBuilder: (context, event) => Center(
              child: CircularProgressIndicator(
                value: event == null ? 0 : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
                color: Colors.green.shade400,
              ),
            ),
          ),

          // Floating action buttons
          Positioned(
            bottom: 24,
            right: 24,
            child: CalendarFABs(
              onShare: () => _shareCalendar(imageUrl),
              onHelp: () => showCalendarHelp(context),
            ),
          ),
          const GestureInstructions(),
        ],
      ),
    );
  }

  Widget _buildLoadingView(BuildContext context) {
    return CalendarLoadingView(isDesktop: MediaQuery.of(context).size.width > 1024);
  }

  Future<void> _shareCalendar(String imageUrl) async {
    try {
      if (kIsWeb) {
        // En web, mostrar modal con opciones
        await showShareDialog(_scaffoldKey.currentContext!, imageUrl);
      } else {
        // En móvil/desktop, descargar y compartir el archivo
        final uri = Uri.parse(imageUrl);
        final response = await http.get(uri);
        final bytes = response.bodyBytes;
        final temp = await getTemporaryDirectory();
        final path = '${temp.path}/calendario_escolar.jpg';
        File(path).writeAsBytesSync(bytes);
        await Share.shareXFiles(
          [XFile(path)],
          text: 'Calendario Escolar',
        );
      }
    } catch (e) {
      // Manejar error silenciosamente o mostrar snackbar
      debugPrint('Error al compartir: $e');
    }
  }
}
