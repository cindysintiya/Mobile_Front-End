import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baloonblooms/providers/custom_provider.dart';
import 'package:baloonblooms/providers/login_provider.dart';
import 'package:baloonblooms/components/custom_color.dart';

class CustomProduct extends StatefulWidget {
  const CustomProduct({super.key, required this.reference});

  final Map reference;

  @override
  State<CustomProduct> createState() => _CustomProductState();
}

class _CustomProductState extends State<CustomProduct> {
  @override
  Widget build(BuildContext context) {

    final provCustom = Provider.of<CustomProvider>(context);
    final provLogin = Provider.of<LoginProvider>(context);

    tag(String str) {
      return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.fromLTRB(8, 10, 8, 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: myCustomColor()[400],
        ),
        child: Text(str, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
      );
    }

    smallTag(String str) {
      return Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.fromLTRB(12, 8, 5, 5),
        child: Text(str, style: TextStyle(backgroundColor: myCustomColor()[100], fontSize: 17.5),),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom the way u like!'),
      ),
      body: ListView(
        children: [
          tag('REFERENCE'),
          Card(
            elevation: 8,
            margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                children: [
                  Image.asset('assets/${widget.reference['code']}.jpg', width: MediaQuery.of(context).size.width/3, height: MediaQuery.of(context).size.width/2.6, fit: BoxFit.cover,),
                  const SizedBox(width: 10,),
                  LayoutBuilder(   // biar ukuran ikut mamak
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth/1.9,
                            child: Text(widget.reference['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5),)
                          ),
                          const SizedBox(height: 2,),
                          Text('Rp. ${widget.reference['price']/1000}.000,-', style: const TextStyle(fontSize: 16),),
                          const SizedBox(height: 5,),
                          const Text('Include :'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.reference['include'].map<Widget>((include) {
                              return Container(
                                padding: const EdgeInsets.only(left: 12),
                                width: constraints.maxWidth/1.9,
                                child: Text('° $include'),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
          tag('CUSTOMIZATION'),
          smallTag('BALLOON'),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 8),
            child: Table(
              defaultColumnWidth: const IntrinsicColumnWidth(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text('Type :', style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text('Color :', style: TextStyle(fontSize: 16)),
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: DropdownButtonFormField(
                        value: provCustom.balloon,
                        onChanged: (val) => provCustom.balloon = val,
                        items: [ for (var tipe in provCustom.ballType) DropdownMenuItem(value: tipe, child: Text(tipe)) ],
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        hint: const Text('Balloon Type'),
                        decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.only(left: 8)),
                        elevation: 2,
                        style: const TextStyle(fontSize: 17, color: Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: DropdownButtonFormField(
                        value: provCustom.bColor,
                        onChanged: (val) => provCustom.bColor = val,
                        items: [ for (var col in provCustom.colors) DropdownMenuItem(value: col, child: Text(col)) ],
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        hint: const Text('Balloon Color'),
                        elevation: 2,
                        style: const TextStyle(fontSize: 17, color: Colors.black54),
                        decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.only(left: 8)),
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
          smallTag('RIBBON'),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 8),
            child: Table(
              defaultColumnWidth: const IntrinsicColumnWidth(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text('Type :', style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text('Color :', style: TextStyle(fontSize: 16)),
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: DropdownButtonFormField(
                        value: provCustom.ribbon,
                        onChanged: (val) => provCustom.ribbon = val,
                        items: [ for (var type in provCustom.ribType) DropdownMenuItem(value: type, child: Text(type)) ],
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        hint: const Text('Ribbon Type'),
                        decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.only(left: 8)),
                        elevation: 2,
                        style: const TextStyle(fontSize: 17, color: Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: DropdownButtonFormField(
                        value: provCustom.rColor,
                        onChanged: (val) => provCustom.rColor = val,
                        items: [ for (var col in provCustom.colors) DropdownMenuItem(value: col, child: Text(col)) ],
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        hint: const Text('Ribbon Color'),
                        elevation: 2,
                        style: const TextStyle(fontSize: 17, color: Colors.black54),
                        decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.only(left: 8)),
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
          smallTag('ACCESSORIES'),
          for (var acc in provCustom.accessories.entries)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                value: acc.value, 
                title: acc.value? Text('${acc.key}  (Rp. ${provCustom.budget[acc.key]~/1000}.000,-)', style: const TextStyle(fontWeight: FontWeight.bold),) : Text(acc.key), 
                subtitle: acc.value? Row(
                  children: [
                    const Text('Budget'),
                    Tooltip(
                      message: 'Rp. ${provCustom.budget[acc.key]~/1000}.000,-',
                      child: Slider(
                        min: 10000, max: 250000,
                        value: provCustom.budget[acc.key], onChanged: (val) => provCustom.changeBudget(acc.key, (val~/1000)*1000)
                      ),
                    ),
                    // Text('Rp. ${provCustom.budget[acc.key]~/1000}.000,-'),
                  ],
                ) : null,
                onChanged: (val) => provCustom.accessories = acc.key
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 2, 20, 5),
            child: TextField(
              controller: provCustom.accNotes,
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: 'Write your notes here ...',
              ),
            ),
          ),
          smallTag('CELLOPHANE'),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 2, 20, 5),
            child: Row(
              children: [
                const Text('Color :'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DropdownButtonFormField(
                      value: provCustom.cellophane,
                      onChanged: (val) => provCustom.cellophane = val,
                      items: [ for (var cello in provCustom.cellophanes) DropdownMenuItem(value: cello, child: Text(cello)) ],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: const Text('Cellophane Color'),
                      elevation: 2,
                      style: const TextStyle(fontSize: 17, color: Colors.black54),
                      decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.only(left: 8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          smallTag('CARD'),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 2, 20, 5),
            child: TextField(
              controller: provCustom.cardNotes,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: 'Write your notes here ...',
              ),
            ),
          ),
          smallTag('PORTRAIT ART'),
          tag('CONTACT INFORMATION'),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 8),
            child: Table(
              // defaultColumnWidth: const IntrinsicColumnWidth(),
              columnWidths: const {
                0 : IntrinsicColumnWidth(),
                1 : IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    const Text('Username'),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(':'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 3, 10, 3),
                      child: TextField(
                        controller: provLogin.username,
                        decoration: InputDecoration(
                          hintText: 'ballonblooms',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                      )
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text('Fullname'),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(':'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 3, 10, 3),
                      child: TextField(
                        controller: provLogin.fullname,
                        decoration: InputDecoration(
                          hintText: 'Balloon Blooms',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                      )
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text('Phone Number'),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(':'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 3, 10, 3),
                      child: TextField(
                        controller: provLogin.fullname,
                        decoration: InputDecoration(
                          hintText: '082103470515',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        keyboardType: TextInputType.phone,
                      )
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text('Email'),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(':'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 3, 10, 3),
                      child: TextField(
                        controller: provLogin.fullname,
                        decoration: InputDecoration(
                          hintText: 'blommers@civic.com',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      )
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text('Address'),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(':'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 3, 10, 3),
                      child: TextField(
                        controller: provCustom.address,
                        decoration: InputDecoration(
                          hintText: 'Jalan road Gang alley No 111',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                      )
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text('Received Date'),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(':'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 3, 10, 3),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: provCustom.dateTime,
                              readOnly: true,
                              decoration: InputDecoration(
                              hintText: '${DateFormat('dd/MM/yyyy').format(provCustom.date)} ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            )
                          ),
                          IconButton(
                            onPressed: () async {
                              var res = await showDatePicker(
                                context: context, 
                                initialDate: provCustom.date, 
                                firstDate: DateTime.now(), 
                                lastDate: DateTime.now().add(const Duration(days: 30))
                              );
                              if (res != null) {
                                provCustom.date = res; 
                                provCustom.dateTime.text = '${DateFormat('dd/MM/yyyy').format(res)} ${provCustom.time.text}';
                              }
                            }, 
                            icon: const Icon(Icons.date_range_rounded)
                          ),
                          IconButton(
                            onPressed: () async {
                              var res = await showTimePicker(
                                context: context, 
                                initialTime: TimeOfDay.now(),
                                builder: (BuildContext context, Widget? child) {
                                  return MediaQuery(
                                    data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                    child: child!,
                                  );
                                },
                              );
                              if (res != null && mounted) {
                                provCustom.time = TextEditingController(text: res.format(context));
                                provCustom.dateTime.text = '${DateFormat('dd/MM/yyyy').format(provCustom.date)} ${provCustom.time.text}';
                              }
                            }, 
                            icon: const Icon(Icons.timer_rounded)
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}