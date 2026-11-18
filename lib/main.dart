import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'task.dart';

void main() {
  runApp(const TaskFlowApp());
}

const demoTasks = <Task>[
  Task(
    id: 1,
    title: 'Gestionar usuarios de la biblioteca',
    description:
        'Implementar el registro, consulta y administración de usuarios, '
        'incluyendo roles, estados y códigos de membresía.',
    priority: 'Alta',
    isCompleted: false,
    userId: 1,
  ),
  Task(
    id: 2,
    title: 'Administrar el catálogo de libros',
    description:
        'Desarrollar el registro y consulta de libros, autores, '
        'editoriales y categorías, incluyendo ISBN y datos bibliográficos.',
    priority: 'Alta',
    isCompleted: false,
    userId: 1,
  ),
  Task(
    id: 3,
    title: 'Controlar el inventario de ejemplares',
    description:
        'Implementar el control de ejemplares físicos mediante códigos '
        'de barras, ubicación en estantería, estado y condición.',
    priority: 'Media',
    isCompleted: false,
    userId: 1,
  ),
  Task(
    id: 4,
    title: 'Gestionar préstamos y reservas',
    description:
        'Desarrollar el proceso de préstamo, devolución, renovación '
        'y reserva de libros, controlando fechas y disponibilidad.',
    priority: 'Alta',
    isCompleted: false,
    userId: 1,
  ),
  Task(
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

Task? findTask(int? id) {
  for (final task in demoTasks) {
    if (task.id == id) return task;
  }
  return null;
}

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const TaskListScreen()),
    GoRoute(
      path: '/task/:id',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '');
        return TaskDetailScreen(task: findTask(id));
      },
    ),
  ],
);

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      routerConfig: appRouter,
    );
  }
}

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis tareas')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demoTasks.length,
        itemBuilder: (context, index) {
          final task = demoTasks[index];
          return Card(
            child: ListTile(
              leading: Icon(
                task.isCompleted
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
              ),
              title: Text(task.title),
              subtitle: Text('Prioridad: ${task.priority}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/task/${task.id}'),
            ),
          );
        },
      ),
    );
  }
}

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.task});

  final Task? task;

  @override
  Widget build(BuildContext context) {
    final selected = task;
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de tarea')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: selected == null
            ? const Text('No se encontró esta tarea.')
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selected.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(selected.description),
                  const SizedBox(height: 16),
                  Text('Prioridad: ${selected.priority}'),
                  Text(
                    selected.isCompleted
                        ? 'Estado: completada'
                        : 'Estado: pendiente',
                  ),
                  Text('Usuario: ${selected.userId}'),
                ],
              ),
      ),
    );
  }
}
