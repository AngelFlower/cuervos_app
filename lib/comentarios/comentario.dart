class Comentario {
  final int id;
  final String fecha;
  final String comentario;

  Comentario({
    required this.id,
    required this.fecha,
    required this.comentario,
  });

  Comentario.fromJson(Map json)
      : id = json['id'],
        fecha = json['fecha'],
        comentario = json['comentario'];

  Map toJson() => {
        'id': id,
        'fecha': fecha,
        'comentario': comentario,
      };
}
