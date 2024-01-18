// ignore_for_file: camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/GlobalFunction/GetDonVi.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/DonVi.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';

double borderRadius = 20;

class Custom_DropdownDonViTheoTenTatCa extends ConsumerWidget {
  Custom_DropdownDonViTheoTenTatCa({super.key, required this.nhanvienDonVi});
  int nhanvienDonVi;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDV = ref.watch(riverpod_instance.selectedTenDonViTatCa);
    return nhanvienDonVi == 13 || nhanvienDonVi == 2
        ? SingleChildScrollView(
            child: FutureBuilder<List<DonVi>>(
                future:
                    checkLocalConnectionApi().then((value) => listDonVi(value)),
                builder: ((context, snapshot) {
                  return Custom_FutureBuilder(
                      isDropDownButton: true,
                      contextParam: context,
                      snapshot: snapshot,
                      widgetParam: snapshot.hasData
                          ?
                          // if (snapshot.connectionState == ConnectionState.waiting ||
                          //     snapshot.data == null) {
                          //   return const Text('Đang tải danh sách đơn vị....');
                          // } else {
                          //   return
                          DropdownButton(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                              hint: const Text('Chọn đơn vị'),
                              value: selectedDV,
                              items: snapshot.data!.map((e) {
                                return DropdownMenuItem(
                                  value: e.donvi_ten.toString(),
                                  child: e.donvi_ten == null
                                      ? const Text('Tất cả đơn vị')
                                      : Text(
                                          e.donvi_ten.toString(),
                                        ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                ref
                                    .read(riverpod_instance
                                        .selectedTenDonViTatCa.notifier)
                                    .state = value!;
                              },
                            )
                          : const Text(''));
                }
                    //  : const Text(''));
                    )),
          )
        : const SizedBox();
  }
}

class Custom_DropDownDonViTheoTen11PBH extends ConsumerWidget {
  Custom_DropDownDonViTheoTen11PBH({super.key, required this.nhanvienDonVi});
  int nhanvienDonVi;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDV = ref.watch(riverpod_instance.selectedTenDonVi11Pbh);
    return nhanvienDonVi == 13 || nhanvienDonVi == 2
        ? SingleChildScrollView(
            child: FutureBuilder<List<DonVi>>(
                future: checkLocalConnectionApi()
                    .then((value) => listDonVi11PBH(value)),
                builder: ((context, snapshot) {
                  return Custom_FutureBuilder(
                      isDropDownButton: true,
                      contextParam: context,
                      snapshot: snapshot,
                      widgetParam: snapshot.hasData
                          ?
                          // if (snapshot.connectionState == ConnectionState.waiting ||
                          //     snapshot.data == null) {
                          //   return const Text('Đang tải danh sách đơn vị....');
                          // } else {
                          //  return
                          DropdownButton(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                              hint: const Text('Chọn đơn vị'),
                              value: selectedDV,
                              items: snapshot.data!.map((e) {
                                return DropdownMenuItem(
                                  value: e.donvi_ten.toString(),
                                  child: e.donvi_ten == null
                                      ? const Text('Tất cả đơn vị')
                                      : Text(
                                          e.donvi_ten.toString(),
                                        ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                ref
                                    .read(riverpod_instance
                                        .selectedTenDonVi11Pbh.notifier)
                                    .state = value!;
                              },
                            )
                          : const Text(''));
                }
                    //  : const Text(''));
                    )),
          )
        : const SizedBox();
  }
}

class Custom_DropDownDonViTheoTen11PBHVaPbcn extends ConsumerWidget {
  Custom_DropDownDonViTheoTen11PBHVaPbcn(
      {super.key, required this.nhanvienDonVi});
  int nhanvienDonVi;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDV = ref.watch(riverpod_instance.selectedIdDonVi11PbhVaPbcn);
    return nhanvienDonVi == 13 || nhanvienDonVi == 2
        ? SingleChildScrollView(
            child: FutureBuilder<List<DonVi>>(
                future: checkLocalConnectionApi()
                    .then((value) => listDonVi11PBHVaPBCN(value)),
                builder: ((context, snapshot) {
                  return Custom_FutureBuilder(
                      isDropDownButton: true,
                      contextParam: context,
                      snapshot: snapshot,
                      widgetParam: snapshot.hasData
                          ?
                          // if (snapshot.connectionState == ConnectionState.waiting ||
                          //     snapshot.data == null) {
                          //   return const Text('Đang tải danh sách đơn vị....');
                          // } else {
                          //   return
                          DropdownButton(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                              hint: const Text('Chọn đơn vị'),
                              value: selectedDV,
                              items: snapshot.data!.map((e) {
                                return DropdownMenuItem(
                                  value: e.donvi_ten.toString(),
                                  child: e.donvi_ten == null
                                      ? const Text('Tất cả đơn vị')
                                      : Text(
                                          e.donvi_ten.toString(),
                                        ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                ref
                                    .read(riverpod_instance
                                        .selectedIdDonVi11PbhVaPbcn.notifier)
                                    .state = value!;
                              },
                            )
                          : const Text(''));
                }
                    //  : const Text(''));
                    )),
          )
        : const SizedBox();
  }
}

class Custom_DropdownDonViTheoIdTatCa extends ConsumerWidget {
  Custom_DropdownDonViTheoIdTatCa({super.key, required this.nhanvienDonVi});
  int nhanvienDonVi;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDV = ref.watch(riverpod_instance.selectedIdDonViTatCa);
    return nhanvienDonVi == 13 || nhanvienDonVi == 2
        ? SingleChildScrollView(
            child: FutureBuilder<List<DonVi>>(
                future:
                    checkLocalConnectionApi().then((value) => listDonVi(value)),
                builder: ((context, snapshot) {
                  return Custom_FutureBuilder(
                      isDropDownButton: true,
                      contextParam: context,
                      snapshot: snapshot,
                      widgetParam: snapshot.hasData
                          ?
                          // if (snapshot.connectionState == ConnectionState.waiting ||
                          //     snapshot.data == null) {
                          //   return const Text('Đang tải danh sách đơn vị....');
                          // } else {
                          //   return
                          DropdownButton(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                              hint: const Text('Chọn đơn vị'),
                              value: selectedDV,
                              items: snapshot.data!.map((e) {
                                return DropdownMenuItem(
                                  value: e.donvi_id.toString(),
                                  child: e.donvi_ten == null
                                      ? const Text('Tất cả đơn vị')
                                      : Text(
                                          e.donvi_ten.toString(),
                                        ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                ref
                                    .read(riverpod_instance
                                        .selectedIdDonViTatCa.notifier)
                                    .state = value!;
                              },
                            )
                          : const Text(''));
                }
                    //  : const Text(''));
                    )),
          )
        : const SizedBox();
  }
}

class Custom_DropdownDonViTheoId11Pbh extends ConsumerWidget {
  Custom_DropdownDonViTheoId11Pbh({super.key, required this.nhanvienDonVi});
  int nhanvienDonVi;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDV = ref.watch(riverpod_instance.selectedIdDonVi11Pbh);
    return nhanvienDonVi == 13 || nhanvienDonVi == 2
        ? SingleChildScrollView(
            child: FutureBuilder<List<DonVi>>(
                future: checkLocalConnectionApi()
                    .then((value) => listDonVi11PBH(value)),
                builder: ((context, snapshot) {
                  return Custom_FutureBuilder(
                      isDropDownButton: true,
                      contextParam: context,
                      snapshot: snapshot,
                      widgetParam: snapshot.hasData
                          ?
                          // if (snapshot.connectionState == ConnectionState.waiting ||
                          //     snapshot.data == null) {
                          //   return const Text('Đang tải danh sách đơn vị....');
                          // } else {
                          //   return
                          DropdownButton(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                              hint: const Text('Chọn đơn vị'),
                              value: selectedDV,
                              items: snapshot.data!.map((e) {
                                return DropdownMenuItem(
                                  value: e.donvi_id.toString(),
                                  child: e.donvi_ten == null
                                      ? const Text('Tất cả đơn vị')
                                      : Text(
                                          e.donvi_ten.toString(),
                                        ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                ref
                                    .read(riverpod_instance
                                        .selectedIdDonVi11Pbh.notifier)
                                    .state = value!;
                              },
                            )
                          : const Text(''));
                }
                    //  : const Text(''));
                    )),
          )
        : const SizedBox();
  }
}

class Custom_DropdownDonViTheoId11PbhVaPbcn extends ConsumerWidget {
  Custom_DropdownDonViTheoId11PbhVaPbcn(
      {super.key, required this.nhanvienDonVi});
  int nhanvienDonVi;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDV = ref.watch(riverpod_instance.selectedIdDonVi11PbhVaPbcn);
    return nhanvienDonVi == 13 || nhanvienDonVi == 2
        ? SingleChildScrollView(
            child: FutureBuilder<List<DonVi>>(
                future: checkLocalConnectionApi()
                    .then((value) => listDonVi11PBHVaPBCN(value)),
                builder: ((context, snapshot) {
                  return Custom_FutureBuilder(
                      isDropDownButton: true,
                      contextParam: context,
                      snapshot: snapshot,
                      widgetParam: snapshot.hasData
                          ?
                          // if (snapshot.connectionState == ConnectionState.waiting ||
                          //     snapshot.data == null) {
                          //   return const Text('Đang tải danh sách đơn vị....');
                          // } else {
                          //   return

                          DropdownButton(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                              hint: const Text('Chọn đơn vị'),
                              value: selectedDV,
                              items: snapshot.data!.map((e) {
                                return DropdownMenuItem(
                                  value: e.donvi_id.toString(),
                                  child: e.donvi_ten == null
                                      ? const Text('Tất cả đơn vị')
                                      : Text(
                                          e.donvi_ten.toString(),
                                        ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                ref
                                    .read(riverpod_instance
                                        .selectedIdDonVi11PbhVaPbcn.notifier)
                                    .state = value!;
                              },
                            )
                          : const Text(''));
                }
                    //  : const Text(''));
                    )),
          )
        : const SizedBox();
  }
}

class Custom_DropdownDonViTheoTenMoTa11Pbh extends ConsumerWidget {
  Custom_DropdownDonViTheoTenMoTa11Pbh(
      {super.key, required this.nhanvienDonVi});
  int nhanvienDonVi;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDV = ref.watch(riverpod_instance.selectedTenMoTa11Pbh);
    return nhanvienDonVi == 13 || nhanvienDonVi == 2
        ? SingleChildScrollView(
            child: FutureBuilder<List<DonVi>>(
                future: checkLocalConnectionApi()
                    .then((value) => listDonVi11PBH(value)),
                builder: ((context, snapshot) {
                  return Custom_FutureBuilder(
                      isDropDownButton: true,
                      contextParam: context,
                      snapshot: snapshot,
                      widgetParam: snapshot.hasData
                          ?
                          // if (snapshot.connectionState == ConnectionState.waiting ||
                          //     snapshot.data == null) {
                          //   return const Text('Đang tải danh sách đơn vị....');
                          // } else {
                          //   return
                          DropdownButton(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                              hint: const Text('Chọn đơn vị'),
                              value: selectedDV,
                              items: snapshot.data!.map((e) {
                                return DropdownMenuItem(
                                  value: e.donvi_mota.toString(),
                                  child: e.donvi_mota == "null"
                                      ? const Text('Tất cả đơn vị')
                                      : Text(
                                          e.donvi_mota.toString(),
                                        ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                ref
                                    .read(riverpod_instance
                                        .selectedTenMoTa11Pbh.notifier)
                                    .state = value!;
                              //  print(value);
                              },
                            )
                          : const Text(''));
                }
                    //  : const Text(''));
                    )),
          )
        : const SizedBox();
  }
}
