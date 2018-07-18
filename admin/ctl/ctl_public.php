<?php

class ctl_public
{


    public function verify()
    {
        $Verify = new verifiy_code();
        echo $Verify->show();
    }

    public function check_verify($code)
    {
        $Verify = new verifiy_code();
        return $Verify->check($code);
    }

    public function login()
    {
        view::display();
    }
}