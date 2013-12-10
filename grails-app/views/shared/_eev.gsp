<div class="row">
	<div class="col-xs-12"><h3>{{eev.title}}</h3></div>
</div>
<div class="row">
	<div class="col-xs-12">
		<form role="form">
		<div class="form-group">
		  <label for="interviewer">Email Interviewer</label>
		  <div>
		  	<input ng-model="interviewer" type="text" class="form-control" id="interviewee" placeholder="Email interviewer">
		  </div>
		</div>
		</form>
	</div>
	<div class="col-xs-12">
		<form role="form">
		<div class="form-group">
		  <label for="interviewee">Email Interviewe</label>
		  <div>
		  	<input ng-model="interviewee" type="text" class="form-control" id="interviewee" placeholder="Email interviewe">
		  </div>
		</div>
		</form>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<button ng-click="fill()" type="button" class="btn btn-default">Repondre</button>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<div ng-repeat="group in eev.contents | orderBy:'rank'" class="panel panel-primary">
		<div class="panel-heading">{{group.title}}</div>
		<div class="panel-body">
			<table class="table table-hover">
				<tr ng-repeat="content in group.contents|orderBy:'rank'|flatten">
					<td ng-show="content.flattened" colspan="2"><span ng-bind-html="content.title" ></span></td>
					<td ng-hide="content.flattened"><span ng-class="{margin: content.margin}" ng-bind-html="content.question.question" ></span></td>
					<td ng-hide="content.flattened">
						<div class="btn-group pull-right">
							<button class="btn btn-default" name="answer{{$index}}" ng-class="{'active':answers[content.question.id] == '3'}" ng-click="answers[content.question.id] = '3'">:-D</button>
							<button class="btn btn-default" name="answer{{$index}}" ng-class="{'active':answers[content.question.id] == '2'}" ng-click="answers[content.question.id] = '2'">:-)</button>
							<button class="btn btn-default" name="answer{{$index}}" ng-class="{'active':answers[content.question.id] == '1'}" ng-click="answers[content.question.id] = '1'">:-|</button>
							<button class="btn btn-default" name="answer{{$index}}" ng-class="{'active':answers[content.question.id] == '0'}" ng-click="answers[content.question.id] = '0'">:-(</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<button ng-click="fill()" type="button" class="btn btn-default">Repondre</button>
	</div>
</div>