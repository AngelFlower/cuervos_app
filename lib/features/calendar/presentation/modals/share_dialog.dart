import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

Future<void> showShareDialog(BuildContext context, String imageUrl) async {
  // Extraer la URL original sin el proxy
  final originalUrl = _extractOriginalUrl(imageUrl);

  return showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(24),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade600, Colors.green.shade700],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.share, color: Colors.white, size: 32),
            ),
            const SizedBox(height: 20),
            const Text(
              'Compartir Calendario',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Elige cómo compartir el calendario escolar',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _buildShareOption(
              context,
              icon: Icons.download,
              title: 'Descargar imagen',
              subtitle: 'Guarda la imagen en tu dispositivo',
              color: Colors.blue,
              onTap: () => _downloadImage(imageUrl, context),
            ),
            const SizedBox(height: 12),
            _buildShareOption(
              context,
              icon: Icons.link,
              title: 'Copiar enlace',
              subtitle: 'Copia la URL de la imagen',
              color: Colors.orange,
              onTap: () => _copyToClipboard(originalUrl, context),
            ),
            const SizedBox(height: 12),
            _buildShareOption(
              context,
              icon: Icons.message,
              title: 'Compartir en WhatsApp',
              subtitle: 'Comparte el calendario por WhatsApp',
              color: Colors.green,
              onTap: () => _shareOnWhatsApp(originalUrl, context),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    ),
  );
}

String _extractOriginalUrl(String proxyUrl) {
  // Si la URL contiene el proxy de bypass-cors, extraer la URL original
  if (proxyUrl.contains('bypass-cors')) {
    // La URL está después del "?" en formato: https://bypass-cors.domain/?ORIGINAL_URL
    final questionMarkIndex = proxyUrl.indexOf('?');
    if (questionMarkIndex != -1 && questionMarkIndex < proxyUrl.length - 1) {
      return proxyUrl.substring(questionMarkIndex + 1);
    }
  }
  return proxyUrl;
}

Widget _buildShareOption(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String subtitle,
  required Color color,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
        ],
      ),
    ),
  );
}

Future<void> _downloadImage(String imageUrl, BuildContext context) async {
  try {
    // Descargar la imagen
    final uri = Uri.parse(imageUrl);
    final response = await http.get(uri);
    final bytes = response.bodyBytes;

    // Crear un blob y descargar en web
    // ignore: avoid_web_libraries_in_flutter
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute('download', 'calendario_escolar.jpg')
      ..click();
    html.Url.revokeObjectUrl(url);

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 12),
            Text('Imagen descargada exitosamente'),
          ],
        ),
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  } catch (e) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error al descargar: $e'),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

Future<void> _copyToClipboard(String imageUrl, BuildContext context) async {
  try {
    await Clipboard.setData(ClipboardData(text: imageUrl));
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 12),
            Text('Enlace copiado al portapapeles'),
          ],
        ),
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  } catch (e) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error al copiar: $e'),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

Future<void> _shareOnWhatsApp(String imageUrl, BuildContext context) async {
  try {
    final message = Uri.encodeComponent('Calendario Escolar UTVT 2025\n$imageUrl');
    final whatsappUrl = 'https://wa.me/?text=$message';

    // Abrir WhatsApp Web en una nueva pestaña
    html.window.open(whatsappUrl, '_blank');

    Navigator.pop(context);
  } catch (e) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error al abrir WhatsApp: $e'),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
