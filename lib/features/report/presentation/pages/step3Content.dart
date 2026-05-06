import 'dart:io';

import 'package:flutter/material.dart';
import 'package:safety_app/features/report/presentation/cubit/report_cubit.dart';
import 'package:safety_app/features/report/presentation/cubit/report_state.dart';
import 'package:safety_app/features/report/presentation/widgets/attachment_box.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/features/report/presentation/widgets/upload_model.dart';

class Step3Content extends StatelessWidget {
  const Step3Content({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 30),

            const Text(
              "وصف البلاغ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 14),

            Container(
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Align(
                alignment: Alignment.topRight,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "...اكتب تفاصيل الحادث هنا",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "المرفقات (اختياري)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: AttachmentBox(
                    icon: Icons.attach_file,
                    text: "مستند",
                    onTap: () async {
                      final result = await FilePicker.platform.pickFiles(
                        allowMultiple: true,
                      );

                      if (result != null) {
                        context.read<ReportCubit>().addFiles(
                          result.paths.whereType<String>().toList(),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: AttachmentBox(
                    icon: Icons.camera_alt_outlined,
                    text: "صورة/فيديو",
                    onTap: () async {
                      final picker = ImagePicker();
                      final images = await picker.pickMultiImage();

                      if (images.isNotEmpty) {
                        context.read<ReportCubit>().addImages(
                          images.map((e) => e.path).toList(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            BlocBuilder<ReportCubit, ReportState>(
              builder: (context, state) {
                if (state.images.isEmpty) return const SizedBox();

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemBuilder: (context, index) {
                    final item = state.images[index];

                    return Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(item.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        if (item.status == UploadStatus.uploading)
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: item.progress,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                        if (item.status == UploadStatus.success)
                          const Positioned(
                            top: 6,
                            right: 6,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                          ),

                        if (item.status == UploadStatus.failed)
                          const Positioned(
                            top: 6,
                            right: 6,
                            child: Icon(Icons.refresh, color: Colors.red),
                          ),
                      ],
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
