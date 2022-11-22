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

  var isRunning = false;
  var isConnected = false;

  void Function()? onSuccessScan;
  void Function(String)? onFailedScan;

  factory BleSingleton() {
    return _instance;
  }

  String serialNumber() {
    return _device?.id ?? "";
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

  var _beforeMessage = '';
  var _beforeGrade = 0;

  var collarbone = 0;
  var armpit = 0;
  var shoulder = 0;
  var heat = 0;

  writeToDevice2(String message, int grade) {
    var id = _device?.id;
    if (id == null) {
      return;
    }

    List<int> data = [...message.codeUnits, ..."$grade".codeUnits];
    data.addAll('\r'.codeUnits);

    _ble.writeCharacteristicWithResponse(
        QualifiedCharacteristic(
            characteristicId: rx, serviceId: serviceId, deviceId: id),
        value: data);
  }

  writeToDevice(String message, int grade) {
    if (message == _beforeMessage && _beforeGrade == grade) return;
    _beforeGrade = grade;
    _beforeMessage = message;

    var id = _device?.id;
    if (id == null) {
      return;
    }

    var data = [...message.codeUnits];
    if (grade != -1) {
      data.add(grade);
    }

    data.addAll('\r'.codeUnits);

    _ble.writeCharacteristicWithResponse(
        QualifiedCharacteristic(
            characteristicId: rx, serviceId: serviceId, deviceId: id),
        value: data);
  }

  StreamSubscription<ConnectionStateUpdate>? _connectStream;
  void Function()? onSuccessConnect;
  void Function(String)? onFailedConnect;

  void Function(String)? onRead;

  void disconnect() {
    _connectStream?.cancel();
  }

  Function()? onDisconnected;

  void connect() {
    _connectStream?.cancel();

    if (_device == null) {
      onFailedConnect?.call("Not found");
      return;
    }

    var device = _device!;
    _ble.connectedDeviceStream.listen((event) {
      if (event.connectionState == DeviceConnectionState.connected) {
        isConnected = true;
        writeToDevice2("+S0123123123123123123123123123123123123123123123", -1);
        writeToDevice2("+S1321321321321321321321321321321321321321321321", -1);
        writeToDevice2("+S2132132132132132132132132132132132132132132132", -1);

        _ble
            .subscribeToCharacteristic(QualifiedCharacteristic(
                characteristicId: tx,
                serviceId: serviceId,
                deviceId: device.id))
            .listen((event) {
          onData(String.fromCharCodes(event));
        });
      } else if (event.connectionState == DeviceConnectionState.disconnected) {
        if (isConnected) {
          isConnected = false;
          onDisconnected?.call();
        }
      }
    });

    _connectStream = _ble
        .connectToDevice(id: device.id, servicesWithCharacteristicsToDiscover: {
      serviceId: [rx, tx]
    }).listen((event) async {
      if (event.connectionState == DeviceConnectionState.connected) {
        await _ble.requestMtu(deviceId: device.id, mtu: 247);
        onSuccessConnect?.call();
      }
    });
  }

  void Function(int v)? onValueCollarbone;
  void Function(int v)? onValueShoulder;
  void Function(int v)? onValueArmpit;
  void Function(int v)? onValueHeat;

  void onData(String data) {
    if (data.startsWith("+S")) {
      var p = data.split(",");

      onValueCollarbone?.call(int.parse(p[2]));
      onValueArmpit?.call(int.parse(p[3]));
      onValueShoulder?.call(int.parse(p[4]));
      onValueHeat?.call(int.parse(p[5]));

      print(data);

      onRead?.call(data);
    }
  }

  void sync() {
    writeToDevice("+MC", collarbone);
    writeToDevice("+MA", armpit);
    writeToDevice("+MS", shoulder);
    writeToDevice("+MH", heat);
  }

  void syncPause() {
    writeToDevice("+MC", 0);
    writeToDevice("+MA", 0);
    writeToDevice("+MS", 0);
    writeToDevice("+MH", 0);
  }
}
