import 'package:safety_app/core/utils/imports.dart';
import 'package:safety_app/features/home/peresntation/widgets/emergency_card.dart';

class EmergencyNumbersPage extends StatefulWidget {
  const EmergencyNumbersPage({super.key});

  @override
  State<EmergencyNumbersPage> createState() => _EmergencyNumbersState();
}

class _EmergencyNumbersState extends State<EmergencyNumbersPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ارقام الطوارئ'),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 32,
          children: [
            _buildTextFormField(),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return EmergencyCard(country: 'مصر');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildTextFormField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppShadow.primaryShadow,
      ),
      child: TextFormField(
        controller: _searchController,
        onChanged: (value) {},
        cursorColor: AppColors.blue,
        decoration: InputDecoration(
          hintText: 'ابحث عن دولة...',
          hintStyle: AppTextStyle.darkGreyRegular14,
          prefixIcon: Icon(Icons.search, color: AppColors.darkGrey),
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
