<%@ page import="com.jmguilla.eev.EEVQuestions" %>
<%@ page import="com.jmguilla.eev.EEVAnswers" %>
<%@ page import="com.jmguilla.eev.EEVRowsGroup" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<meta name="layout" content="main_no_cache"/>
		<title>EEV</title>
		<link type="text/css" href="${createLinkTo(dir:'css',file:'main.css')}" />
		<r:require module="bootstrap"/>
	</head>
	<body>
		<div class="col-xs-12">
		<div class="row">
			<div class="col-xs-12">
				<h3><%=eev.eevQuestions.title%></h3>
				<form role="form">
				<div class="form-group">
				  <label for="interviewer">Email Manager</label>
				  <div>
				  	<input type="text" class="form-control" id="interviewer" placeholder="Email Manager" value="<%=eev.interviewer %>"/>
				  </div>
				</div>
				</form>
			</div>
			<div class="col-xs-12">
				<form role="form">
				<div class="form-group">
				  <label for="interviewee">Email Vendeur</label>
				  <div>
				  	<input type="text" class="form-control" id="interviewee" placeholder="Email Vendeur" value="<%=eev.interviewee%>" />
				  </div>
				</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<g:each in="${eev.eevQuestions.contents.sort{it.rank}}" var="group" status="index">
				<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="col-xs-9 col-md-12">${group.title}</div>
      			<div class="clearfix"></div>
				</div>
					<div class="panel-body">
						<div class="list-group col-xs-12 col-md-4">
						<%
            				//flattening
            				def flattenedRows = []
                    		def flattenedIds = []
                   			group.contents.sort{it.rank}.each{
                               	flattenedRows.add(it)
                           		if(it.hasProperty('contents')){
                                 it.contents.each{row -> row.metaClass.margin = {'margin'} }
                                 flattenedRows.addAll(it.contents.sort{row -> row.rank})
                                 flattenedIds.addAll(it.contents*.id)
                                }
                            }
            			 %>
						<g:each in="${flattenedRows}" var="content" status="jindex">
						 <a class="row list-group-item">
						 	<g:if test="${ content.hasProperty('contents')}">
						 	<div class="col-xs-12"><span>${content.title}</span></div>
						 	</g:if>
						 	<g:else>
							<div class="col-xs-12 col-sm-6">
								<span class="${flattenedIds.contains(content.id)?'margin':''}">${content.question.question}</span>
							</div>
							<div ng-hide="content.flattened" class="col-xs-12 col-sm-6">
								<div class="btn-group pull-right">
									<g:each in="${3..0}" var="faceIndex">
									<% def answerIndex = eev.answers.find{a -> a.question.id == content.question.id}?.answer %>
									<button class="btn face face${faceIndex} ${answerIndex && new Integer(answerIndex) == faceIndex? 'active': ''}" ></button>
									</g:each>
								</div>
							</div>
							</g:else>
						 </a>
						</g:each>
						 </div>
					 	<div class="col-xs-12 col-md-4 pull-right hidden-xs hidden-sm">
					 		<div class="panel panel-default">
						 		<div class="panel-heading panel-title">Points forts</div>
						 		<div class="panel-body">
							 		<form role="form" style="height: 100%;">
							 			<div class="form-group">
								 			<textarea class="form-control">${eev.answers.find{a -> a.question.id == group.strengthsQuestion.id}?.answer}</textarea>
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
								 			<textarea class="form-control">${eev.answers.find{a -> a.question.id == group.weaknessesQuestion.id}?.answer}</textarea>
							 			</div>
							 		</form>
						 		</div>
					 		</div>
						</div>
					</div>
				</div>
			</g:each>
		</div>
		</div>
		</div>
	</body>
</html>
