import 'package:flutter/material.dart';

class Pertemuan14Screen extends StatefulWidget {
  const Pertemuan14Screen({super.key});

  @override
  State<Pertemuan14Screen> createState() => _Pertemuan14ScreenState();
}

class _Pertemuan14ScreenState extends State<Pertemuan14Screen> {
  DateTime _date = DateTime.now();
  DateTimeRange _dateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  TextEditingController? _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('211110347 - Cindy Sintiya'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Date Picker
              Row(
                children: [
                  const Text('Tanggal :'),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: InputDatePickerFormField(
                      initialDate: _date,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2250),
                      onDateSubmitted: (date) {
                        setState(() {
                          _date = date;
                        });
                      },
                    )
                  ),
                  IconButton(
                    onPressed: () async {
                      var res = await showDatePicker(
                        context: context, 
                        initialDate: _date, 
                        firstDate: DateTime(2000), 
                        lastDate: DateTime(2500)
                      );
                      if (res != null) {
                        setState(() {
                          _date = res;
                        });
                      }
                    }, 
                    icon: const Icon(Icons.date_range_rounded)
                  )
                ],
              ),
              ListTile(
                title: const Text('Tanggal terpilih'),
                subtitle: Text(_date.toString()),
              ),
              const Divider(),
              // Time Picker
              Row(
                children: [
                  const Text('Jam :'),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      enabled: false,
                      controller: _time,
                      decoration: const InputDecoration(
                        labelText: 'Jam'
                      ),
                    )
                  ),
                  IconButton(
                    onPressed: () async {
                      var res = await showTimePicker(
                        context: context, 
                        initialTime: TimeOfDay.now()
                      );
                      if (res != null) {
                        setState(() {
                          _time = TextEditingController(text: res.format(context));
                        });
                      }
                    }, 
                    icon: const Icon(Icons.timer_rounded)
                  )
                ],
              ),
              const Divider(),
              // Date Range
              Row(
                children: [
                  const Text('Tanggal Mulai :'),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: InputDatePickerFormField(
                      initialDate: _dateRange.start,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2250),
                    )
                  ),
                  const SizedBox(width: 10,),
                  const Text('Tanggal Akhir :'),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: InputDatePickerFormField(
                      initialDate: _dateRange.end,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2250),
                    )
                  ),
                  IconButton(
                    onPressed: () async {
                      var res = await showDateRangePicker(
                        context: context, 
                        firstDate: DateTime(2000), 
                        lastDate: DateTime(2500),
                        currentDate: DateTime.now(),
                      );
                      if (res != null) {
                        setState(() {
                          _dateRange = res;
                        });
                      }
                    }, 
                    icon: const Icon(Icons.date_range_outlined)
                  )
                ],
              ),
              const SizedBox(height: 10,),
              ListTile(
                title: const Text('Range tanggal terpilih'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var date = _dateRange.start; date.difference(_dateRange.end).inDays <= 0; date = date.add(const Duration(days: 1)))
                      Text(date.toString())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}