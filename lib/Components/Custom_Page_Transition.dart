// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

pageTrasition(context, Widget widget) {
  Navigator.of(context).push(PageAnimationTransition(
      page: widget, pageAnimationType: RightToLeftFadedTransition()));
}

pageTransitionRemoveAll(context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    PageAnimationTransition(
        page: widget, pageAnimationType: RightToLeftTransition()),
    (route) => false,
  );
}
