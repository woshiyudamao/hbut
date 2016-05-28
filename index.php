<?php
$t1 = microtime();
define("PE_VERSION",'3.0');
require "lib/init.cls.php";

$ginkgo = new ginkgo;
$ginkgo->run();
$t1 = explode(" ",$t1);
$t2 = microtime();
$t2 = explode(" ",$t2);
//echo $t2[0]- $t1[0];
?>