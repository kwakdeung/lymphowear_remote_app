class AddDevice {
  final String name, model, loading;

  AddDevice({
    required this.name,
    required this.model,
    required this.loading,
  });
}

final List<AddDevice> adddeviceData = [
  AddDevice(
    name: 'LymphoWear',
    model: 'LW-100',
    loading: '40%',
  ),
  AddDevice(
    name: 'LymphoWear',
    model: 'LW-200',
    loading: '30%',
  ),
];
