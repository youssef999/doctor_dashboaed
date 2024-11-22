
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatsController extends GetxController {
  var messages = <ChatMessage>[].obs;
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  final ImagePicker _picker = ImagePicker();
Rx<int> count = 2.obs;

  @override
  void onInit() {
    super.onInit();
    _initRecorder();
    _initPlayer();
  }

  void _initRecorder() async {
    await _recorder.openRecorder();
    await _recorder.setSubscriptionDuration(const Duration(milliseconds: 10));
  }

  void _initPlayer() async {
    await _player.openPlayer();
  }

  Future<void> sendTextMessage(String text) async {
    messages.add(ChatMessage(text: text, type: MessageType.text));
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      messages.add(ChatMessage(imagePath: pickedFile.path, type: MessageType.image));
    }
  }

  Future<void> startRecording() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      if (!_recorder.isRecording) {
        await _recorder.startRecorder(toFile: 'audio.aac');
      }
    }
  }

  Future<void> stopRecording() async {
    if (_recorder.isRecording) {
      var path = await _recorder.stopRecorder();
      if (path != null) {
        messages.add(ChatMessage(audioPath: path, type: MessageType.audio));
      }
    }
  }

  Future<void> playAudio(String path) async {
    if (_player.isStopped) {
      await _player.startPlayer(fromURI: path, codec: Codec.aacADTS);
    } else {
      await _player.stopPlayer();
    }
  }

  @override
  void onClose() {
    _recorder.closeRecorder();
    _player.closePlayer();
    super.onClose();
  }
}

enum MessageType { text, image, audio }

class ChatMessage {
  final String? text;
  final String? imagePath;
  final String? audioPath;
  final MessageType type;

  ChatMessage({this.text, this.imagePath, this.audioPath, required this.type});
}
