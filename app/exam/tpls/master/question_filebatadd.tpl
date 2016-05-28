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
				<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a> <span class="divider">/</span></li>
				<li><a href="index.php?{x2;$_app}-master-questions&page={x2;$page}{x2;$u}">普通试题管理</a> <span class="divider">/</span></li>
				<li class="active">添加普通试题</li>
			</ul>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">添加普通试题</a>
				</li>
				<li class="pull-right">
					<a href="index.php?{x2;$_app}-master-questions&page={x2;$page}{x2;$u}">普通试题管理</a>
				</li>
			</ul>
			<form action="index.php?exam-master-questions-filebataddquestion" method="post" class="form-horizontal">
				<legend>从CSV导入</legend>
				<div class="control-group">
					<label for="username" class="control-label">示范格式</label>
					<div class="controls">
						<img src="app/exam/styles/image/demo.png" />
					</div>
				</div>
				<div class="control-group">
				<label for="lesson_video" class="control-label">科目</label>
					<div class="controls">
					<select name="subject" class="combox input-medium" target="sectionselect">
				        		<option value="0">选择科目</option>
						  		{x2;tree:$subjects,subject,sid}
						  		<option value="{x2;v:subject['subjectid']}"{x2;if:v:subject['subjectid'] == $search['questionsubjectid']} selected{x2;endif}>{x2;v:subject['subject']}</option>
						  		{x2;endtree}
					  		</select>
					</div>
				</div>
				<div class="control-group">
					<label for="lesson_video" class="control-label">待导入文件</label>
					<div class="controls">
						<span class="input-append">
							<input type="text" name="uploadfile" id="uploadfile_value" class="inline uploadvideo" needle="needle" msg="必须先上传CSV文件"/>
							<span id="uploadfile_percent" class="add-on">0.00%</span>
						</span>
						<span class="btn">
							<a id="uploadfile" class="uploadbutton" exectype="upfile" uptypes="*.csv">选择文件</a>
						</span>
						<span class="help-block">注意：导入文件必须为csv文件，可用excel另存为csv，为保证程序正常导入，每个CSV文件请不要超过2M，否则可能导入失败</span>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button class="btn btn-primary" type="submit">提交</button>
						<input type="hidden" name="page" value="{x2;$page}"/>
						<input type="hidden" name="type" value="1"/>
						<input type="hidden" name="insertquestion" value="1"/>
						{x2;tree:$search,arg,aid}
						<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
						{x2;endtree}
					</div>
				</div>
			</form>
{x2;if:!$userhash}
		</div>
	</div>
</div>
</body>
</html>
{x2;endif}