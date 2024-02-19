import 'package:auto_route/auto_route.dart';
import 'package:financial_planner_app/screens/finance/bloc/finance_bloc.dart';
import 'package:financial_planner_app/screens/finance/tabs/income_tab.dart';
import 'package:financial_planner_app/screens/finance/tabs/spend_tab.dart';
import 'package:financial_planner_app/screens/finance/widgets/add_income_panel.dart';
import 'package:financial_planner_app/screens/finance/widgets/add_spend_panel.dart';
import 'package:financial_planner_app/screens/finance/widgets/total_amount_widget.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@RoutePage()
class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  final PanelController _addIncomePanelController = PanelController();
  final PanelController _addSpendPanelController = PanelController();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColors.blue,
            appBar: AppBar(
              bottom: TabBar(
                controller: _tabController,
                dividerColor: AppColors.blue,
                indicatorColor: AppColors.white,
                labelColor: AppColors.white,
                unselectedLabelColor: AppColors.grey,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_upward),
                        SizedBox(width: 5),
                        Text(
                          'Доходы',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_downward),
                      SizedBox(width: 5),
                      Text(
                        'Расходы',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.blue,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TotalAmountWidget(),
                  GestureDetector(
                    onTap: () {
                      switch (_tabController.index) {
                        case 0:
                          _addIncomePanelController.open();
                        case 1:
                          _addSpendPanelController.open();
                      }
                    },
                    child: Text(
                      'Добавить',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                IncomeTab(),
                SpendTab(),
              ],
            ),
          ),
        ),
        AddIncomePanel(controller: _addIncomePanelController),
        AddSpendPanel(controller: _addSpendPanelController),
      ],
    );
  }
}
