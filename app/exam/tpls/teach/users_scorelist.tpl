{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
			{x2;include:menu}
		</div>
		<div class="span10" id="datacontent">
{x2;endif}
			<ul class="breadcrumb">
				<li><a href="index.php?{x2;$_app}-teach">{x2;$apps[$_app]['appname']}</a> <span class="divider">/</span></li>
				<li><a href="index.php?{x2;$_app}-teach-users">课程成绩</a> <span class="divider">/</span></li>
				<li class="active">成绩统计</li>
			</ul>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">成绩统计</a>
				</li>
				<li class="pull-right">
					<a class="ajax" href="index.php?{x2;$_app}-teach-users-outscorewithtime&basicid={x2;$basicid}{x2;$u}">导出带时间的成绩</a>
				</li>
				<li class="pull-right">
					<a class="ajax" href="index.php?{x2;$_app}-teach-users-outspaper&basicid={x2;$basicid}{x2;$u}">导出试卷</a>
				</li>
				<li class="pull-right">
					<a class="ajax" href="index.php?{x2;$_app}-teach-users-outscore&basicid={x2;$basicid}{x2;$u}">导出成绩</a>
				</li>
				<li class="pull-right">
					<a class="ajax" href="index.php?{x2;$_app}-teach-users-outanalyse&basicid={x2;$basicid}{x2;$u}">导出分析</a>
				</li>
			</ul>
			<form name="form1" action="index.php?exam-teach-users-scorelist&basicid={x2;$basicid}" method="post">
				<table class="table">
			        <tr>
						<td>
							考试时间：
						</td>
						<td colspan="2">
							<input class="input-small datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="input-small datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
						</td>
						<td>
							分数段：
						</td>
						<td colspan="2">
							<input class="input-small" name="search[sscore]" id="sscore" type="text" value="{x2;$search['sscore']}"/> - <input class="input-small" type="text" name="search[escore]" id="escore" value="{x2;$search['escore']}"/>
						</td>
					</tr>
			        <tr>
			        	<td>
							班级：
						</td>
						<td>
							<select name="search[groupid]" class="input-medium">
						  		<option value="0">不限</option>
						  		{x2;tree:$usergroups,usergroup,uid}
						  		<option value="{x2;v:usergroup}" {x2;if:$search['groupid'] == v:usergroup} selected{x2;endif}>{x2;$usergroupsmsg[v:usergroup]['groupname']}</option>
						  		{x2;endtree}
					  		</select>
						</td>
						
						<td>
							科目：
						</td>
						<td>
							<select name="search[exampaper]" class="input-medium">
				        		<option value="0">选择试卷</option>
						  		{x2;tree:$exampapers,paper,eid}
						  		<option value="{x2;v:paper}"{x2;if:v:paper == $search['exampaper']} selected{x2;endif}>{x2;v:paper}</option>
						  		{x2;endtree}
					  		</select>
						</td>
						
						
						
						
						<td colspan="1">

						</td>
						<td><button class="btn btn-primary" type="submit">提交</button> <a class="btn btn-primary" href="index.php?exam-teach-users-stats&basicid={x2;$basicid}{x2;$u}">统计</a></td>
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
						<li><a href="index.php?exam-teach-users-scorelist&order=1{x2;$u}">正序</a></li>
						<li><a href="index.php?exam-teach-users-scorelist&order=2{x2;$u}">倒序</a></li>
					</ul>
				
						</th>
				        <th>试卷名称</th>
						<th>考试时间</th>
				        <th
						class="dropdown ">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">考试用时<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li><a href="index.php?exam-teach-users-scorelist&order=3{x2;$u}">正序</a></li>
						<li><a href="index.php?exam-teach-users-scorelist&order=4{x2;$u}">倒序</a></li>
					</ul>
						</th>
				        
				        <th>操作</th>
	                </tr>
	            </thead>
	            <tbody>
                    {x2;tree:$exams['data'],exam,eid}
			        <tr>
						<td>
						
						{x2;$userinfo[v:exam['ehuserid']]['groupname']}
						</td>
						<td>
							{x2;v:exam['ehusername']}
						</td>
						<td>
							{x2;v:exam['ehscore']}
						</td>
						<td>
							{x2;v:exam['ehexam']}
						</td>
						<td>
							{x2;date:v:exam['ehstarttime'],'Y-m-d H:i'}
						</td>
						<td>
							{x2;if:v:exam['ehtime'] >= 60}{x2;if:v:exam['ehtime']%60}{x2;eval: echo intval(v:exam['ehtime']/60)+1}{x2;else}{x2;eval: echo intval(v:exam['ehtime']/60)}{x2;endif}分钟{x2;else}{x2;v:exam['ehtime']}秒{x2;endif}
						</td>
						<td><a class="btn btn-primary" href="index.php?exam-teach-users-readpaper&ehid={x2;v:exam['ehid']}" target="_blank">阅卷</a><a class="btn ajax" href="index.php?exam-teach-users-downpaper&ehid={x2;v:exam['ehid']}" target="_blank">下载考卷</a>&nbsp;<a class="btn btn-primary hide" href="index.php?exam-teach-users-changescore&ehid={x2;v:exam['ehid']}" target="_blank">纠分</a></td>
			        </tr>
			        {x2;endtree}
	        	</tbody>
	        </table>
	        <div class="pagination pagination-right">
	            <ul>{x2;$exams['pages']}</ul>
	        </div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
</body>
</html>
{x2;endif}