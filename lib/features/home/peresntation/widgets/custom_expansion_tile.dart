import 'package:safety_app/core/utils/imports.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final Widget? leading;
  final List<Widget> content;
  const CustomExpansionTile({
    super.key,
    required this.title,
    this.leading,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: AppRadius.r14,
        color: AppColors.white,
        boxShadow: AppShadow.primaryShadow,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(title, style: AppTextStyle.blackBold16),
          tilePadding: EdgeInsets.symmetric(horizontal: 16),
          leading: leading,
          childrenPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: content,
        ),
      ),
    );
  }
}
