import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manajemen_pelayanan/core/models/service_item.dart';
import 'package:manajemen_pelayanan/feature/home/bloc/serviceitembloc.dart';
import 'package:manajemen_pelayanan/feature/home/screen/loginscreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceItemBloc, ServiceItemState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFDCEBFF),
                      child: Icon(
                        Icons.person,
                        color: Color(0xFF2563EB),
                        size: 34,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Admin Pelayanan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Operator layanan masyarakat',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  _InfoTile(
                    icon: Icons.pending_actions,
                    title: 'Layanan menunggu',
                    value: state.countByStatus(ServiceStatus.pending),
                  ),
                  _InfoTile(
                    icon: Icons.sync,
                    title: 'Sedang diproses',
                    value: state.countByStatus(ServiceStatus.inProgress),
                  ),
                  _InfoTile(
                    icon: Icons.check_circle_outline,
                    title: 'Selesai',
                    value: state.countByStatus(ServiceStatus.completed),
                  ),
                  _InfoTile(
                    icon: Icons.cancel_outlined,
                    title: 'Dibatalkan',
                    value: state.countByStatus(ServiceStatus.cancelled),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Keluar'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF2563EB)),
      title: Text(title),
      trailing: Text(
        value.toString(),
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      ),
    );
  }
}
