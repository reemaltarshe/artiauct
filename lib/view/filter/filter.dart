import 'package:flutter/material.dart';

class RightSideModal extends StatefulWidget {
  final double minPrice;
  final double maxPrice;
  final RangeValues initialRange; // لاستقبال النطاق الأولي من الصفحة الرئيسية

  const RightSideModal({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    required this.initialRange,
  });

  @override
  State<RightSideModal> createState() => _RightSideModalState();
}

class _RightSideModalState extends State<RightSideModal> {
  late RangeValues _currentRangeValues; // القيمة الحالية لشريط التمرير

  @override
  void initState() {
    super.initState();
    // تهيئة القيمة الحالية بالنطاق الأولي المرسل
    _currentRangeValues = widget.initialRange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFFF3E3),

      appBar: AppBar(
        backgroundColor: Color(0xFFFFF3E3),
        title: const Text('Filter by Price Range'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // إغلاق الواجهة وتمرير النطاق السعري المختار للصفحة السابقة
              Navigator.pop(context, _currentRangeValues);
            },
            child: const Text(
              'Done',
              style: TextStyle( fontSize: 16,color: Color(0xFFFFA45D),),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Price Range',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,width: 10,),
            RangeSlider(
              values: _currentRangeValues,
              min: widget.minPrice,
              max: widget.maxPrice,
              divisions: ((widget.maxPrice - widget.minPrice) / 10).round(),
              labels: RangeLabels(
                '\$${_currentRangeValues.start.round()}',
                '\$${_currentRangeValues.end.round()}',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              ' Price Range:\$${_currentRangeValues.start.round()} - \$${_currentRangeValues.end.round()}',
              style: const TextStyle(fontSize: 18,color: Color(0xFFFFA45D),),
            ),
          ],
        ),
      ),
    );
  }
}