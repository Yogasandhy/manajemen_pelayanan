import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manajemen_pelayanan/core/models/service_item.dart';
import 'package:manajemen_pelayanan/feature/home/bloc/serviceitembloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceItemBloc, ServiceItemState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            _SummarySection(state: state),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => _showAddServiceSheet(context),
              icon: const Icon(Icons.add),
              label: const Text('Tambah Layanan'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(46),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Daftar Layanan',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            if (state.items.isEmpty)
              const _EmptyServiceCard()
            else
              ...state.items.map((item) => _ServiceCard(item: item)),
          ],
        );
      },
    );
  }

  void _showAddServiceSheet(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            18,
            16,
            MediaQuery.of(sheetContext).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Tambah Layanan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: nameController,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Nama layanan'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                minLines: 2,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Keterangan'),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () {
                  if (nameController.text.trim().isEmpty) {
                    return;
                  }

                  context.read<ServiceItemBloc>().addServiceItem(
                    nameController.text,
                    descriptionController.text.isEmpty
                        ? 'Belum ada keterangan.'
                        : descriptionController.text,
                  );
                  Navigator.pop(sheetContext);
                },
                icon: const Icon(Icons.save_outlined),
                label: const Text('Simpan'),
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      nameController.dispose();
      descriptionController.dispose();
    });
  }
}

class _SummarySection extends StatelessWidget {
  const _SummarySection({required this.state});

  final ServiceItemState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            label: 'Total',
            value: state.items.length.toString(),
            color: const Color(0xFF2563EB),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _SummaryCard(
            label: 'Proses',
            value: state.countByStatus(ServiceStatus.inProgress).toString(),
            color: const Color(0xFFF59E0B),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _SummaryCard(
            label: 'Selesai',
            value: state.countByStatus(ServiceStatus.completed).toString(),
            color: const Color(0xFF059669),
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: Colors.grey.shade700)),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.item});

  final ServiceItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                _StatusBadge(status: item.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              item.description,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<ServiceStatus>(
                    initialValue: item.status,
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                    items: ServiceStatus.values
                        .map(
                          (status) => DropdownMenuItem(
                            value: status,
                            child: Text(status.label),
                          ),
                        )
                        .toList(),
                    onChanged: (status) {
                      if (status == null) {
                        return;
                      }
                      context.read<ServiceItemBloc>().updateStatus(
                        item.id,
                        status,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filledTonal(
                  tooltip: 'Hapus',
                  onPressed: () {
                    context.read<ServiceItemBloc>().removeServiceItem(item.id);
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final ServiceStatus status;

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      ServiceStatus.pending => const Color(0xFF6B7280),
      ServiceStatus.inProgress => const Color(0xFFF59E0B),
      ServiceStatus.completed => const Color(0xFF059669),
      ServiceStatus.cancelled => const Color(0xFFDC2626),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _EmptyServiceCard extends StatelessWidget {
  const _EmptyServiceCard();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Text('Belum ada layanan. Tambahkan layanan baru dulu.'),
      ),
    );
  }
}
