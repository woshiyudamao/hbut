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
				<li class="active">详情填写</li>
			</ul>
	    	<form action="?mark-master-mark-modify" method="post" class="form-horizontal">
				<fieldset>
					<legend>{x2;$module['modulename']}</legend>
					<div class="control-group">
						<label for="modulename" class="control-label">标记类型：</label>
						<div class="controls">
							<select name="typeid" class="input-medium" autocomplete="off">
						  		<option value="1">舞弊</option>
						  		<option value="2">缺考</option>
								<option value="3">其他</option>
						  		</select>
						</div>
					</div>
			        <div class="control-group">
				        <label class="control-label" for="describe">具体情况：</label>
		          		<div class="controls">
		          			<textarea rows="7" class="input-xxlarge" name="describe" id="describe">{x2;$mark['describe']}</textarea>
			        	</div>
			        </div>
			        <div class="control-group">
						<div class="controls">
							<button class="btn btn-primary" type="submit">提交</button>
				        	<input type="hidden" name="userid" value="{x2;$mark['userid']}"/>
							<input type="hidden" name="postmark" value="1"/>
							{x2;tree:$search,arg,sid}
							<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
							{x2;endtree}
							<input type="hidden" name="page" value="{x2;$page}"/>
						</div>
					</div>
				</fieldset>
			</form>
{x2;if:!$userhash}
		</div>
	</div>
</div>
</body>
</html>
{x2;endif}