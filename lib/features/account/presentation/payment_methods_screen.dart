import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../shared/layout/responsive.dart';

/// Local-only mock model for a saved payment method. There is no payment API,
/// so these live entirely in this screen's state per the build spec.
class PaymentCard {
  const PaymentCard({
    required this.id,
    required this.brand,
    required this.last4,
    required this.icon,
  });

  final String id;
  final String brand;
  final String last4;
  final IconData icon;

  /// Masked display number; empty [last4] (e.g. cash) renders without digits.
  String get masked => last4.isEmpty ? brand : '•••• $last4';
}

/// Payment methods: lets the user pick a default card from a mock list and add
/// new (cosmetic) cards. All state is local to this screen.
class PaymentMethodsScreen extends ConsumerStatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  ConsumerState<PaymentMethodsScreen> createState() =>
      _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends ConsumerState<PaymentMethodsScreen> {
  final List<PaymentCard> _cards = [
    const PaymentCard(
      id: 'visa-4242',
      brand: 'Visa',
      last4: '4242',
      icon: Icons.credit_card,
    ),
    const PaymentCard(
      id: 'mc-5555',
      brand: 'Mastercard',
      last4: '5555',
      icon: Icons.credit_card,
    ),
    const PaymentCard(
      id: 'cash',
      brand: 'Cash on delivery',
      last4: '',
      icon: Icons.payments_outlined,
    ),
  ];

  late String _selectedId = _cards.first.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment methods')),
      body: SafeArea(
        child: CenteredConstrained(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.lg,
            ),
            children: [
              Card(
                child: RadioGroup<String>(
                  groupValue: _selectedId,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _selectedId = value);
                    }
                  },
                  child: Column(
                    children: [
                      for (var i = 0; i < _cards.length; i++) ...[
                        RadioListTile<String>(
                          value: _cards[i].id,
                          secondary: Icon(_cards[i].icon),
                          title: Text(_cards[i].brand),
                          subtitle: _cards[i].last4.isEmpty
                              ? null
                              : Text(_cards[i].masked),
                        ),
                        if (i != _cards.length - 1) const Divider(height: 1),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _showAddCardDialog,
                  icon: const Icon(Icons.add),
                  label: const Text('Add card'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAddCardDialog() async {
    final numberController = TextEditingController();
    final nameController = TextEditingController();
    final expiryController = TextEditingController();

    final card = await showDialog<PaymentCard>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add card'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name on card'),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(labelText: 'Card number'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: expiryController,
                decoration: const InputDecoration(labelText: 'Expiry (MM/YY)'),
                keyboardType: TextInputType.datetime,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final digits =
                    numberController.text.replaceAll(RegExp(r'\D'), '');
                final last4 = digits.length >= 4
                    ? digits.substring(digits.length - 4)
                    : digits.padLeft(4, '0');
                Navigator.of(dialogContext).pop(
                  PaymentCard(
                    id: 'card-${DateTime.now().microsecondsSinceEpoch}',
                    brand: 'Card',
                    last4: last4,
                    icon: Icons.credit_card,
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    numberController.dispose();
    nameController.dispose();
    expiryController.dispose();

    if (card == null) return;
    setState(() {
      _cards.add(card);
      _selectedId = card.id;
    });
  }
}
