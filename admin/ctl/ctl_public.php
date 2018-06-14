<?php

class ctl_public
{


    public function verify()
    {
        $Verify = new verifiy_code();
        echo $Verify->show();
    }
}