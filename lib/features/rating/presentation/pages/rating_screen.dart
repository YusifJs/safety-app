import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/core/constants/app_assets.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/features/rating/data/repo/rating_repository_impl.dart';
import 'package:safety_app/features/rating/domain/usecases/submit_rating_usecase.dart';
import 'package:safety_app/features/rating/presentation/cubit/rating_bloc.dart';
import 'package:safety_app/features/rating/presentation/cubit/rating_event.dart';
import 'package:safety_app/features/rating/presentation/cubit/rating_state.dart';
import 'package:safety_app/features/report/presentation/widgets/app_bar.dart';
import 'package:safety_app/features/widgets/custom_dialog.dart';

class RatingScreen extends StatefulWidget {
  static const String routeName = '/ratingScreen';

  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final FocusNode _commentFocusNode = FocusNode();

  bool isFocused = false;

  @override
  void initState() {
    super.initState();

    _commentFocusNode.addListener(() {
      setState(() {
        isFocused = _commentFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _commentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RatingBloc(SubmitRatingUseCase(RatingRepositoryImpl())),
      child: Scaffold(
        backgroundColor: AppColors.mainBgColor,
        resizeToAvoidBottomInset: true,
        appBar: ReportAppBar(appBarTitle: "تقييم التطبيق"),

        body: BlocConsumer<RatingBloc, RatingState>(
          listener: (context, state) {
            if (state.isSuccess) {
              showDialog(
                context: context,
                builder: (_) {
                  return CustomDialog(
                    title: "شكراً لك ❤️",
                    description: "تم إرسال تقييمك بنجاح",
                    button1: "حسناً",
                    button2: "",
                    dialogImage: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 80,
                    ),
                  );
                },
              );

              context.read<RatingBloc>().add(ResetRatingState());
            }
          },

          builder: (context, state) {
            return Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                    ),

                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.78,
                      ),

                      child: Column(
                        children: [
                          Text(
                            "نطمح لتقديم أفضل تجربة أمان لك. شاركنا تجربتك لكي نستمر في التطور.",
                            textAlign: TextAlign.start,
                            style: const TextStyle(color: Colors.grey),
                          ),

                          const SizedBox(height: 30),

                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 20,
                                ),
                              ],
                            ),

                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.62,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,

                                children: [
                                  const Text(
                                    "انقر لتقييم تجربتك",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      5,
                                      (index) => IconButton(
                                        icon: Icon(
                                          index < state.rating
                                              ? Icons.star_rounded
                                              : Icons.star_outline_rounded,
                                          color: index < state.rating
                                              ? const Color(0xFFED9807)
                                              : Colors.grey.shade300,
                                          size: 42,
                                        ),
                                        onPressed: () {
                                          context.read<RatingBloc>().add(
                                            StarTapped(index + 1),
                                          );
                                        },
                                      ),
                                    ),
                                  ),

                                  const Divider(height: 45),

                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "أخبرنا المزيد عن تجربتك (اختياري)",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInOut,

                                    child: TextField(
                                      focusNode: _commentFocusNode,
                                      textAlign: TextAlign.right,
                                      maxLines: 5,

                                      onChanged: (value) {
                                        context.read<RatingBloc>().add(
                                          CommentChanged(value),
                                        );
                                      },

                                      decoration: InputDecoration(
                                        hintText:
                                            "ما الذي أعجبك في التطبيق؟ وكيف يمكننا تحسينه... ",

                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),

                                        filled: true,

                                        fillColor: isFocused
                                            ? AppColors.blue.withOpacity(0.08)
                                            : Color(0xFFF2F2F2),

                                        contentPadding: const EdgeInsets.all(
                                          18,
                                        ),

                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),

                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                          borderSide: const BorderSide(
                                            color: AppColors.blue,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const Spacer(),

                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: state.rating > 0
                                          ? AppColors.blue
                                          : Color(0xFFF2F2F2),
                                      minimumSize: const Size(
                                        double.infinity,
                                        58,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      elevation: 0,
                                    ),

                                    onPressed: state.rating > 0
                                        ? () {
                                            context.read<RatingBloc>().add(
                                              SubmitRatingPressed(),
                                            );
                                          }
                                        : null,

                                    child: const Text(
                                      "إرسال التقييم",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                if (state.isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.25),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
