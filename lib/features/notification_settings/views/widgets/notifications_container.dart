import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsContainer extends StatefulWidget {
  const NotificationsContainer({
    super.key,
    required this.typeText,
    required this.descText,
    required this.iconNoti,
    required this.contColor,
    required this.iconColor,
    this.isFirst = false,
    this.setText = "",
  });

  final String typeText;
  final String descText;
  final IconData iconNoti;
  final Color contColor;
  final Color iconColor;
  final bool isFirst;
  final String setText;
  @override
  State<NotificationsContainer> createState() => _NotificationsContainerState();
}

class _NotificationsContainerState extends State<NotificationsContainer> {
  bool _isOn = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (widget.isFirst)
            Text(
              widget.setText,
              style: GoogleFonts.almarai(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              padding: EdgeInsets.all(8),
              width: 344,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 175, 175, 175),
                    blurRadius: 10,
                    offset: Offset(10, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                    value: _isOn,
                    onChanged: (value) {
                      setState(() => _isOn = value);
                    },
                    activeColor: const Color(0xFF174C8A),
                    inactiveTrackColor: Colors.white,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.typeText,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.almarai(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.descText,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF737373),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: widget.contColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Icon(widget.iconNoti, color: widget.iconColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
