# Introduction 
This is a collection of [OpenSCAD](https://openscad.org/) source files, modelling various an enclosure for the Clear Creek Scientific Weather Data logger. The model is split into a bottom half and a top half. See the list below for a description of each file:

## Version 0001 (Enclosure for Raspberry Pi Zero and Adafruit BME280 sensor)

* **ccs_dl0001_enc_consts.scad**: Constant values used by each of the following models.

### Bottom Half

* **_ccs_dl0001_enc_bottom_common.scad**: Common elements of the bottom half of an enclosure for a Raspberry Pi Zero and an Adafruit BME280 temperature, humidity and pressure sensor. This file can be used as the basis of a new design for a bottom half, without starting from scratch. Requires *ccs_dl0001_enc_consts.scad*.
* **ccs_dl0002_enc_bottom.scad**: Bottom half of the enclosure for a Raspberry Pi Zero and an Adafruit BME280 temperature, humidity and pressure sensor. Requires *ccs_dl0001_enc_bottom_common.scad*.


### Top Half

* **ccs_dl0001_enc_top_common.scad**: Common elements of a top half of an enclosure for a Raspberry Pi Zero and an Adafruit BME280 temperature, humidity and pressure sensor. This file can be used as the basis of a new design for a top half, without starting from scratch. *Requires ccs_dl0001_enc_consts.scad*.
* **ccs_dl0001_enc_top.scad**: Top half of an enclosure for a Raspberry Pi Zero and an Adafruit BME280 temperature, humidity and pressure sensor. *Requires ccs_dl0001_enc_top_common.scad*.


