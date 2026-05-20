class ServiceState {
  final String name;
  final String description;
  final String status;

  const ServiceState({
    this.name = '',
    this.description = '',
    this.status = 'idle',
  });

  ServiceState copyWith({String? name, String? description, String? status}) {
    return ServiceState(
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'description': description, 'status': status};
  }

  factory ServiceState.fromMap(Map<String, dynamic> map) {
    return ServiceState(
      name: map['name'] as String? ?? '',
      description: map['description'] as String? ?? '',
      status: map['status'] as String? ?? 'idle',
    );
  }

  @override
  String toString() =>
      'ServiceState(name: $name, description: $description, status: $status)';
}
