import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/core/utils/extensions/context_extension.dart';
import 'package:safety_app/features/report/presentation/widgets/app_bar.dart';
import 'package:safety_app/features/support_chat/presentation/bloc/chat_state.dart';

import '../bloc/chat_bloc.dart';
import '../widgets/chat_input_field.dart';
import '../widgets/message_bubble.dart';
import '../widgets/quick_action_chip.dart';

class SupportChatScreen extends StatelessWidget {
  SupportChatScreen({super.key});
  static const String routeName = '/supportChat';

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc(),
      child: Scaffold(
        backgroundColor: AppColors.mainBgColor,

        resizeToAvoidBottomInset: true,

        appBar: const ReportAppBar(
          appBarTitle: "الدعم الفني",
          subtitle: "متصل الان - فريق سلام",
        ),

        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 12),

              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        return MessageBubble(message: state.messages[index]);
                      },
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      QuickActionChip(
                        text: 'مشكلة في البلاغ',
                        icon: Icons.warning_amber_outlined,
                        onTap: () {},
                      ),

                      const SizedBox(width: 8),

                      QuickActionChip(
                        text: 'طلب مشرف',
                        icon: Icons.person_outline,
                        onTap: () {},
                      ),

                      const SizedBox(width: 8),

                      QuickActionChip(
                        text: 'إنهاء المحادثة',
                        icon: Icons.check_circle_outline,
                        textColor: AppColors.red,
                        onTap: () {
                          context.showCustomDialog(
                            dialogImage: Icon(Icons.ac_unit),
                            title: "title",
                            description: "description",
                            button1: "button1",
                            button2: "button2",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: ChatInputField(
          controller: controller,
          onSend: () {
            if (controller.text.trim().isNotEmpty) {
              context.read<ChatBloc>().add(
                SendMessageEvent(controller.text.trim()),
              );

              controller.clear();
            }
          },
        ),
      ),
    );
  }
}
