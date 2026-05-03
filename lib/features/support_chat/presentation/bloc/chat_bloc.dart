import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/features/support_chat/presentation/bloc/chat_state.dart';
import '../models/message_model.dart';

part 'chat_event.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc()
    : super(
        ChatState(
          messages: [
            MessageModel(
              text: 'كيف يمكننا مساعدتك ؟',
              isSender: false,
              time: '10:49 PM',
            ),
            MessageModel(text: 'مشكلة تقنية', isSender: true, time: '10:49 PM'),
          ],
        ),
      ) {
    on<SendMessageEvent>(_sendMessage);
  }

  void _sendMessage(SendMessageEvent event, Emitter<ChatState> emit) {
    final updatedMessages = List<MessageModel>.from(state.messages)
      ..add(MessageModel(text: event.message, isSender: true, time: 'Now'));

    emit(state.copyWith(messages: updatedMessages));
  }
}
