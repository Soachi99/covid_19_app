import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'state_details_state.dart';

class StateDetailsController extends StateNotifier<StateDetailsState> {
  StateDetailsController() : super(StateDetailsState());

  Future<void> urlLaunch(String url) async {
    try {
      Fluttertoast.showToast(msg: 'Lanzando web');
      await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
    } catch (e) {
      Fluttertoast.showToast(msg: 'No se pudo acceder a $url');
    }
  }
}

final stateDetailsControllerProvider =
    StateNotifierProvider<StateDetailsController, StateDetailsState>((ref) {
  return StateDetailsController();
});
