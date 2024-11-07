# Bazel toolchain setup for AVR

## Building
```
$ bazel build -s --config=avr //example/:blink_firmware
```

## Flashing
```
$ avrdude -p atmega32u4 -P usbasp -c usbasp -U flash:w:bazel-bin/blink_firmware.hex
```
