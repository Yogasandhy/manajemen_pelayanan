enum ServiceStatus { pending, inProgress, completed, cancelled }

class ServiceItem {
  final String id;
  final String name;
  final String description;
  final ServiceStatus status;

  ServiceItem({
    required this.id,
    required this.name,
    required this.description,
    this.status = ServiceStatus.pending,
  });

  ServiceItem copyWith({
    String? id,
    String? name,
    String? description,
    ServiceStatus? status,
  }) {
    return ServiceItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}
