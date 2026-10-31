import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  static final TaskProvider _instance = TaskProvider._internal();
  factory TaskProvider() => _instance;

  TaskProvider._internal() {
    _initSampleData();
  }

  final List<TaskModel> _tasks = [];
  String _activeTabFilter = 'Assigned';
  TaskStatus? _selectedStatusFilter;
  TaskPriority? _selectedPriorityFilter;
  String _searchQuery = '';
  DateTime _selectedCalendarDate = DateTime.now();

  List<TaskModel> get tasks => List.unmodifiable(_tasks);
  String get activeTabFilter => _activeTabFilter;
  TaskStatus? get selectedStatusFilter => _selectedStatusFilter;
  TaskPriority? get selectedPriorityFilter => _selectedPriorityFilter;
  String get searchQuery => _searchQuery;
  DateTime get selectedCalendarDate => _selectedCalendarDate;

  void setActiveTabFilter(String filter) {
    _activeTabFilter = filter;
    notifyListeners();
  }

  void setStatusFilter(TaskStatus? status) {
    _selectedStatusFilter = status;
    notifyListeners();
  }

  void setPriorityFilter(TaskPriority? priority) {
    _selectedPriorityFilter = priority;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSelectedCalendarDate(DateTime date) {
    _selectedCalendarDate = date;
    notifyListeners();
  }

  List<TaskModel> get filteredTasks {
    return _tasks.where((task) {
      if (_selectedStatusFilter != null && task.status != _selectedStatusFilter) {
        return false;
      }
      if (_selectedPriorityFilter != null && task.priority != _selectedPriorityFilter) {
        return false;
      }
      if (_searchQuery.isNotEmpty) {
        final query = _searchQuery.toLowerCase();
        final matchTitle = task.title.toLowerCase().contains(query);
        final matchId = task.id.toLowerCase().contains(query);
        final matchDesc = task.description.toLowerCase().contains(query);
        if (!matchTitle && !matchId && !matchDesc) return false;
      }
      if (_activeTabFilter == 'Created') {
        return task.assignee.contains('Quan') || task.id.endsWith('1') || task.id.endsWith('3');
      } else if (_activeTabFilter == 'Subscribed') {
        return task.labels.isNotEmpty;
      }
      return true;
    }).toList();
  }

  List<TaskModel> getTasksByStatus(TaskStatus status) {
    return _tasks.where((t) => t.status == status).toList();
  }

  List<TaskModel> getTasksForDate(DateTime date) {
    return _tasks.where((t) {
      if (t.dueDate == null) return false;
      return t.dueDate!.year == date.year &&
          t.dueDate!.month == date.month &&
          t.dueDate!.day == date.day;
    }).toList();
  }

  void addTask(TaskModel task) {
    _tasks.insert(0, task);
    notifyListeners();
  }

  void updateTask(TaskModel updatedTask) {
    final index = _tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void moveTask(String taskId, TaskStatus newStatus) {
    final index = _tasks.indexWhere((t) => t.id == taskId);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(status: newStatus);
      notifyListeners();
    }
  }

  void deleteTask(String taskId) {
    _tasks.removeWhere((t) => t.id == taskId);
    notifyListeners();
  }

  void _initSampleData() {
    final now = DateTime.now();
    _tasks.addAll([
      TaskModel(
        id: 'LIN-101',
        title: 'Hoàn thiện Dark Mode Linear Design System',
        description: 'Tối ưu hóa bảng màu pitch black #08090A, border #26282E và typography.',
        status: TaskStatus.inProgress,
        priority: TaskPriority.urgent,
        assignee: 'Nguyen Nhat Minh Quan',
        labels: ['Design', 'System'],
        project: 'Linear Mobile App',
        dueDate: now.add(const Duration(days: 1)),
      ),
      TaskModel(
        id: 'LIN-102',
        title: 'Xây dựng Bảng Kanban kéo thả đa cột',
        description: 'Hỗ trợ chuyển đổi trạng thái Backlog, Todo, In Progress, Done bằng thao tác kéo thả.',
        status: TaskStatus.inProgress,
        priority: TaskPriority.high,
        assignee: 'Nguyen Nhat Minh Quan',
        labels: ['Feature', 'Kanban'],
        project: 'Linear Mobile App',
        dueDate: now.add(const Duration(days: 2)),
      ),
      TaskModel(
        id: 'LIN-103',
        title: 'Popup chi tiết Task (Bottom Sheet) kiểu Linear',
        description: 'Thiết kế selector Status, Priority icon, Assignee, Label và bàn phím formatting.',
        status: TaskStatus.todo,
        priority: TaskPriority.high,
        assignee: 'Nguyen Nhat Minh Quan',
        labels: ['UI/UX', 'Modal'],
        project: 'Linear Mobile App',
        dueDate: now,
      ),
      TaskModel(
        id: 'LIN-104',
        title: 'Tích hợp Calendar View theo dõi Deadline',
        description: 'Dùng table_calendar, hiển thị chấm đánh dấu ngày đến hạn và danh sách việc trong ngày.',
        status: TaskStatus.todo,
        priority: TaskPriority.medium,
        assignee: 'Nguyen Nhat Minh Quan',
        labels: ['Calendar'],
        project: 'Linear Mobile App',
        dueDate: now.add(const Duration(days: 3)),
      ),
      TaskModel(
        id: 'LIN-105',
        title: 'Thống kê tiến độ dự án bằng fl_chart',
        description: 'Vẽ biểu đồ tròn phân bố trạng thái và biểu đồ cột năng suất công việc tuần.',
        status: TaskStatus.backlog,
        priority: TaskPriority.medium,
        assignee: 'Nguyen Nhat Minh Quan',
        labels: ['Analytics', 'fl_chart'],
        project: 'Linear Mobile App',
        dueDate: now.add(const Duration(days: 5)),
      ),
      TaskModel(
        id: 'LIN-106',
        title: 'Thiết kế icon neon wireframe cho Empty State',
        description: 'Tái tạo chuẩn icon đa tầng 3D wireframe như ảnh Linear chính thức.',
        status: TaskStatus.done,
        priority: TaskPriority.low,
        assignee: 'Nguyen Nhat Minh Quan',
        labels: ['Asset'],
        project: 'Linear Mobile App',
        dueDate: now.subtract(const Duration(days: 1)),
      ),
    ]);
  }
}
