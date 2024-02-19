import 'package:auto_route/auto_route.dart';
import 'package:chip_list/chip_list.dart';
import 'package:financial_planner_app/models/bill_model.dart';
import 'package:financial_planner_app/router/router.dart';
import 'package:financial_planner_app/screens/finance/bloc/finance_bloc.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:financial_planner_app/widgets/action_button_widget.dart';
import 'package:financial_planner_app/widgets/textfield_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddSpendPanel extends StatefulWidget {
  final PanelController controller;

  const AddSpendPanel({super.key, required this.controller});

  @override
  State<AddSpendPanel> createState() => _AddSpendPanelState();
}

class _AddSpendPanelState extends State<AddSpendPanel> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  int _currentIndex = 0;
  DateTime _date = DateTime.now();

  final List<String> _categories = [
    'Закупки',
    'Еда',
    'Транспорт',
    'Рента',
    'Отдых',
    'Другое'
  ];

  @override
  void dispose() {
    _commentController.dispose();
    _valueController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (_picked != null) {
      _date = _picked;
      setState(() {
        _dateController.text = _picked.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      color: AppColors.blue,
      panel: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Добавить расходы',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.controller.close();
                    },
                    child: SvgPicture.asset(
                        'assets/images/elements/close-button.svg'),
                  ),
                ],
              ),
              SizedBox(height: 25),
              TextFieldAppWidget(
                controller: _commentController,
                hintText: 'Например, Покупка продуктов',
                title: 'Описание',
              ),
              SizedBox(height: 15),
              TextFieldAppWidget(
                controller: _valueController,
                hintText: '0 ₽',
                title: 'Сумма',
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Дата',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _dateController,
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.darkBlue,
                      prefixIcon: Icon(Icons.calendar_month),
                      prefixIconColor: AppColors.grey,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      hintStyle: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Категория',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 5),
              ChipList(
                inactiveBorderColorList: [Colors.transparent],
                activeBorderColorList: [Colors.transparent],
                listOfChipNames: _categories,
                activeBgColorList: [AppColors.white],
                inactiveBgColorList: const [AppColors.darkBlue],
                activeTextColorList: const [AppColors.blue],
                inactiveTextColorList: [AppColors.grey],
                listOfChipIndicesCurrentlySeclected: [_currentIndex],
                extraOnToggle: (val) {
                  _currentIndex = val;
                  setState(() {});
                },
              ),
              SizedBox(height: 25),
              ActionButtonWidget(
                  text: 'Добавить',
                  width: 370,
                  onTap: () {
                    if (_valueController != '' || _commentController != '') {
                      context.read<FinanceBloc>().add(
                        AddSpendBillEvent(
                          spendBill: BillModel(
                            value: double.parse(_valueController.text),
                            comment: _commentController.text,
                            date: _date,
                            type:  _categories[_currentIndex],
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.darkBlue,
                          content: Text(
                            'Ваш расход успешно добавлен!',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      );
                      context.router.popAndPush(MainRoute());
                    }
                  }),
            ],
          ),
        ),
      ),
      controller: widget.controller,
      maxHeight: MediaQuery.of(context).size.height * 0.7,
      defaultPanelState: PanelState.CLOSED,
      minHeight: 0,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      backdropEnabled: true,
    );
  }
}
