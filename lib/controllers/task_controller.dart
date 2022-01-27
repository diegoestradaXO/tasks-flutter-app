import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/controllers/home_controller.dart';
import 'package:my_app/models/task.dart';
import 'package:my_app/provider/database_helper.dart';

class TaskController extends GetxController {

  HomeController _homeController = HomeController();
  
  int _taskId = 0;

  get taskId => _taskId;

  final GetStorage data = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('sup, im here');
  }

  createTask (String title, String? description) async {
    if(title != ''){
      DatabaseHelper _dbhelper = DatabaseHelper();
      Task _newTask = Task(title: title, description: description);
      _taskId = await _dbhelper.insertTask(_newTask);
      print('This is the task id $_taskId');
      _homeController.taskData.add(_newTask);
      _homeController.updateTask();
    }
  }
  // ToDo: delteTask() 
  
}