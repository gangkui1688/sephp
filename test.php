<?php
//当我们直接new一个未包含class类文件时候会报错
//$objDemo = new ddddddd();



//文件autoloadDemo.php文件
spl_autoload_register('myAutoLoad', true, true);


function myAutoLoad($className){
    echo "所有的包含文件工作都交给我！\r\n<br>";
    $classFileName = "./{$className}.php";
    echo "我来包含！{$classFileName}\r\n<br>";
    include "./{$className}.php";
}

new test1();

