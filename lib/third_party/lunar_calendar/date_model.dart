import 'package:cmo/l10n/l10n.dart';
import 'package:lunar/lunar.dart';

import 'date_format.dart';

//interface for picker data model
abstract class BasePickerModel {
  //a getter method for left column data, return null to end list
  String? leftStringAtIndex(int index);

  //a getter method for middle column data, return null to end list
  String? middleStringAtIndex(int index);

  //a getter method for right column data, return null to end list
  String? rightStringAtIndex(int index);

  String? hourStringAtIndex(int index);

  String? minuteStringAtIndex(int index);

  //set selected left index
  void setLeftIndex(int index);

  //set selected middle index
  void setMiddleIndex(int index);

  //set selected right index
  void setRightIndex(int index);

  void setHourIndex(int index);

  void setMinuteIndex(int index);

  //return current left index
  int currentLeftIndex();

  //return current middle index
  int currentMiddleIndex();

  //return current right index
  int currentRightIndex();

  int currentHourIndex();

  int currentMinuteIndex();

  //return final time
  DateTime? finalTime();

  //return left divider string
  String leftDivider();

  //return right divider string
  String rightDivider();

  String timeDivider();

  //layout proportions for 3 columns
  List<int> layoutProportions();
}

//a base class for picker data model
class CommonPickerModel extends BasePickerModel {
  late List<String> leftList;
  late List<String> middleList;
  late List<String> rightList;
  late List<String> hourList;
  late List<String> minuteList;
  late DateTime currentTime;
  late int _currentLeftIndex;
  late int _currentMiddleIndex;
  late int _currentRightIndex;
  late int _currentHourIndex;
  late int _currentMinuteIndex;

  CommonPickerModel();

  @override
  String? leftStringAtIndex(int index) {
    return null;
  }

  @override
  String? middleStringAtIndex(int index) {
    return null;
  }

  @override
  String? rightStringAtIndex(int index) {
    return null;
  }

  @override
  int currentLeftIndex() {
    return _currentLeftIndex;
  }

  @override
  int currentMiddleIndex() {
    return _currentMiddleIndex;
  }

  @override
  int currentRightIndex() {
    return _currentRightIndex;
  }

  @override
  void setLeftIndex(int index) {
    _currentLeftIndex = index;
  }

  @override
  void setMiddleIndex(int index) {
    _currentMiddleIndex = index;
  }

  @override
  void setRightIndex(int index) {
    _currentRightIndex = index;
  }

  @override
  String leftDivider() {
    return '';
  }

  @override
  String rightDivider() {
    return '';
  }

  @override
  List<int> layoutProportions() {
    return [3, 3, 3, 2, 2];
  }

  @override
  DateTime? finalTime() {
    return null;
  }

  @override
  int currentHourIndex() {
    return _currentHourIndex;
  }

  @override
  int currentMinuteIndex() {
    return _currentMinuteIndex;
  }

  @override
  String? hourStringAtIndex(int index) {
    return null;
  }

  @override
  String? minuteStringAtIndex(int index) {
    return null;
  }

  @override
  void setHourIndex(int index) {
    _currentHourIndex = index;
  }

  @override
  void setMinuteIndex(int index) {
    _currentMinuteIndex = index;
  }

  @override
  String timeDivider() {
    return ':';
  }
}

class LunarPickerModel extends CommonPickerModel {
  late DateTime maxTime;
  late DateTime minTime;
  late Lunar maxLunarTime;
  late Lunar minLunarTime;
  late Lunar currentLunarTime;

  LunarPickerModel(
      {DateTime? currentTime, DateTime? maxTime, DateTime? minTime}) {
    this.maxTime = maxTime ?? DateTime(2049, 12, 31);
    this.minTime = minTime ?? DateTime(1970, 1, 1);
    currentTime = currentTime ?? DateTime.now();
    maxLunarTime = Solar.fromDate(this.maxTime).getLunar();
    minLunarTime = Solar.fromDate(this.minTime).getLunar();
    currentLunarTime = Solar.fromDate(currentTime).getLunar();
    if (currentTime.compareTo(this.maxTime) > 0) {
      currentTime = this.maxTime;
      currentLunarTime = maxLunarTime;
    } else if (currentTime.compareTo(this.minTime) < 0) {
      currentTime = this.minTime;
      currentLunarTime = minLunarTime;
    }

    this.currentTime = currentTime;

    _fillLeftLists();
    _fillMiddleLists();
    _fillRightLists();
    final minDay = _minDayOfCurrentMonth();
    _currentLeftIndex = currentLunarTime.getYear() - minLunarTime.getYear();
    _currentMiddleIndex = _getCurrentMiddleIndex();
    _currentRightIndex = currentLunarTime.getDay() - minDay;
    _currentHourIndex = this.currentTime.hour;
    _currentMinuteIndex = this.currentTime.minute;
  }

  int _maxMonthOfCurrentYear() {
    return currentLunarTime.getYear() == maxLunarTime.getYear()
        ? maxLunarTime.getMonth()
        : 12;
  }

  int _minMonthOfCurrentYear() {
    return currentLunarTime.getYear() == minLunarTime.getYear()
        ? minLunarTime.getMonth()
        : 1;
  }

  int _maxDayOfCurrentMonth() {
    final dayCount = LunarMonth.fromYm(
                currentLunarTime.getYear(), currentLunarTime.getMonth())
            ?.getDayCount() ??
        0;
    return currentLunarTime.getYear() == maxLunarTime.getYear() &&
            currentLunarTime.getMonth() == maxLunarTime.getMonth()
        ? maxLunarTime.getDay()
        : dayCount;
  }

  int _minDayOfCurrentMonth() {
    return currentLunarTime.getYear() == minLunarTime.getYear() &&
            currentLunarTime.getMonth() == minLunarTime.getMonth()
        ? minLunarTime.getDay()
        : 1;
  }

  void _fillLeftLists() {
    leftList = List.generate(maxLunarTime.getYear() - minLunarTime.getYear() + 1, (int index) {
      return '${minLunarTime.getYear() + index}';
    });
  }

  String getYearInChinese(int year) {
    final y = year.toString();
    var s = '';
    for (var i = 0, j = y.length; i < j; i++) {
      s += LunarUtil.NUMBER[y.codeUnitAt(i) - 48];
    }
    return s;
  }

  void _fillMiddleLists() {
    final minMonth = _minMonthOfCurrentYear();
    final maxMonth = _maxMonthOfCurrentYear();

    final lunarMonths =
        LunarYear.fromYear(currentLunarTime.getYear()).getMonths();

    middleList = [];

    for (var i = 0, j = lunarMonths.length; i < j; i++) {
      if (lunarMonths[i].getYear() == currentLunarTime.getYear()) {
        if (currentLunarTime.getYear() == minLunarTime.getYear()) {
          if (i >= minMonth + 1) {
            getLunarMiddleMonth(lunarMonths[i]);
          }
        // } else if (currentLunarTime.getYear() == maxLunarTime.getYear()) {

        } else {
          getLunarMiddleMonth(lunarMonths[i]);
        }
      }
    }
  }

  bool isLeap(LunarMonth m) => m.getMonth() < 0;

  void getLunarMiddleMonth(LunarMonth m) {
    // String month = LunarUtil.MONTH[m.getMonth().abs()];
    middleList.add("${m.getMonth().abs()} ${isLeap(m) ? "(${LocaleKeys.leap.tr()})" : ""}");
  }

  void _fillRightLists() {
    final maxDay = _maxDayOfCurrentMonth();
    final minDay = _minDayOfCurrentMonth();
    rightList = List.generate(
        maxDay - minDay + 1 < _maxDayOfCurrentMonth()
            ? maxDay - minDay + 1
            : _maxDayOfCurrentMonth(), (int index) {
      return (minDay + index).toString(); //LunarUtil.DAY[minDay + index];
    });
  }

  @override
  void setLeftIndex(int index) {
    super.setLeftIndex(index);
    final destYear = index + minLunarTime.getYear();
    DateTime newTime;

    final dayCount = LunarMonth.fromYm(destYear, currentTime.month)?.getDayCount() ?? 0;
    final newLunarTime = Lunar.fromYmd(
        destYear,
        currentLunarTime.getMonth().abs(),
        currentLunarTime.getDay() < dayCount
            ? currentLunarTime.getDay()
            : dayCount);

    final solarTime = newLunarTime.getSolar();
    newTime =
        DateTime(solarTime.getYear(), solarTime.getMonth(), solarTime.getDay());

    if (newTime.isAfter(maxTime)) {
      currentTime = maxTime;
      currentLunarTime = maxLunarTime;
    } else if (newTime.isBefore(minTime)) {
      currentTime = minTime;
      currentLunarTime = minLunarTime;
    } else {
      currentTime = newTime;
      currentLunarTime = newLunarTime;
    }

    _fillMiddleLists();
    _fillRightLists();
    final minDay = _minDayOfCurrentMonth();
    _currentMiddleIndex = _getCurrentMiddleIndex();
    _currentRightIndex = currentLunarTime.getDay() - minDay;
  }

  int _getCurrentMiddleIndex() {
    var mCurrentMiddleIndex = 0;

    final leapMonth = LunarYear.fromYear(currentLunarTime.getYear()).getLeapMonth();
    if (leapMonth != 0) {
      if (currentLunarTime.getMonth() < 0) {
        mCurrentMiddleIndex = currentLunarTime.getMonth().abs() - _minMonthOfCurrentYear() + 1;
      } else {
        if (currentLunarTime.getMonth() > leapMonth) {
          mCurrentMiddleIndex = currentLunarTime.getMonth().abs() - _minMonthOfCurrentYear() + 1;
        } else {
          mCurrentMiddleIndex = currentLunarTime.getMonth().abs() - _minMonthOfCurrentYear();
        }
      }
    } else {
      mCurrentMiddleIndex = currentLunarTime.getMonth().abs() - _minMonthOfCurrentYear();
    }
    return mCurrentMiddleIndex;
  }

  @override
  void setMiddleIndex(int index) {
    super.setMiddleIndex(index);

    final minMonth = _minMonthOfCurrentYear();

    final d = LunarMonth.fromYm(currentLunarTime.getYear(), minMonth);
    final nextMonth = d?.next(index);

    final dayCount = LunarMonth.fromYm(
                currentLunarTime.getYear(), nextMonth?.getMonth() ?? 0)
            ?.getDayCount() ??
        0;

    final newLunarTime = Lunar.fromYmd(
      currentLunarTime.getYear(),
      nextMonth?.getMonth() ?? 0,
      currentLunarTime.getDay() <= dayCount
          ? currentLunarTime.getDay()
          : dayCount,
    );

    DateTime newTime;
    final solarTime = newLunarTime.getSolar();
    newTime = DateTime(solarTime.getYear(), solarTime.getMonth(), solarTime.getDay());
    //min/max check
    if (newTime.isAfter(maxTime)) {
      currentTime = maxTime;
      currentLunarTime = maxLunarTime;
    } else if (newTime.isBefore(minTime)) {
      currentTime = minTime;
      currentLunarTime = minLunarTime;
    } else {
      currentTime = newTime;
      currentLunarTime = newLunarTime;
    }

    _fillRightLists();
    final minDay = _minDayOfCurrentMonth();
    _currentRightIndex = currentLunarTime.getDay() - minDay;
  }

  @override
  void setRightIndex(int index) {
    super.setRightIndex(index);
    final minDay = _minDayOfCurrentMonth();
    final maxDay = _maxDayOfCurrentMonth();

    final newLunarTime = Lunar.fromYmd(
        currentLunarTime.getYear(),
        currentLunarTime.getMonth(),
        (minDay + index <= maxDay) ? minDay + index : maxDay);
    currentLunarTime = newLunarTime;
    final solarTime = newLunarTime.getSolar();
    currentTime =
        DateTime(solarTime.getYear(), solarTime.getMonth(), solarTime.getDay());
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 0 && index < leftList.length) {
      return leftList[index];
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < middleList.length) {
      return middleList[index];
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < rightList.length) {
      return rightList[index];
    } else {
      return null;
    }
  }

  @override
  String? hourStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? minuteStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(currentTime.year, currentTime.month, currentTime.day,
            _currentHourIndex, _currentMinuteIndex)
        : DateTime(currentTime.year, currentTime.month, currentTime.day,
            _currentHourIndex, _currentMinuteIndex);
  }
}
