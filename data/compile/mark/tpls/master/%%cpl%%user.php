<?php if(!$this->tpl_var['userhash']){ ?>
 foreach($this->tpl_var['groups'] as $key => $group){ 
 $gid++; ?>
 foreach($this->tpl_var['users']['data'] as $key => $user){ 
 $uid++; ?>
 foreach($this->tpl_var['search'] as $key => $arg){ 
 $sid++; ?>