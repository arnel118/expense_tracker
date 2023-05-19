import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';


class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: now, 
      firstDate: firstDate, 
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null) {
      showDialog(context: context, builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please enter a valid title and amount!',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(), 
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(Expense(
      title: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
    ));

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
      child: Column(
        children: [
          TextField(
            style: Theme.of(context).textTheme.titleSmall,
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.titleSmall,
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate == null ? 'No date selected' 
                      : formatter.format(_selectedDate!), 
                      style: Theme.of(context).textTheme.titleSmall
                      ),
                      IconButton(
                        onPressed: _presentDatePicker, 
                        
                        icon: const Icon(
                          Icons.calendar_month,
                        ),
                      )
                    ],
                )
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map(
                  (category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ).toList(), 
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                }
              ),
              const Spacer(),
              TextButton(
                onPressed: () {  
                  Navigator.pop(context);
              },
              child: const Text('Cancel')),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Add Expense')),
            ],
          )
        ],
      ),
    );
  }

}