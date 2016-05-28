{x2;include:header}
<body>
{x2;include:nav}
<div class="row-fluid">
	<div class="container-fluid examcontent">
		<div class="span2 exambox">
			<div class="examform">
				<div>
					{x2;include:menu}
				</div>
			</div>
		</div>
		<div class="span10 exambox" id="datacontent">
			<div class="examform">
				<div>
					<ul class="breadcrumb">
						<li><a href="index.php?{x2;$_app}-app">用户中心</a> <span class="divider">/</span></li>
						<li class="active">隐私设置</li>
					</ul>
					<div>
						<div class="span3">
							<div class="thumbnail"><img alt="300x200" src="{x2;if:$_user['photo']}{x2;$_user['photo']}{x2;else}app/core/styles/images/default_user.png{x2;endif}" /></div>
						</div>
						<div class="span3">
							<div class="caption">
								<h3>{x2;$_user['username']}</h3>
								<p>姓名：{x2;$_user['usertruename']}</p>
								<p>&nbsp;</p>
								
							</div>
							<div>&nbsp;</div>
						</div>
						<div class="span3">
							<div class="caption">
								<h3>&nbsp;</h3>
								<p>用户组：{x2;$groups[$_user['usergroupid']]['groupname']}</p>
								<p>&nbsp;</p>
							</div>
							<div>&nbsp;</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>