class ApiUrl{
  ApiUrl._();
  static const String _baseUrl='https://task.teamrabbil.com/api/v1';
  static const String registration='$_baseUrl/registration';
  static const String login='$_baseUrl/login';
  static const String createTask='$_baseUrl/createTask';
  static const String taskStatusCount='$_baseUrl/taskStatusCount';
  static const String newTask='$_baseUrl/listTaskByStatus/New';
  static const String inProgress='$_baseUrl/listTaskByStatus/Progress';


}