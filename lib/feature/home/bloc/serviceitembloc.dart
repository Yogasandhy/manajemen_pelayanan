import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manajemen_pelayanan/core/models/service_item.dart';

class ServiceItemState {
  const ServiceItemState({required this.items});

  final List<ServiceItem> items;

  int countByStatus(ServiceStatus status) {
    return items.where((item) => item.status == status).length;
  }

  ServiceItemState copyWith({List<ServiceItem>? items}) {
    return ServiceItemState(items: items ?? this.items);
  }
}

class ServiceItemBloc extends Cubit<ServiceItemState> {
  ServiceItemBloc()
    : super(
        ServiceItemState(
          items: [
            ServiceItem(
              id: '1',
              name: 'Surat Permohonan',
              description: 'Permohonan pindah domisili.',
              status: ServiceStatus.pending,
            ),
            ServiceItem(
              id: '2',
              name: 'Surat Permohonan',
              description: 'Permohonan anggaran untuk AI.',
              status: ServiceStatus.inProgress,
            ),
            ServiceItem(
              id: '3',
              name: 'Surat Laporan',
              description: 'Laporan hasil pekerjaan.',
              status: ServiceStatus.completed,
            ),
            ServiceItem(
              id: '4',
              name: 'Surat Permohonan',
              description: 'Permohonan resign.',
              status: ServiceStatus.cancelled,
            ),
          ],
        ),
      );

  void addServiceItem(String name, String description) {
    final item = ServiceItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name.trim(),
      description: description.trim(),
    );

    emit(state.copyWith(items: [item, ...state.items]));
  }

  void removeServiceItem(String id) {
    emit(
      state.copyWith(
        items: state.items.where((item) => item.id != id).toList(),
      ),
    );
  }

  void updateStatus(String id, ServiceStatus status) {
    emit(
      state.copyWith(
        items: state.items.map((item) {
          if (item.id != id) {
            return item;
          }
          return item.copyWith(status: status);
        }).toList(),
      ),
    );
  }
}
