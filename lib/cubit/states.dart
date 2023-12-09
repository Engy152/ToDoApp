
abstract class TaskStates { }

class AppInitialStates extends TaskStates { }
class AddLoadingStates extends TaskStates { }
class AddSuccessStates extends TaskStates { }
class AddErrorStates extends TaskStates
{
  final String errorM;

  AddErrorStates(this.errorM);
}
class ColorTaskStates extends TaskStates { }
class getTaskStates extends TaskStates { }
class taskCompleteStates extends TaskStates { }
class selectedDateStates extends TaskStates { }
class filterStates extends TaskStates { }
class LoadingStates extends TaskStates { }


