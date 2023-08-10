import 'package:flutter/material.dart';
import 'package:pmm/db/categorydb.dart';
import 'package:pmm/db/transactiondb.dart';
import 'package:pmm/model/datamodel.dart';
import 'package:pmm/model/transactionModel/transactionmodel.dart';

class ScreenAddTransaction extends StatefulWidget {
  const ScreenAddTransaction({super.key});

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  TextEditingController _purposeEditingController = TextEditingController();
  TextEditingController _AmountEditingController = TextEditingController();

  String? dropdownvalue;
  CategoryType? incometype = CategoryType.income;
  DateTime? selecteddate;
  DateTime? selecteddateper;
  CategoryModel? categoryModeltype;

  void showdate(BuildContext context) async {
    selecteddate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDate: DateTime.now());
    if (selecteddate == null) {
      return;
    } else {
      setState(() {
        selecteddateper = selecteddate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction"),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _purposeEditingController,
              decoration: const InputDecoration(hintText: "Purpose"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: _AmountEditingController,
              decoration: const InputDecoration(hintText: "Amount"),
            ),
          ),
          ElevatedButton.icon(
              onPressed: () {
                showdate(context);
              },
              icon: const Icon(Icons.calendar_view_day_rounded),
              label: Text(selecteddate == null
                  ? 'Pick Date'
                  : selecteddateper!.toString())),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Radio<CategoryType>(
                      value: CategoryType.income,
                      groupValue: incometype,
                      onChanged: (value) {
                        setState(() {
                          incometype = value;
                          dropdownvalue = null;
                        });
                      }),
                  const Text("income")
                ],
              ),
              Row(
                children: [
                  Radio<CategoryType>(
                      value: CategoryType.expance,
                      groupValue: incometype,
                      onChanged: (value) {
                        setState(() {
                          incometype = value;
                          dropdownvalue = null;
                        });
                      }),
                  const Text("Expance")
                ],
              )
            ],
          ),
          DropdownButton(
              hint: const Text("Select category"),
              style: const TextStyle(color: Colors.grey),
              value: dropdownvalue,
              onChanged: (value) {
                setState(() {
                  dropdownvalue = value;
                });
              },
              items: incometype == CategoryType.income
                  ? Category().incomecategory.value.map((e) {
                      return DropdownMenuItem(
                        value: e.id,
                        child: Text(e.name),
                        onTap: () {
                          categoryModeltype = e;
                        },
                      );
                    }).toList()
                  : Category()
                      .expenxecategory
                      .value
                      .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name),
                            onTap: () {
                              categoryModeltype = e;
                            },
                          ))
                      .toList()),
          ElevatedButton(
              onPressed: () {
                gettransactionData();
              },
              child: const Text("submit"))
        ],
      )),
    );
  }

  Future<void> gettransactionData() async {
    final purposecontroller = _purposeEditingController.text;
    final amountcontroller = _AmountEditingController.text;

    if (purposecontroller.isEmpty ||
        amountcontroller.isEmpty ||
        selecteddateper == null ||
        dropdownvalue == null ||
        categoryModeltype == null) {
      return;
    }
    final amount = double.tryParse(amountcontroller);
    final transactionModeldata = TransactionModel(
        purpose: purposecontroller,
        amount: amount!,
        date: selecteddateper!,
        type: incometype!,
        category: categoryModeltype!);
    TransactionDB().addtransaction(transactionModeldata);
    TransactionDB().refreshtransactionui();

    Navigator.of(context).pop();
  }
}
