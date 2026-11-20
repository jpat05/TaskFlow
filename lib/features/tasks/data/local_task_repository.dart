import '../domain/task.dart';
import 'task_repository.dart';

class LocalTaskRepository implements TaskRepository {
  final List<Task> _tasks = [
    const Task(
      id: 1,
      title: 'Gestionar usuarios de la biblioteca',
      description:
          'Implementar el registro, consulta y administración de usuarios, '
          'incluyendo roles, estados y códigos de membresía.',
      priority: 'Alta',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 2,
      title: 'Administrar el catálogo de libros',
      description:
          'Desarrollar el registro y consulta de libros, autores, '
          'editoriales y categorías, incluyendo ISBN y datos bibliográficos.',
      priority: 'Alta',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 3,
      title: 'Controlar el inventario de ejemplares',
      description:
          'Implementar el control de ejemplares físicos mediante códigos '
          'de barras, ubicación en estantería, estado y condición.',
      priority: 'Media',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 4,
      title: 'Gestionar préstamos y reservas',
      description:
          'Desarrollar el proceso de préstamo, devolución, renovación '
          'y reserva de libros, controlando fechas y disponibilidad.',
      priority: 'Alta',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 5,
      title: 'Administrar multas y políticas',
      description:
          'Implementar el cálculo y seguimiento de multas por retraso, '
          'daños o pérdida, además de configurar las políticas de préstamo.',
      priority: 'Media',
      isCompleted: true,
      userId: 1,
    ),
  ];

  @override
  List<Task> getTasks() => List.unmodifiable(_tasks);

  @override
  void save(Task task) {
    final index = _tasks.indexWhere((item) => item.id == task.id);
    if (index == -1) return;
    _tasks[index] = task;
  }
}
