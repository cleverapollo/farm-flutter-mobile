// Copyright (c) 2022 Contributors to the Tingme project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

extension IterableExtensions<T> on Iterable<T>? {
  bool get isNull => this == null;

  bool get isBlank => isNull || this!.isEmpty;

  bool get isNotBlank => !isBlank;

  bool get isSingletonList => isNotBlank && this!.length == 1;

  T? get firstOrNull {
    if (isNull) return null;
    final iterator = this!.iterator;
    if (iterator.moveNext()) return iterator.current;

    return null;
  }

  T? get lastOrNull {
    try {
      return this!.last;
    } catch (e) {
      return null;
    }
  }

  String get toPath => isNotBlank ? this!.join('/') : '/';

  T? lastWhereOrNull(bool Function(T element) test, {T Function()? orElse}) {
    if (isNull) return null;
    try {
      return this!.lastWhere(test, orElse: orElse);
    } catch (e) {
      return null;
    }
  }

  T? firstWhereOrNull(bool Function(T element) test, {T Function()? orElse}) {
    if (isNull) return null;
    try {
      return this!.firstWhere(test, orElse: orElse);
    } catch (e) {
      return null;
    }
  }
}

extension ListWidgetExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) SizedBox(width: width, height: height),
          this[i],
        ],
      ];
}
