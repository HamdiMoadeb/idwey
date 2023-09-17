#!/bin/sh

flutter pub get && dart  pub run build_runner build --delete-conflicting-outputs