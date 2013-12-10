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
		<button ng-disabled="eevDisabled" ng-click="fill()" type="button" class="btn btn-default">Repondre</button>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<div ng-repeat="group in eev.contents | orderBy:'rank'" class="panel panel-primary">
		<div class="panel-heading">{{group.title}}</div>
		<div class="panel-body">
			<div class="list-group col-xs-12 col-md-4">
			 <a class="row list-group-item" ng-repeat="content in group.contents|orderBy:'rank'|flatten">
			 	<div class="col-xs-12" ng-show="content.flattened"><span ng-bind-html="content.title" ></span></div>
				<div class="col-xs-12 col-sm-6" ng-hide="content.flattened">
					<span ng-class="{margin: content.margin}" ng-bind-html="content.question.question" ></span>
				</div>
				<div ng-hide="content.flattened" class="col-xs-12 col-sm-6">
					<div class="btn-group pull-right">
						<button class="btn btn-default" name="answer{{$index}}" ng-class="{'active':answers[content.question.id] == '3'}" ng-click="answers[content.question.id] = '3'">:-D</button>
						<button class="btn btn-default" name="answer{{$index}}" ng-class="{'active':answers[content.question.id] == '2'}" ng-click="answers[content.question.id] = '2'">:-)</button>
						<button class="btn btn-default" name="answer{{$index}}" ng-class="{'active':answers[content.question.id] == '1'}" ng-click="answers[content.question.id] = '1'">:-|</button>
						<button class="btn btn-default" name="answer{{$index}}" ng-class="{'active':answers[content.question.id] == '0'}" ng-click="answers[content.question.id] = '0'">:-(</button>
					</div>
				</div>
			 </a>
			 </div>
		 	<div class="col-xs-12 col-md-4 pull-right">
		 		<div class="panel panel-default">
			 		<div class="panel-heading panel-title">Points forts</div>
			 		<div class="panel-body">
				 		<form role="form" style="height: 100%;">
				 			<div class="form-group">
					 			<textarea class="form-control"></textarea>
				 			</div>
				 		</form>
			 		</div>
		 		</div>
			</div>
		 	<div class="col-xs-12 col-md-4 pull-right">
		 		<div class="panel panel-default">
			 		<div class="panel-heading panel-title">Points faibles</div>
			 		<div class="panel-body">
				 		<form role="form" style="height: 100%;">
				 			<div class="form-group">
					 			<textarea class="form-control"></textarea>
				 			</div>
				 		</form>
			 		</div>
		 		</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<button ng-disabled="eevDisabled" ng-click="fill()" type="button" class="btn btn-default">Repondre</button>
	</div>
</div>