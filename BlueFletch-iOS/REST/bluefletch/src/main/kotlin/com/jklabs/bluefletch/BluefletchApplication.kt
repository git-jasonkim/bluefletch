package com.jklabs.bluefletch

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class BluefletchApplication

fun main(args: Array<String>) {
	runApplication<BluefletchApplication>(*args)
}
