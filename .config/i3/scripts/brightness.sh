#! /usr/bin/bash

min_brightness=$(($(brightnessctl m) * 5 / 100));
interval='5%'

action=$1

function increase_brightness {
	brightnessctl set +$1
}

function decrease_brightness {
	brightnessctl --min-value=$min_brightness set $1-
}

case "$action" in
	"inc")
		increase_brightness $interval
		;;
	"dec")
		decrease_brightness $interval
		;;
	*)
		;;
esac

