# Alcance de TaskFlow

**Problema:** organizar y consultar las actividades relacionadas con la gestión de una biblioteca, identificando su descripción, prioridad y estado.

**Usuario objetivo:** personal de biblioteca que necesita consultar y organizar actividades de gestión.

## Historias de usuario y criterios de aceptación

1. Como usuario, quiero consultar las tareas registradas para conocer las actividades de gestión de la biblioteca.
   - **Criterio:** la lista muestra las cinco tareas con su título, prioridad y estado.

2. Como usuario, quiero consultar el detalle de una tarea para conocer qué actividad debe realizarse.
   - **Criterio:** al seleccionar una tarea se muestran su título, descripción, prioridad, estado e identificador de usuario.

3. Como usuario, quiero registrar una tarea para incorporar una nueva actividad de gestión.
   - **Criterio:** el formulario futuro permitirá ingresar título, descripción y prioridad.

4. Como usuario, quiero modificar una tarea para actualizar la información de una actividad.
   - **Criterio:** una tarea podrá actualizar sus datos y los cambios deberán reflejarse en su consulta.

5. Como usuario, quiero eliminar una tarea para retirar actividades que ya no deban mantenerse registradas.
   - **Criterio:** al eliminar una tarea, esta dejará de aparecer en el listado.

## Modelo de datos

**Task**

- `id`: identificador entero único.
- `title`: título de la tarea.
- `description`: descripción de la actividad.
- `priority`: prioridad (Alta, Media o Baja).
- `isCompleted`: estado de la tarea (completada o pendiente).
- `userId`: identificador entero del usuario asociado.

Los datos de prueba corresponden a cinco actividades relacionadas con usuarios, catálogo de libros, inventario de ejemplares, préstamos y reservas, y multas y políticas de biblioteca.

## Pantallas previstas

- **Lista:** muestra las tareas registradas mediante tarjetas con título, prioridad y estado.
- **Detalle:** muestra la información completa de una tarea seleccionada.
- **Formulario:** pantalla futura para ingresar los datos de una tarea.

## Requisitos no funcionales

- La interfaz debe presentar textos comprensibles.
- La navegación debe permitir consultar el detalle de cada tarea.
- Un identificador inexistente debe mostrar un mensaje informativo sin cerrar la aplicación.

## Contrato de API previsto

| Método | Endpoint | Operación |
|---|---|---|
| GET | `/tasks` | Consultar lista de tareas. |
| GET | `/tasks/:id` | Consultar detalle de una tarea. |
| POST | `/tasks` | Registrar una tarea. |
| PATCH | `/tasks/:id` | Modificar una tarea. |
| DELETE | `/tasks/:id` | Eliminar una tarea. |

La API todavía no está conectada. Estos endpoints representan las operaciones previstas para el desarrollo posterior.
