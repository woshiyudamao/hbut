<?php

class app
{
	public $G;

	//初始化信息
	public function __construct(&$G)
	{
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->session = $this->G->make('session');
		
		$this->user = $this->G->make('user','user');
		$this->op = $this->G->make('op','mark');
		$this->_user = $_user = $this->session->getSessionUser();
		$group = $this->user->getGroupById($_user['sessiongroupid']);
		if($group['groupmoduleid'] != 1)
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 300,
				"message" => "请您重新登录",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?core-master-login"
			)));
			else
			{
				header("location:?core-master-login");
				exit;
			}
		}
		//生产一个对象
		$this->tpl = $this->G->make('tpl');
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->html = $this->G->make('html');
		$this->apps = $this->G->make('apps','core');
		$this->tpl->assign('userhash',$this->ev->get('userhash'));
		$localapps = $this->apps->getLocalAppList();
		$apps = $this->apps->getAppList();
		$groups = $this->user->getUserGroups();
		$this->tpl->assign('localapps',$localapps);
		$this->tpl->assign('apps',$apps);
		$this->tpl->assign('groups',$groups);
		$this->tpl->assign('_user',$this->user->getUserById($_user['sessionuserid']));
	}

	public function index()
	{
		$this->tpl->display('index');
	}

	public function mark()
	{
		$subaction = $this->ev->url(3);
		$search = $this->ev->get('search');
		$u = '';
		if($search)
		{
			foreach($search as $key => $arg)
			{
				$u .= "&search[{$key}]={$arg}";
			}
		}
		switch($subaction)
		{		
			case  'modify' :
			$search = $this->ev->get('search');
			$u = '';
			if($search)
			{
				foreach($search as $key => $arg)
				{
					$u .= "&search[{$key}]={$arg}";
				}
			}
			$page = $this->ev->get('page')?$this->ev->get('page'):1;
			if($this->ev->get('postmark'))
			{	$agrs=array();
				$agrs['username']=intval($this->ev->get('userid'));
				$agrs['type']=intval($this->ev->get('typeid'));
				$agrs['value']=$this->ev->get('describe');
				
				$this->op->addmark($agrs);
				
				
				$message = array(
				'statusCode' => 200,
				"message" => '标记成功!',
				"callbackType" => "forward",
			    "forwardUrl" => "index.php?mark-master-mark&page={$page}{$u}"
			);
			$this->G->R($message);
		 
			}
			
			$this->tpl->assign('page',$page);
			$mark['userid']=$this->ev->get('userid');
			$mark['describe']='请填写具体情况';
			$this->tpl->assign('search',$search);
			$this->tpl->assign('mark',$mark);
			$this->tpl->display('mark');
			
			
			break;
		
			
			default:
			$page = $this->ev->get('page')?$this->ev->get('page'):1;
			$search = $this->ev->get('search');
			$u = '';
			if($search)
			{
				foreach($search as $key => $arg)
				{
					$u .= "&search[{$key}]={$arg}";
				}
			}
			$args = array();
			//if($search['userid'])$args[] = array('AND',"userid = :userid",'userid',$search['userid']);
			if($search['username'])$args[] = array('AND',"username LIKE :username",'username','%'.$search['username'].'%');
			if($search['usertruename'])$args[] = array('AND',"usertruename LIKE :usertruename",'usertruename','%'.$search['usertruename'].'%');
			if($search['groupid'])$args[] = array('AND',"usergroupid = :usergroupid",'usergroupid',$search['groupid']);
			
			$users = $this->user->getUserList($page,10,$args);
			$this->tpl->assign('users',$users);
			$this->tpl->assign('search',$search);
			$this->tpl->assign('u',$u);
			$this->tpl->assign('page',$page);
			$this->tpl->display('user');
			break;
		}
	}
	
}

?>