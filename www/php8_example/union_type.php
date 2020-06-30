<?php
class Number {
    private int|float $number;

    public function setNumber(int|float $number): void {
        $this->number = $number;
    }

    public function getNumber(): int|float {
        return $this->number;
    }
}

$num = new Number();
$num->setNumber(1.23);
var_dump($num->getNumber());

$num->setNumber(23213);
var_dump($num->getNumber());