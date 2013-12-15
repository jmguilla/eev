<div ng-if="!!eev == true" class="row slide">
	<div class="col-xs-12">
		<button ng-disabled="eevSubmitting == true" ng-if="eevSubmitting == false" ng-click="fill()" type="button" class="btn btn-default slide">Repondre</button>
		<div ng-if="eevSubmitting == true" class="progress progress-striped active slide">
		  <div class="progress-bar"  role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
		    <span class="sr-only">Soumission en cours</span>
		  </div>
		</div>
	</div>
</div>
<div ng-if="!!eev == true" class="row slide">
	<div class="col-xs-12">
		<h3>{{eev.title}}</h3>
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
<div ng-if="!!eev == true" class="row slide">
	<div class="col-xs-12">
		<div ng-repeat="group in eev.contents | orderBy:'rank'" class="panel panel-primary">
		<div class="panel-heading">
			<div class="col-xs-9 col-md-12">{{group.title}}</div>
			<div class="btn-group hidden-md hidden-lg pull-right col-xs-3">
			  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			  <span class="glyphicon glyphicon-list"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu">
			    <li><a href="#" data-toggle="modal" data-target="#pointsForts{{$index}}">Points Forts</a></li>
			    <li><a href="#" data-toggle="modal" data-target="#pointsFaibles{{$index}}">Points Faibles</a></li>
			  </ul>
			  
			  <div class="modal fade" id="pointsForts{{$index}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				        <h4 class="modal-title" id="myModalLabel">Points Forts</h4>
				      </div>
				      <div class="modal-body">
			 			<textarea class="form-control" ng-model="answers[group.strengthsQuestion.question.id]"></textarea>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
				
			  	<div class="modal fade" id="pointsFaibles{{$index}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				        <h4 class="modal-title" id="myModalLabel">Points Faibles</h4>
				      </div>
				      <div class="modal-body">
			 			<textarea class="form-control" ng-model="answers[group.weaknessesQuestion.question.id]"></textarea>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
			</div>
      		<div class="clearfix"></div>
		</div>
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
		 	<div class="col-xs-12 col-md-4 pull-right hidden-xs hidden-sm">
		 		<div class="panel panel-default">
			 		<div class="panel-heading panel-title">Points forts</div>
			 		<div class="panel-body">
				 		<form role="form" style="height: 100%;">
				 			<div class="form-group">
					 			<textarea ng-model="answers[group.strengthsQuestion.question.id]" class="form-control"></textarea>
				 			</div>
				 		</form>
			 		</div>
		 		</div>
			</div>
		 	<div class="col-xs-12 col-md-4 pull-right hidden-xs hidden-sm">
		 		<div class="panel panel-default">
			 		<div class="panel-heading panel-title">Points faibles</div>
			 		<div class="panel-body">
				 		<form role="form" style="height: 100%;">
				 			<div class="form-group">
					 			<textarea ng-model="answers[group.weaknessesQuestion.question.id]" class="form-control"></textarea>
				 			</div>
				 		</form>
			 		</div>
		 		</div>
			</div>
		</div>
	</div>
</div>
</div>
<div ng-if="!!eev == true" class="row">
	<div class="col-xs-12">
		<button ng-disabled="eevSubmitting == true" ng-if="eevSubmitting == false" ng-click="fill()" type="button" class="btn btn-default slide">Repondre</button>
	</div>
</div>
<div ng-if="!eev == true" class="row">
	<div class="col-xs-12">
		<h1>Chargement</h1>
		<div class="progress progress-striped active">
		  <div class="progress-bar"  role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
		    <span class="sr-only">Chargement</span>
		  </div>
		</div>
	</div>
</div>