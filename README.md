# Checkout
[![Coverage Status](https://coveralls.io/repos/github/yyl29/checkout/badge.svg?branch=master)](https://coveralls.io/github/yyl29/checkout?branch=master) [![Build Status](https://travis-ci.org/yyl29/checkout.svg?branch=master)](https://travis-ci.org/yyl29/checkout)

## Installation
From the command line:

```
$ git clone https://github.com/yyl29/checkout.git
$ cd checkout
$ bundle
```

## Usage
Run in `irb` or `pry` from the command line.

```
$ irb
2.3.0 :001 > require './lib/checkout'
 => true
2.3.0 :002 > co = Checkout.new(PromotionalRule.new)
 => #<Checkout:0x007f9c340304d0 @rules=#<PromotionalRule:0x007f9c34030520>, @basket=[], @raw_total=0, @total=0>
2.3.0 :003 > co.scan 1
 => 9.25
2.3.0 :004 > co.scan 2
 => 54.25
2.3.0 :005 > co.scan 1
 => 63.5
2.3.0 :006 > co.scan 3
 => 83.45
2.3.0 :007 > price = co.total
 => 73.76
2.3.0 :008 >
```

## Test
From the command line:

```
$ rspec
```