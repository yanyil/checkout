# Checkout
[![Coverage Status](https://coveralls.io/repos/github/yyl29/checkout/badge.svg?branch=master)](https://coveralls.io/github/yyl29/checkout?branch=master) [![Build Status](https://travis-ci.org/yyl29/checkout.svg?branch=master)](https://travis-ci.org/yyl29/checkout)

A checkout system with the ability to offer promotions. Here are the products available:

Product code | Name                   | Price
-------------|------------------------|--------
001          | Lavender heart         | £9.25
002          | Personalised cufflinks | £45.00
003          | Kids T-shirt           | £19.95


The following promotional rules are applied:
- If you spend over £60, then you get 10% off of your purchase.
- If you buy 2 or more lavender hearts, then the price drops to £8.50.

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