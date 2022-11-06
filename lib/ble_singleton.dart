import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleSingleton {
  BleSingleton._privateConstructor();

  static final BleSingleton _instance = BleSingleton._privateConstructor();

  final _ble = FlutterReactiveBle();
  final serviceId = Uuid.parse("6E400001-B5A3-F393-E0A9-E50E24DCCA9E");
  final rx = Uuid.parse("6E400002-B5A3-F393-E0A9-E50E24DCCA9E");
  final tx = Uuid.parse("6E400003-B5A3-F393-E0A9-E50E24DCCA9E");

  StreamSubscription<DiscoveredDevice>? _scanStream;
  DiscoveredDevice? _device;

  void Function()? onSuccessScan;
  void Function(String)? onFailedScan;

  factory BleSingleton() {
    return _instance;
  }

  String serialNumber() {
    print("serial Number");
    return _device?.id ?? "xxxxxxxx";
  }

  void stopScan() {
    _scanStream?.cancel();
  }

  void scanDevices() {
    _scanStream?.cancel();
    _scanStream = _ble.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency).listen((device) {
      if (device.name == "Lymphowear") {
        _device = device;
        onSuccessScan?.call();
        stopScan();
      }
    }, onError: (e) {
      onFailedScan?.call(e.toString());
      stopScan();
    });
  }

  StreamSubscription<ConnectionStateUpdate>? _connectStream;
  void Function()? onSuccessConnect;
  void Function(String)? onFailedConnect;

  void connect() {
    _connectStream?.cancel();

    if (_device == null) {
      onFailedConnect?.call("Not found");
      return;
    }

    var device = _device!;

    _connectStream = _ble
        .connectToDevice(id: device.id, servicesWithCharacteristicsToDiscover: {
      serviceId: [rx, tx]
    }).listen((event) async {
      if (event.connectionState == DeviceConnectionState.connected) {
        await _ble.requestMtu(deviceId: device.id, mtu: 247);

        onSuccessConnect?.call();
        _ble
            .subscribeToCharacteristic(QualifiedCharacteristic(
                characteristicId: tx,
                serviceId: serviceId,
                deviceId: device.id))
            .listen((event) {
          // setState(() {
          //   text = String.fromCharCodes(event);
          // });
        });

        // await _writeToDevice();
      }
    });
  }
}
