<?php
    // Example the right way to prevent SQL Injection
    // $textbox1 = admin' union select #

Danger:
    Select * from accounts where username='admin' union select #'

Safe:
    ->prepare("Select * from accounts where uername = ?")
    ->execute(array('$textbox1'))

?>