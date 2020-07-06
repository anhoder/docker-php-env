<?php
class A {
    public $num;

    public function __construct(int $num) {
        $this->num = $num;
    }

    public static function test(): static {
        return new static(123);
    }
}

class B extends A  {
    
}

$b = B::test();
var_dump($b->num);

