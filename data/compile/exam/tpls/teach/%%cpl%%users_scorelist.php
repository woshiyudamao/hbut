<?php if(!$this->tpl_var['userhash']){ ?>
<?php $this->_compileInclude('header'); ?>
<body>
<?php $this->_compileInclude('nav'); ?>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
			<?php $this->_compileInclude('menu'); ?>
		</div>
		<div class="span10" id="datacontent">
<?php } ?>
			<ul class="breadcrumb">
				<li><a href="index.php?<?php echo $this->tpl_var['_app']; ?>-teach"><?php echo $this->tpl_var['apps'][$this->tpl_var['_app']]['appname']; ?></a> <span class="divider">/</span></li>
				<li><a href="index.php?<?php echo $this->tpl_var['_app']; ?>-teach-users">课程成绩</a> <span class="divider">/</span></li>
				<li class="active">成绩统计</li>
			</ul>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">成绩统计</a>
				</li>
				<li class="pull-right">
					<a class="ajax" href="index.php?<?php echo $this->tpl_var['_app']; ?>-teach-users-outscorewithtime&basicid=<?php echo $this->tpl_var['basicid']; ?><?php echo $this->tpl_var['u']; ?>">导出带时间的成绩</a>
				</li>
				<li class="pull-right">
					<a class="ajax" href="index.php?<?php echo $this->tpl_var['_app']; ?>-teach-users-outspaper&basicid=<?php echo $this->tpl_var['basicid']; ?><?php echo $this->tpl_var['u']; ?>">导出试卷</a>
				</li>
				<li class="pull-right">
					<a class="ajax" href="index.php?<?php echo $this->tpl_var['_app']; ?>-teach-users-outscore&basicid=<?php echo $this->tpl_var['basicid']; ?><?php echo $this->tpl_var['u']; ?>">导出成绩</a>
				</li>
				<li class="pull-right">
					<a class="ajax" href="index.php?<?php echo $this->tpl_var['_app']; ?>-teach-users-outanalyse&basicid=<?php echo $this->tpl_var['basicid']; ?><?php echo $this->tpl_var['u']; ?>">导出分析</a>
				</li>
			</ul>
			<form name="form1" action="index.php?exam-teach-users-scorelist&basicid=<?php echo $this->tpl_var['basicid']; ?>" method="post">
				<table class="table">
			        <tr>
						<td>
							考试时间：
						</td>
						<td colspan="2">
							<input class="input-small datetimepicker" data-date="<?php echo date('Y-m-d',TIME); ?>" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="<?php echo $this->tpl_var['search']['stime']; ?>"/> - <input class="input-small datetimepicker" data-date="<?php echo date('Y-m-d',TIME); ?>" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="<?php echo $this->tpl_var['search']['etime']; ?>"/>
						</td>
						<td>
							分数段：
						</td>
						<td colspan="2">
							<input class="input-small" name="search[sscore]" id="sscore" type="text" value="<?php echo $this->tpl_var['search']['sscore']; ?>"/> - <input class="input-small" type="text" name="search[escore]" id="escore" value="<?php echo $this->tpl_var['search']['escore']; ?>"/>
						</td>
					</tr>
			        <tr>
			        	<td>
							班级：
						</td>
						<td>
							<select name="search[groupid]" class="input-medium">
						  		<option value="0">不限</option>
						  		<?php $uid = 0;
 foreach($this->tpl_var['usergroups'] as $key => $usergroup){ 
 $uid++; ?>
						  		<option value="<?php echo $usergroup; ?>" <?php if($this->tpl_var['search']['groupid'] == $usergroup){ ?> selected<?php } ?>><?php echo $this->tpl_var['usergroupsmsg'][$usergroup]['groupname']; ?></option>
						  		<?php } ?>
					  		</select>
						</td>
						
						<td>
							科目：
						</td>
						<td>
							<select name="search[exampaper]" class="input-medium">
				        		<option value="0">选择试卷</option>
						  		<?php $eid = 0;
 foreach($this->tpl_var['exampapers'] as $key => $paper){ 
 $eid++; ?>
						  		<option value="<?php echo $paper; ?>"<?php if($paper == $this->tpl_var['search']['exampaper']){ ?> selected<?php } ?>><?php echo $paper; ?></option>
						  		<?php } ?>
					  		</select>
						</td>
						
						
						
						
						<td colspan="1">

						</td>
						<td><button class="btn btn-primary" type="submit">提交</button> <a class="btn btn-primary" href="index.php?exam-teach-users-stats&basicid=<?php echo $this->tpl_var['basicid']; ?><?php echo $this->tpl_var['u']; ?>">统计</a></td>
			        </tr>
				</table>
				<div class="input">
					<input type="hidden" value="1" name="search[argsmodel]" />
				</div>
			</form>
	        <table class="table table-hover">
	            <thead>
	                <tr>
	                 
						<th>班级</th>
	                    <th>考生用户名</th>
	                    <th
						class="dropdown ">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">分数<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li><a href="index.php?exam-teach-users-scorelist&order=1<?php echo $this->tpl_var['u']; ?>">正序</a></li>
						<li><a href="index.php?exam-teach-users-scorelist&order=2<?php echo $this->tpl_var['u']; ?>">倒序</a></li>
					</ul>
				
						</th>
				        <th>试卷名称</th>
						<th>考试时间</th>
				        <th
						class="dropdown ">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">考试用时<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li><a href="index.php?exam-teach-users-scorelist&order=3<?php echo $this->tpl_var['u']; ?>">正序</a></li>
						<li><a href="index.php?exam-teach-users-scorelist&order=4<?php echo $this->tpl_var['u']; ?>">倒序</a></li>
					</ul>
						</th>
				        
				        <th>操作</th>
	                </tr>
	            </thead>
	            <tbody>
                    <?php $eid = 0;
 foreach($this->tpl_var['exams']['data'] as $key => $exam){ 
 $eid++; ?>
			        <tr>
						<td>
						
						<?php echo $this->tpl_var['userinfo'][$exam['ehuserid']]['groupname']; ?>
						</td>
						<td>
							<?php echo $exam['ehusername']; ?>
						</td>
						<td>
							<?php echo $exam['ehscore']; ?>
						</td>
						<td>
							<?php echo $exam['ehexam']; ?>
						</td>
						<td>
							<?php echo date('Y-m-d H:i',$exam['ehstarttime']); ?>
						</td>
						<td>
							<?php if($exam['ehtime'] >= 60){ ?><?php if($exam['ehtime']%60){ ?><?php echo intval($exam['ehtime']/60)+1; ?><?php } else { ?><?php echo intval($exam['ehtime']/60); ?><?php } ?>分钟<?php } else { ?><?php echo $exam['ehtime']; ?>秒<?php } ?>
						</td>
						<td><a class="btn btn-primary" href="index.php?exam-teach-users-readpaper&ehid=<?php echo $exam['ehid']; ?>" target="_blank">阅卷</a><a class="btn ajax" href="index.php?exam-teach-users-downpaper&ehid=<?php echo $exam['ehid']; ?>" target="_blank">下载考卷</a>&nbsp;<a class="btn btn-primary hide" href="index.php?exam-teach-users-changescore&ehid=<?php echo $exam['ehid']; ?>" target="_blank">纠分</a></td>
			        </tr>
			        <?php } ?>
	        	</tbody>
	        </table>
	        <div class="pagination pagination-right">
	            <ul><?php echo $this->tpl_var['exams']['pages']; ?></ul>
	        </div>
<?php if(!$this->tpl_var['userhash']){ ?>
		</div>
	</div>
</div>
</body>
</html>
<?php } ?>