import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
import '../models/twentyfour_item_model.dart';
import 'package:IllusionX/presentation/devices_screen/models/devices_model.dart';
part 'devices_state.dart';

final devicesNotifier = StateNotifierProvider<DevicesNotifier, DevicesState>(
    (ref) => DevicesNotifier(DevicesState(
        devicesModelObj: DevicesModel(
            twentyfourItemList:
                List.generate(2, (index) => TwentyfourItemModel())))));

/// A notifier that manages the state of a Devices according to the event that is dispatched to it.
class DevicesNotifier extends StateNotifier<DevicesState> {
  DevicesNotifier(DevicesState state) : super(state);

  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    List<TwentyfourItemModel> newList = List<TwentyfourItemModel>.from(
        state.devicesModelObj!.twentyfourItemList);
    newList[index] = newList[index].copyWith(isSelected: value);
    state = state.copyWith(
        devicesModelObj:
            state.devicesModelObj?.copyWith(twentyfourItemList: newList));
  }
}
