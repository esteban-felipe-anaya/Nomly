import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../data/models/address.dart';
import '../../../shared/layout/responsive.dart';
import '../application/address_controller.dart';

/// Create or edit a single delivery [Address].
class AddressEditScreen extends ConsumerStatefulWidget {
  const AddressEditScreen({super.key, this.existing});

  final Address? existing;

  @override
  ConsumerState<AddressEditScreen> createState() => _AddressEditScreenState();
}

class _AddressEditScreenState extends ConsumerState<AddressEditScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _label;
  late final TextEditingController _line1;
  late final TextEditingController _line2;
  late final TextEditingController _city;
  late final TextEditingController _notes;

  late bool _isDefault;
  bool _saving = false;

  bool get _isEditing => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _label = TextEditingController(text: e?.label ?? '');
    _line1 = TextEditingController(text: e?.line1 ?? '');
    _line2 = TextEditingController(text: e?.line2 ?? '');
    _city = TextEditingController(text: e?.city ?? '');
    _notes = TextEditingController(text: e?.notes ?? '');
    _isDefault = e?.isDefault ?? false;
  }

  @override
  void dispose() {
    _label.dispose();
    _line1.dispose();
    _line2.dispose();
    _city.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);

    final existing = widget.existing;
    final id = existing?.id ??
        'adr_${DateTime.now().millisecondsSinceEpoch}';

    final label = _label.text.trim();
    var address = Address(
      id: id,
      label: label.isEmpty ? 'Address' : label,
      line1: _line1.text.trim(),
      line2: _line2.text.trim(),
      city: _city.text.trim(),
      notes: _notes.text.trim(),
      lat: existing?.lat,
      lng: existing?.lng,
      isDefault: _isDefault,
    );
    // Preserve the original userId when editing (model defaults it otherwise).
    if (existing != null) {
      address = address.copyWith(userId: existing.userId);
    }

    final notifier = ref.read(addressControllerProvider.notifier);
    try {
      if (_isEditing) {
        await notifier.edit(address);
      } else {
        await notifier.add(address);
      }
      if (!mounted) return;
      context.pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('Could not save address: $e')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit address' : 'Add address'),
      ),
      body: SafeArea(
        child: CenteredConstrained(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                TextFormField(
                  controller: _label,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Label',
                    hintText: 'Home, Work, …',
                    prefixIcon: Icon(Icons.label_outline),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                TextFormField(
                  controller: _line1,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Address line 1',
                    prefixIcon: Icon(Icons.home_outlined),
                  ),
                  validator: (value) =>
                      (value == null || value.trim().isEmpty)
                          ? 'Address line 1 is required'
                          : null,
                ),
                const SizedBox(height: AppSpacing.lg),
                TextFormField(
                  controller: _line2,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Address line 2',
                    prefixIcon: Icon(Icons.apartment_outlined),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                TextFormField(
                  controller: _city,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    prefixIcon: Icon(Icons.location_city_outlined),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                TextFormField(
                  controller: _notes,
                  textInputAction: TextInputAction.done,
                  minLines: 2,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                    hintText: 'Gate code, floor, etc.',
                    prefixIcon: Icon(Icons.sticky_note_2_outlined),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _isDefault,
                  onChanged: _saving
                      ? null
                      : (value) => setState(() => _isDefault = value),
                  title: const Text('Set as default'),
                  subtitle: const Text('Use this address for new orders.'),
                ),
                const SizedBox(height: AppSpacing.xl),
                FilledButton(
                  onPressed: _saving ? null : _save,
                  child: _saving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2.5),
                        )
                      : Text(_isEditing ? 'Save changes' : 'Add address'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
