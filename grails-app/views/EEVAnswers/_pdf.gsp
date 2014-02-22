<%@ page import="com.jmguilla.eev.EEVQuestions" %>
<%@ page import="com.jmguilla.eev.EEVAnswers" %>
<%@ page import="com.jmguilla.eev.EEVRowsGroup" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
  		<meta http-equiv="content-type" content="text/html"/>
		<style type="text/css">
			<g:render template="bootstrap1"/>
			<g:render template="bootstrap2"/>
.navbar-inverse .navbar-collapse,
.navbar-inverse .navbar-form {
  border-color: #101010;
}

.navbar-inverse .navbar-nav > .open > a,
.navbar-inverse .navbar-nav > .open > a:hover,
.navbar-inverse .navbar-nav > .open > a:focus {
  color: #ffffff;
  background-color: #080808;
}

@media (max-width: 767px) {
  .navbar-inverse .navbar-nav .open .dropdown-menu > .dropdown-header {
    border-color: #080808;
  }
  .navbar-inverse .navbar-nav .open .dropdown-menu .divider {
    background-color: #080808;
  }
  .navbar-inverse .navbar-nav .open .dropdown-menu > li > a {
    color: #999999;
  }<%-- some comment --%>
  .navbar-inverse .navbar-nav .open .dropdown-menu > li > a:hover,
  .navbar-inverse .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #ffffff;
    background-color: transparent;
  }
  .navbar-inverse .navbar-nav .open .dropdown-menu > .active > a,
  .navbar-inverse .navbar-nav .open .dropdown-menu > .active > a:hover,
  .navbar-inverse .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #ffffff;
    background-color: #080808;
  }
  .navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a,
  .navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a:hover,
  .navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a:focus {
    color: #444444;
    background-color: transparent;
  }
}

.navbar-inverse .navbar-link {
  color: #999999;
}

.navbar-inverse .navbar-link:hover {
  color: #ffffff;
}
<%-- some comment --%>
.breadcrumb {
  padding: 8px 15px;
  margin-bottom: 20px;
  list-style: none;
  background-color: #f5f5f5;
  border-radius: 4px;
}

.breadcrumb > li {
  display: inline-block;
}

.breadcrumb > li + li:before {
  padding: 0 5px;
  color: #cccccc;
  content: "/\00a0";
}

.breadcrumb > .active {
  color: #999999;
}

.pagination {
  display: inline-block;
  padding-left: 0;
  margin: 20px 0;
  border-radius: 4px;
}

.pagination > li {
  display: inline;
}

.pagination > li > a,
.pagination > li > span {
  position: relative;
  float: left;
  padding: 2px 5px;
  margin-left: -1px;
  line-height: 1.428571429;
  text-decoration: none;
  background-color: #ffffff;
  border: 1px solid #dddddd;
}

.pagination > li:first-child > a,
.pagination > li:first-child > span {
  margin-left: 0;
  border-bottom-left-radius: 4px;
  border-top-left-radius: 4px;
}

.pagination > li:last-child > a,
.pagination > li:last-child > span {
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}

.pagination > li > a:hover,
.pagination > li > span:hover,
.pagination > li > a:focus,
.pagination > li > span:focus {
  background-color: #eeeeee;
}

.pagination > .active > a,
.pagination > .active > span,
.pagination > .active > a:hover,
.pagination > .active > span:hover,
.pagination > .active > a:focus,
.pagination > .active > span:focus {
  z-index: 2;
  color: #ffffff;
  cursor: default;
  background-color: #428bca;
  border-color: #428bca;
}

.pagination > .disabled > span,
.pagination > .disabled > span:hover,
.pagination > .disabled > span:focus,
.pagination > .disabled > a,
.pagination > .disabled > a:hover,
.pagination > .disabled > a:focus {
  color: #999999;
  cursor: not-allowed;
  background-color: #ffffff;
  border-color: #dddddd;
}

.pagination-lg > li > a,
.pagination-lg > li > span {
  padding: 10px 16px;
  font-size: 8px;
}

.pagination-lg > li:first-child > a,
.pagination-lg > li:first-child > span {
  border-bottom-left-radius: 6px;
  border-top-left-radius: 6px;
}

.pagination-lg > li:last-child > a,
.pagination-lg > li:last-child > span {
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}

.pagination-sm > li > a,
.pagination-sm > li > span {
  padding: 5px 10px;
  font-size: 12px;
}

.pagination-sm > li:first-child > a,
.pagination-sm > li:first-child > span {
  border-bottom-left-radius: 3px;
  border-top-left-radius: 3px;
}

.pagination-sm > li:last-child > a,
.pagination-sm > li:last-child > span {
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
}

.pager {
  padding-left: 0;
  margin: 20px 0;
  text-align: center;
  list-style: none;
}

.pager:before,
.pager:after {
  display: table;
  content: " ";
}

.pager:after {
  clear: both;
}

.pager:before,
.pager:after {
  display: table;
  content: " ";
}

.pager:after {
  clear: both;
}

.pager li {
  display: inline;
}

.pager li > a,
.pager li > span {
  display: inline-block;
  padding: 5px 14px;
  background-color: #ffffff;
  border: 1px solid #dddddd;
  border-radius: 15px;
}<%-- some comment --%>

.pager li > a:hover,
.pager li > a:focus {
  text-decoration: none;
  background-color: #eeeeee;
}

.pager .next > a,
.pager .next > span {
  float: right;
}

.pager .previous > a,
.pager .previous > span {
  float: left;
}

.pager .disabled > a,
.pager .disabled > a:hover,
.pager .disabled > a:focus,
.pager .disabled > span {
  color: #999999;
  cursor: not-allowed;
  background-color: #ffffff;
}

.label {
  display: inline;
  padding: .2em .6em .3em;
  font-size: 75%;
  font-weight: bold;
  line-height: 1;
  color: #ffffff;
  text-align: center;
  white-space: nowrap;
  vertical-align: baseline;
  border-radius: .25em;
}

.label[href]:hover,
.label[href]:focus {
  color: #ffffff;
  text-decoration: none;
  cursor: pointer;
}

.label:empty {
  display: none;
}

.btn .label {
  position: relative;
  top: -1px;
}

.label-default {
  background-color: #999999;
}

.label-default[href]:hover,
.label-default[href]:focus {
  background-color: #808080;
}

.label-primary {
  background-color: #428bca;
}

.label-primary[href]:hover,
.label-primary[href]:focus {
  background-color: #3071a9;
}

.label-success {
  background-color: #5cb85c;
}

.label-success[href]:hover,
.label-success[href]:focus {
  background-color: #449d44;
}

.label-info {
  background-color: #5bc0de;
}

.label-info[href]:hover,
.label-info[href]:focus {
  background-color: #31b0d5;
}

.label-warning {
  background-color: #f0ad4e;
}

.label-warning[href]:hover,
.label-warning[href]:focus {
  background-color: #ec971f;
}

.label-danger {
  background-color: #d9534f;
}
<%-- some comment --%>
.label-danger[href]:hover,
.label-danger[href]:focus {
  background-color: #c9302c;
}

.badge {
  display: inline-block;
  min-width: 10px;
  padding: 3px 7px;
  font-size: 12px;
  font-weight: bold;
  line-height: 1;
  color: #ffffff;
  text-align: center;
  white-space: nowrap;
  vertical-align: baseline;
  background-color: #999999;
  border-radius: 10px;
}

.badge:empty {
  display: none;
}

.btn .badge {
  position: relative;
  top: -1px;
}

a.badge:hover,
a.badge:focus {
  color: #ffffff;
  text-decoration: none;
  cursor: pointer;
}

a.list-group-item.active > .badge,
.nav-pills > .active > a > .badge {
  color: #428bca;
  background-color: #ffffff;
}

.nav-pills > li > a > .badge {
  margin-left: 3px;
}

.jumbotron {
  padding: 30px;
  margin-bottom: 30px;
  font-size: 21px;
  font-weight: 200;
  line-height: 2.1428571435;
  color: inherit;
  background-color: #eeeeee;
}

.jumbotron h1,
.jumbotron .h1 {
  line-height: 1;
  color: inherit;
}

.jumbotron p {
  line-height: 1.4;
}

.container .jumbotron {
  border-radius: 6px;
}

.jumbotron .container {
  max-width: 100%;
}

@media screen and (min-width: 768px) {
  .jumbotron {
    padding-top: 48px;
    padding-bottom: 48px;
  }
  .container .jumbotron {
    padding-right: 60px;
    padding-left: 60px;
  }
  .jumbotron h1,
  .jumbotron .h1 {
    font-size: 63px;
  }
}

.thumbnail {
  display: block;
  padding: 4px;
  margin-bottom: 20px;
  line-height: 1.428571429;
  background-color: #ffffff;
  border: 1px solid #dddddd;
  border-radius: 4px;
  -webkit-transition: all 0.2s ease-in-out;
          transition: all 0.2s ease-in-out;
}

.thumbnail > img,
.thumbnail a > img {
  display: block;
  height: auto;
  max-width: 100%;
  margin-right: auto;
  margin-left: auto;
}

a.thumbnail:hover,
a.thumbnail:focus,
a.thumbnail.active {
  border-color: #428bca;
}

.thumbnail .caption {
  padding: 9px;
  color: #333333;
}

.alert {
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid transparent;
  border-radius: 4px;
}

.alert h4 {
  margin-top: 0;
  color: inherit;
}

.alert .alert-link {
  font-weight: bold;
}

.alert > p,
.alert > ul {
  margin-bottom: 0;
}

.alert > p + p {
  margin-top: 5px;
}

.alert-dismissable {
  padding-right: 35px;
}

.alert-dismissable .close {
  position: relative;
  top: -2px;
  right: -21px;
  color: inherit;
}

.alert-success {
  color: #3c763d;
  background-color: #dff0d8;
  border-color: #d6e9c6;
}

.alert-success hr {
  border-top-color: #c9e2b3;
}

.alert-success .alert-link {
  color: #2b542c;
}

.alert-info {
  color: #31708f;
  background-color: #d9edf7;
  border-color: #bce8f1;
}

.alert-info hr {
  border-top-color: #a6e1ec;
}

.alert-info .alert-link {
  color: #245269;
}

.alert-warning {
  color: #8a6d3b;
  background-color: #fcf8e3;
  border-color: #faebcc;
}

.alert-warning hr {
  border-top-color: #f7e1b5;
}

.alert-warning .alert-link {
  color: #66512c;
}

.alert-danger {
  color: #a94442;
  background-color: #f2dede;
  border-color: #ebccd1;
}

.alert-danger hr {
  border-top-color: #e4b9c0;
}

.alert-danger .alert-link {
  color: #843534;
}

@-webkit-keyframes progress-bar-stripes {
  from {
    background-position: 40px 0;
  }
  to {
    background-position: 0 0;
  }
}<%-- some comment --%>

@keyframes progress-bar-stripes {
  from {
    background-position: 40px 0;
  }
  to {
    background-position: 0 0;
  }
}

.progress {
  height: 20px;
  margin-bottom: 20px;
  overflow: hidden;
  background-color: #f5f5f5;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
}

.progress-bar {
  float: left;
  width: 0;
  height: 100%;
  font-size: 12px;
  line-height: 20px;
  color: #ffffff;
  text-align: center;
  background-color: #428bca;
  -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
          box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
  -webkit-transition: width 0.6s ease;
          transition: width 0.6s ease;
}

.progress-striped .progress-bar {
  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-size: 40px 40px;
}

.progress.active .progress-bar {
  -webkit-animation: progress-bar-stripes 2s linear infinite;
          animation: progress-bar-stripes 2s linear infinite;
}

.progress-bar-success {
  background-color: #5cb85c;
}

.progress-striped .progress-bar-success {
  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
}

.progress-bar-info {
  background-color: #5bc0de;
}

.progress-striped .progress-bar-info {
  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
}

.progress-bar-warning {
  background-color: #f0ad4e;
}

.progress-striped .progress-bar-warning {
  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
}

.progress-bar-danger {
  background-color: #d9534f;
}

.progress-striped .progress-bar-danger {
  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
}

.media,
.media-body {
  overflow: hidden;
  zoom: 1;
}

.media,
.media .media {
  margin-top: 15px;
}

.media:first-child {
  margin-top: 0;
}

.media-object {
  display: block;
}

.media-heading {
  margin: 0 0 5px;
}

.media > .pull-left {
  margin-right: 10px;
}

.media > .pull-right {
  margin-left: 10px;
}

.media-list {
  padding-left: 0;
  list-style: none;
}

.list-group {
  padding-left: 0;
  margin-bottom: 5px;
}

.list-group-item {
  position: relative;
  display: block;
  padding: 2px 0px;
  margin-bottom: -1px;
  background-color: #ffffff;
  border: 1px solid #dddddd;
}

.list-group-item:first-child {
  /* border-top-right-radius: 4px; */
  /* border-top-left-radius: 4px; */
}

.list-group-item:last-child {
  margin-bottom: 0;
  /* border-bottom-right-radius: 4px; */
  /* border-bottom-left-radius: 4px; */
}

.list-group-item > .badge {
  float: right;
}

.list-group-item > .badge + .badge {
  margin-right: 5px;
}
<%-- some comment --%>
a.list-group-item {
  color: #555555;
}

a.list-group-item .list-group-item-heading {
  color: #333333;
}

a.list-group-item:hover,
a.list-group-item:focus {
  text-decoration: none;
  background-color: #f5f5f5;
}

a.list-group-item.active,
a.list-group-item.active:hover,
a.list-group-item.active:focus {
  z-index: 2;
  color: #ffffff;
  background-color: #428bca;
  border-color: #428bca;
}

a.list-group-item.active .list-group-item-heading,
a.list-group-item.active:hover .list-group-item-heading,
a.list-group-item.active:focus .list-group-item-heading {
  color: inherit;
}

a.list-group-item.active .list-group-item-text,
a.list-group-item.active:hover .list-group-item-text,
a.list-group-item.active:focus .list-group-item-text {
  color: #e1edf7;
}

.list-group-item-heading {
  margin-top: 0;
  margin-bottom: 2px;
}

.list-group-item-text {
  margin-bottom: 0;
  line-height: 1;
}

.panel {
  margin-bottom: 10px;
  background-color: #ffffff;
  border: 1px solid transparent;
  border-radius: 4px;
  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
          box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
}

.panel-body {
  padding: 2px;
}

.panel-body:before,
.panel-body:after {
  display: table;
  content: " ";
}

.panel-body:after {
  clear: both;
}

.panel-body:before,
.panel-body:after {
  display: table;
  content: " ";
}

.panel-body:after {
  clear: both;
}

.panel > .list-group {
  margin-bottom: 0;
}

.panel > .list-group .list-group-item {
  border-width: 1px 0;
}

.panel > .list-group .list-group-item:first-child {
  border-top-right-radius: 0;
  border-top-left-radius: 0;
}

.panel > .list-group .list-group-item:last-child {
  border-bottom: 0;
}

.panel-heading + .list-group .list-group-item:first-child {
  border-top-width: 0;
}

.panel > .table,
.panel > .table-responsive > .table {
  margin-bottom: 0;
}

.panel > .panel-body + .table,
.panel > .panel-body + .table-responsive {
  border-top: 1px solid #dddddd;
}

.panel > .table > tbody:first-child th,
.panel > .table > tbody:first-child td {
  border-top: 0;
}

.panel > .table-bordered,
.panel > .table-responsive > .table-bordered {
  border: 0;
}

.panel > .table-bordered > thead > tr > th:first-child,
.panel > .table-responsive > .table-bordered > thead > tr > th:first-child,
.panel > .table-bordered > tbody > tr > th:first-child,
.panel > .table-responsive > .table-bordered > tbody > tr > th:first-child,
.panel > .table-bordered > tfoot > tr > th:first-child,
.panel > .table-responsive > .table-bordered > tfoot > tr > th:first-child,
.panel > .table-bordered > thead > tr > td:first-child,
.panel > .table-responsive > .table-bordered > thead > tr > td:first-child,
.panel > .table-bordered > tbody > tr > td:first-child,
.panel > .table-responsive > .table-bordered > tbody > tr > td:first-child,
.panel > .table-bordered > tfoot > tr > td:first-child,
.panel > .table-responsive > .table-bordered > tfoot > tr > td:first-child {
  border-left: 0;
}

.panel > .table-bordered > thead > tr > th:last-child,
.panel > .table-responsive > .table-bordered > thead > tr > th:last-child,
.panel > .table-bordered > tbody > tr > th:last-child,
.panel > .table-responsive > .table-bordered > tbody > tr > th:last-child,
.panel > .table-bordered > tfoot > tr > th:last-child,
.panel > .table-responsive > .table-bordered > tfoot > tr > th:last-child,
.panel > .table-bordered > thead > tr > td:last-child,
.panel > .table-responsive > .table-bordered > thead > tr > td:last-child,
.panel > .table-bordered > tbody > tr > td:last-child,
.panel > .table-responsive > .table-bordered > tbody > tr > td:last-child,
.panel > .table-bordered > tfoot > tr > td:last-child,
.panel > .table-responsive > .table-bordered > tfoot > tr > td:last-child {
  border-right: 0;
}
<%-- some comment --%>
.panel > .table-bordered > thead > tr:last-child > th,
.panel > .table-responsive > .table-bordered > thead > tr:last-child > th,
.panel > .table-bordered > tbody > tr:last-child > th,
.panel > .table-responsive > .table-bordered > tbody > tr:last-child > th,
.panel > .table-bordered > tfoot > tr:last-child > th,
.panel > .table-responsive > .table-bordered > tfoot > tr:last-child > th,
.panel > .table-bordered > thead > tr:last-child > td,
.panel > .table-responsive > .table-bordered > thead > tr:last-child > td,
.panel > .table-bordered > tbody > tr:last-child > td,
.panel > .table-responsive > .table-bordered > tbody > tr:last-child > td,
.panel > .table-bordered > tfoot > tr:last-child > td,
.panel > .table-responsive > .table-bordered > tfoot > tr:last-child > td {
  border-bottom: 0;
}

.panel > .table-responsive {
  margin-bottom: 0;
  border: 0;
}

.panel-heading {
  padding: 2px 2px;
  border-bottom: 1px solid transparent;
  /* border-top-right-radius: 3px; */
  /* border-top-left-radius: 3px; */
}

.panel-heading > .dropdown .dropdown-toggle {
  color: inherit;
}

.panel-title {
  margin-top: 0;
  margin-bottom: 0;
  font-size: 10px;
  color: inherit;
}

.panel-title > a {
  color: inherit;
}

.panel-footer {
  padding: 10px 15px;
  background-color: #f5f5f5;
  border-top: 1px solid #dddddd;
  border-bottom-right-radius: 3px;
  border-bottom-left-radius: 3px;
}

.panel-group .panel {
  margin-bottom: 0;
  overflow: hidden;
  /* border-radius: 4px; */
}

.panel-group .panel + .panel {
  margin-top: 2px;
}

.panel-group .panel-heading {
  border-bottom: 0;
}

.panel-group .panel-heading + .panel-collapse .panel-body {
  border-top: 1px solid #dddddd;
}

.panel-group .panel-footer {
  border-top: 0;
}

.panel-group .panel-footer + .panel-collapse .panel-body {
  border-bottom: 1px solid #dddddd;
}

.panel-default {
  border-color: #dddddd;
}

.panel-default > .panel-heading {
  color: #333333;
  background-color: #f5f5f5;
  border-color: #dddddd;
}

.panel-default > .panel-heading + .panel-collapse .panel-body {
  border-top-color: #dddddd;
}

.panel-default > .panel-footer + .panel-collapse .panel-body {
  border-bottom-color: #dddddd;
}
<%-- some comment --%>
.panel-primary {
  border-color: #428bca;
}

.panel-primary > .panel-heading {
  color: #ffffff;
  background-color: #428bca;
  border-color: #428bca;
}

.panel-primary > .panel-heading + .panel-collapse .panel-body {
  border-top-color: #428bca;
}

.panel-primary > .panel-footer + .panel-collapse .panel-body {
  border-bottom-color: #428bca;
}

.panel-success {
  border-color: #d6e9c6;
}

.panel-success > .panel-heading {
  color: #3c763d;
  background-color: #dff0d8;
  border-color: #d6e9c6;
}

.panel-success > .panel-heading + .panel-collapse .panel-body {
  border-top-color: #d6e9c6;
}

.panel-success > .panel-footer + .panel-collapse .panel-body {
  border-bottom-color: #d6e9c6;
}

.panel-warning {
  border-color: #faebcc;
}

.panel-warning > .panel-heading {
  color: #8a6d3b;
  background-color: #fcf8e3;
  border-color: #faebcc;
}

.panel-warning > .panel-heading + .panel-collapse .panel-body {
  border-top-color: #faebcc;
}

.panel-warning > .panel-footer + .panel-collapse .panel-body {
  border-bottom-color: #faebcc;
}

.panel-danger {
  border-color: #ebccd1;
}

.panel-danger > .panel-heading {
  color: #a94442;
  background-color: #f2dede;
  border-color: #ebccd1;
}

.panel-danger > .panel-heading + .panel-collapse .panel-body {
  border-top-color: #ebccd1;
}

.panel-danger > .panel-footer + .panel-collapse .panel-body {
  border-bottom-color: #ebccd1;
}
<%-- some comment --%>
.panel-info {
  border-color: #bce8f1;
}

.panel-info > .panel-heading {
  color: #31708f;
  background-color: #d9edf7;
  border-color: #bce8f1;
}

.panel-info > .panel-heading + .panel-collapse .panel-body {
  border-top-color: #bce8f1;
}

.panel-info > .panel-footer + .panel-collapse .panel-body {
  border-bottom-color: #bce8f1;
}

.well {
  min-height: 20px;
  padding: 19px;
  margin-bottom: 20px;
  background-color: #f5f5f5;
  border: 1px solid #e3e3e3;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
}

.well blockquote {
  border-color: #ddd;
  border-color: rgba(0, 0, 0, 0.15);
}

.well-lg {
  padding: 24px;
  border-radius: 6px;
}

.well-sm {
  padding: 9px;
  border-radius: 3px;
}

.close {
  float: right;
  font-size: 21px;
  font-weight: bold;
  line-height: 1;
  color: #000000;
  text-shadow: 0 1px 0 #ffffff;
  opacity: 0.2;
  filter: alpha(opacity=20);
}

.close:hover,
.close:focus {
  color: #000000;
  text-decoration: none;
  cursor: pointer;
  opacity: 0.5;
  filter: alpha(opacity=50);
}

button.close {
  padding: 0;
  cursor: pointer;
  background: transparent;
  border: 0;
  -webkit-appearance: none;
}

.modal-open {
  overflow: hidden;
}

.modal {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1040;
  display: none;
  overflow: auto;
  overflow-y: scroll;
}

.modal.fade .modal-dialog {
  -webkit-transform: translate(0, -25%);
      -ms-transform: translate(0, -25%);
          transform: translate(0, -25%);
  -webkit-transition: -webkit-transform 0.3s ease-out;
     -moz-transition: -moz-transform 0.3s ease-out;
       -o-transition: -o-transform 0.3s ease-out;
          transition: transform 0.3s ease-out;
}

.modal.in .modal-dialog {
  -webkit-transform: translate(0, 0);
      -ms-transform: translate(0, 0);
          transform: translate(0, 0);
}

.modal-dialog {
  position: relative;
  z-index: 1050;
  width: auto;
  margin: 10px;
}

.modal-content {
  position: relative;
  background-color: #ffffff;
  border: 1px solid #999999;
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 6px;
  outline: none;
  -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
          box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
  background-clip: padding-box;
}

.modal-backdrop {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1030;
  background-color: #000000;
}

.modal-backdrop.fade {
  opacity: 0;
  filter: alpha(opacity=0);
}

.modal-backdrop.in {
  opacity: 0.5;
  filter: alpha(opacity=50);
}

.modal-header {
  min-height: 16.428571429px;
  padding: 15px;
  border-bottom: 1px solid #e5e5e5;
}

.modal-header .close {
  margin-top: -2px;
}

.modal-title {
  margin: 0;
  line-height: 1.428571429;
}

.modal-body {
  position: relative;
  padding: 20px;
}

.modal-footer {
  padding: 19px 20px 20px;
  margin-top: 15px;
  text-align: right;
  border-top: 1px solid #e5e5e5;
}

.modal-footer:before,
.modal-footer:after {
  display: table;
  content: " ";
}

.modal-footer:after {
  clear: both;
}

.modal-footer:before,
.modal-footer:after {
  display: table;
  content: " ";
}

.modal-footer:after {
  clear: both;
}

.modal-footer .btn + .btn {
  margin-bottom: 0;
  margin-left: 5px;
}

.modal-footer .btn-group .btn + .btn {
  margin-left: -1px;
}

.modal-footer .btn-block + .btn-block {
  margin-left: 0;
}

@media screen and (min-width: 768px) {
  .modal-dialog {
    width: 600px;
    margin: 30px auto;
  }
  .modal-content {
    -webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
  }
}

.tooltip {
  position: absolute;
  z-index: 1030;
  display: block;
  font-size: 12px;
  line-height: 1.4;
  opacity: 0;
  filter: alpha(opacity=0);
  visibility: visible;
}
<%-- some comment --%>
.tooltip.in {
  opacity: 0.9;
  filter: alpha(opacity=90);
}

.tooltip.top {
  padding: 5px 0;
  margin-top: -3px;
}

.tooltip.right {
  padding: 0 5px;
  margin-left: 3px;
}

.tooltip.bottom {
  padding: 5px 0;
  margin-top: 3px;
}

.tooltip.left {
  padding: 0 5px;
  margin-left: -3px;
}

.tooltip-inner {
  max-width: 200px;
  padding: 3px 8px;
  color: #ffffff;
  text-align: center;
  text-decoration: none;
  background-color: #000000;
  border-radius: 4px;
}

.tooltip-arrow {
  position: absolute;
  width: 0;
  height: 0;
  border-color: transparent;
  border-style: solid;
}

.tooltip.top .tooltip-arrow {
  bottom: 0;
  left: 50%;
  margin-left: -5px;
  border-top-color: #000000;
  border-width: 5px 5px 0;
}

.tooltip.top-left .tooltip-arrow {
  bottom: 0;
  left: 5px;
  border-top-color: #000000;
  border-width: 5px 5px 0;
}

.tooltip.top-right .tooltip-arrow {
  right: 5px;
  bottom: 0;
  border-top-color: #000000;
  border-width: 5px 5px 0;
}

.tooltip.right .tooltip-arrow {
  top: 50%;
  left: 0;
  margin-top: -5px;
  border-right-color: #000000;
  border-width: 5px 5px 5px 0;
}

.tooltip.left .tooltip-arrow {
  top: 50%;
  right: 0;
  margin-top: -5px;
  border-left-color: #000000;
  border-width: 5px 0 5px 5px;
}

.tooltip.bottom .tooltip-arrow {
  top: 0;
  left: 50%;
  margin-left: -5px;
  border-bottom-color: #000000;
  border-width: 0 5px 5px;
}

.tooltip.bottom-left .tooltip-arrow {
  top: 0;
  left: 5px;
  border-bottom-color: #000000;
  border-width: 0 5px 5px;
}

.tooltip.bottom-right .tooltip-arrow {
  top: 0;
  right: 5px;
  border-bottom-color: #000000;
  border-width: 0 5px 5px;
}

.popover {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1010;
  display: none;
  max-width: 276px;
  padding: 1px;
  text-align: left;
  white-space: normal;
  background-color: #ffffff;
  border: 1px solid #cccccc;
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 6px;
  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
          box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  background-clip: padding-box;
}

.popover.top {
  margin-top: -10px;
}

.popover.right {
  margin-left: 10px;
}

.popover.bottom {
  margin-top: 10px;
}

.popover.left {
  margin-left: -10px;
}

.popover-title {
  padding: 8px 14px;
  margin: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 18px;
  background-color: #f7f7f7;
  border-bottom: 1px solid #ebebeb;
  border-radius: 5px 5px 0 0;
}

.popover-content {
  padding: 9px 14px;
}

.popover .arrow,
.popover .arrow:after {
  position: absolute;
  display: block;
  width: 0;
  height: 0;
  border-color: transparent;
  border-style: solid;
}

.popover .arrow {
  border-width: 11px;
}

.popover .arrow:after {
  border-width: 10px;
  content: "";
}

.popover.top .arrow {
  bottom: -11px;
  left: 50%;
  margin-left: -11px;
  border-top-color: #999999;
  border-top-color: rgba(0, 0, 0, 0.25);
  border-bottom-width: 0;
}<%-- some comment --%>

.popover.top .arrow:after {
  bottom: 1px;
  margin-left: -10px;
  border-top-color: #ffffff;
  border-bottom-width: 0;
  content: " ";
}

.popover.right .arrow {
  top: 50%;
  left: -11px;
  margin-top: -11px;
  border-right-color: #999999;
  border-right-color: rgba(0, 0, 0, 0.25);
  border-left-width: 0;
}

.popover.right .arrow:after {
  bottom: -10px;
  left: 1px;
  border-right-color: #ffffff;
  border-left-width: 0;
  content: " ";
}

.popover.bottom .arrow {
  top: -11px;
  left: 50%;
  margin-left: -11px;
  border-bottom-color: #999999;
  border-bottom-color: rgba(0, 0, 0, 0.25);
  border-top-width: 0;
}

.popover.bottom .arrow:after {
  top: 1px;
  margin-left: -10px;
  border-bottom-color: #ffffff;
  border-top-width: 0;
  content: " ";
}

.popover.left .arrow {
  top: 50%;
  right: -11px;
  margin-top: -11px;
  border-left-color: #999999;
  border-left-color: rgba(0, 0, 0, 0.25);
  border-right-width: 0;
}

.popover.left .arrow:after {
  right: 1px;
  bottom: -10px;
  border-left-color: #ffffff;
  border-right-width: 0;
  content: " ";
}

.carousel {
  position: relative;
}

.carousel-inner {
  position: relative;
  width: 100%;
  overflow: hidden;
}

.carousel-inner > .item {
  position: relative;
  display: none;
  -webkit-transition: 0.6s ease-in-out left;
          transition: 0.6s ease-in-out left;
}

.carousel-inner > .item > img,
.carousel-inner > .item > a > img {
  display: block;
  height: auto;
  max-width: 100%;
  line-height: 1;
}

.carousel-inner > .active,
.carousel-inner > .next,
.carousel-inner > .prev {
  display: block;
}

.carousel-inner > .active {
  left: 0;
}

.carousel-inner > .next,
.carousel-inner > .prev {
  position: absolute;
  top: 0;
  width: 100%;
}

.carousel-inner > .next {
  left: 100%;
}

.carousel-inner > .prev {
  left: -100%;
}

.carousel-inner > .next.left,
.carousel-inner > .prev.right {
  left: 0;
}

.carousel-inner > .active.left {
  left: -100%;
}

.carousel-inner > .active.right {
  left: 100%;
}

.carousel-control {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  width: 15%;
  font-size: 20px;
  color: #ffffff;
  text-align: center;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.6);
  opacity: 0.5;
  filter: alpha(opacity=50);
}

.carousel-control.left {
  background-image: -webkit-linear-gradient(left, color-stop(rgba(0, 0, 0, 0.5) 0), color-stop(rgba(0, 0, 0, 0.0001) 100%));
  background-image: linear-gradient(to right, rgba(0, 0, 0, 0.5) 0, rgba(0, 0, 0, 0.0001) 100%);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
}

.carousel-control.right {
  right: 0;
  left: auto;
  background-image: -webkit-linear-gradient(left, color-stop(rgba(0, 0, 0, 0.0001) 0), color-stop(rgba(0, 0, 0, 0.5) 100%));
  background-image: linear-gradient(to right, rgba(0, 0, 0, 0.0001) 0, rgba(0, 0, 0, 0.5) 100%);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
}

.carousel-control:hover,
.carousel-control:focus {
  color: #ffffff;
  text-decoration: none;
  outline: none;
  opacity: 0.9;
  filter: alpha(opacity=90);
}

.carousel-control .icon-prev,
.carousel-control .icon-next,
.carousel-control .glyphicon-chevron-left,
.carousel-control .glyphicon-chevron-right {
  position: absolute;
  top: 50%;
  z-index: 5;
  display: inline-block;
}

.carousel-control .icon-prev,
.carousel-control .glyphicon-chevron-left {
  left: 50%;
}

.carousel-control .icon-next,
.carousel-control .glyphicon-chevron-right {
  right: 50%;
}

.carousel-control .icon-prev,
.carousel-control .icon-next {
  width: 20px;
  height: 20px;
  margin-top: -10px;
  margin-left: -10px;
  font-family: serif;
}

.carousel-control .icon-prev:before {
  content: '\2039';
}

.carousel-control .icon-next:before {
  content: '\203a';
}

.carousel-indicators {
  position: absolute;
  bottom: 10px;
  left: 50%;
  z-index: 15;
  width: 60%;
  padding-left: 0;
  margin-left: -30%;
  text-align: center;
  list-style: none;
}

.carousel-indicators li {
  display: inline-block;
  width: 10px;
  height: 10px;
  margin: 1px;
  text-indent: -999px;
  cursor: pointer;
  background-color: #000 \9;
  background-color: rgba(0, 0, 0, 0);
  border: 1px solid #ffffff;
  border-radius: 10px;
}

.carousel-indicators .active {
  width: 12px;
  height: 12px;
  margin: 0;
  background-color: #ffffff;
}
<%-- some comment --%>
.carousel-caption {
  position: absolute;
  right: 15%;
  bottom: 20px;
  left: 15%;
  z-index: 10;
  padding-top: 20px;
  padding-bottom: 20px;
  color: #ffffff;
  text-align: center;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.6);
}

.carousel-caption .btn {
  text-shadow: none;
}

@media screen and (min-width: 768px) {
  .carousel-control .glyphicons-chevron-left,
  .carousel-control .glyphicons-chevron-right,
  .carousel-control .icon-prev,
  .carousel-control .icon-next {
    width: 30px;
    height: 30px;
    margin-top: -15px;
    margin-left: -15px;
    font-size: 30px;
  }
  .carousel-caption {
    right: 20%;
    left: 20%;
    padding-bottom: 30px;
  }
  .carousel-indicators {
    bottom: 20px;
  }
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: " ";
}

.clearfix:after {
  clear: both;
}

.center-block {
  display: block;
  margin-right: auto;
  margin-left: auto;
}

.pull-right {
  float: right !important;
}

.pull-left {
  float: left !important;
}

.hide {
  display: none !important;
}

.show {
  display: block !important;
}

.invisible {
  visibility: hidden;
}

.text-hide {
  font: 0/0 a;
  color: transparent;
  text-shadow: none;
  background-color: transparent;
  border: 0;
}

.hidden {
  display: none !important;
  visibility: hidden !important;
}

.affix {
  position: fixed;
}

@-ms-viewport {
  width: device-width;
}

.visible-xs,
tr.visible-xs,
th.visible-xs,
td.visible-xs {
  display: none !important;
}

@media (max-width: 767px) {
  .visible-xs {
    display: block !important;
  }
  table.visible-xs {
    display: table;
  }
  tr.visible-xs {
    display: table-row !important;
  }
  th.visible-xs,
  td.visible-xs {
    display: table-cell !important;
  }
}
<%-- some comment --%>
@media (min-width: 768px) and (max-width: 991px) {
  .visible-xs.visible-sm {
    display: block !important;
  }
  table.visible-xs.visible-sm {
    display: table;
  }
  tr.visible-xs.visible-sm {
    display: table-row !important;
  }
  th.visible-xs.visible-sm,
  td.visible-xs.visible-sm {
    display: table-cell !important;
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .visible-xs.visible-md {
    display: block !important;
  }
  table.visible-xs.visible-md {
    display: table;
  }
  tr.visible-xs.visible-md {
    display: table-row !important;
  }
  th.visible-xs.visible-md,
  td.visible-xs.visible-md {
    display: table-cell !important;
  }
}

@media (min-width: 1200px) {
  .visible-xs.visible-lg {
    display: block !important;
  }
  table.visible-xs.visible-lg {
    display: table;
  }
  tr.visible-xs.visible-lg {
    display: table-row !important;
  }
  th.visible-xs.visible-lg,
  td.visible-xs.visible-lg {
    display: table-cell !important;
  }
}

.visible-sm,
tr.visible-sm,
th.visible-sm,
td.visible-sm {
  display: none !important;
}

@media (max-width: 767px) {
  .visible-sm.visible-xs {
    display: block !important;
  }
  table.visible-sm.visible-xs {
    display: table;
  }
  tr.visible-sm.visible-xs {
    display: table-row !important;
  }
  th.visible-sm.visible-xs,
  td.visible-sm.visible-xs {
    display: table-cell !important;
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .visible-sm {
    display: block !important;
  }
  table.visible-sm {
    display: table;
  }
  tr.visible-sm {
    display: table-row !important;
  }
  th.visible-sm,
  td.visible-sm {
    display: table-cell !important;
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .visible-sm.visible-md {
    display: block !important;
  }
  table.visible-sm.visible-md {
    display: table;
  }
  tr.visible-sm.visible-md {
    display: table-row !important;
  }
  th.visible-sm.visible-md,
  td.visible-sm.visible-md {
    display: table-cell !important;
  }
}

@media (min-width: 1200px) {
  .visible-sm.visible-lg {
    display: block !important;
  }
  table.visible-sm.visible-lg {
    display: table;
  }
  tr.visible-sm.visible-lg {
    display: table-row !important;
  }
  th.visible-sm.visible-lg,
  td.visible-sm.visible-lg {
    display: table-cell !important;
  }
}

.visible-md,
tr.visible-md,
th.visible-md,
td.visible-md {
  display: none !important;
}

@media (max-width: 767px) {
  .visible-md.visible-xs {
    display: block !important;
  }
  table.visible-md.visible-xs {
    display: table;
  }
  tr.visible-md.visible-xs {
    display: table-row !important;
  }
  th.visible-md.visible-xs,
  td.visible-md.visible-xs {
    display: table-cell !important;
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .visible-md.visible-sm {
    display: block !important;
  }
  table.visible-md.visible-sm {
    display: table;
  }
  tr.visible-md.visible-sm {
    display: table-row !important;
  }
  th.visible-md.visible-sm,
  td.visible-md.visible-sm {
    display: table-cell !important;
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .visible-md {
    display: block !important;
  }
  table.visible-md {
    display: table;
  }
  tr.visible-md {
    display: table-row !important;
  }
  th.visible-md,
  td.visible-md {
    display: table-cell !important;
  }
}

@media (min-width: 1200px) {
  .visible-md.visible-lg {
    display: block !important;
  }
  table.visible-md.visible-lg {
    display: table;
  }
  tr.visible-md.visible-lg {
    display: table-row !important;
  }
  th.visible-md.visible-lg,
  td.visible-md.visible-lg {
    display: table-cell !important;
  }
}

.visible-lg,
tr.visible-lg,
th.visible-lg,
td.visible-lg {
  display: none !important;
}

@media (max-width: 767px) {
  .visible-lg.visible-xs {
    display: block !important;
  }
  table.visible-lg.visible-xs {
    display: table;
  }
  tr.visible-lg.visible-xs {
    display: table-row !important;
  }
  th.visible-lg.visible-xs,
  td.visible-lg.visible-xs {
    display: table-cell !important;
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .visible-lg.visible-sm {
    display: block !important;
  }
  table.visible-lg.visible-sm {
    display: table;
  }
  tr.visible-lg.visible-sm {
    display: table-row !important;
  }
  th.visible-lg.visible-sm,
  td.visible-lg.visible-sm {
    display: table-cell !important;
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .visible-lg.visible-md {
    display: block !important;
  }
  table.visible-lg.visible-md {
    display: table;
  }
  tr.visible-lg.visible-md {
    display: table-row !important;
  }
  th.visible-lg.visible-md,
  td.visible-lg.visible-md {
    display: table-cell !important;
  }
}
<%-- some comment --%>
@media (min-width: 1200px) {<%-- some comment --%>
  .visible-lg {
    display: block !important;
  }
  table.visible-lg {
    display: table;
  }
  tr.visible-lg {
    display: table-row !important;
  }
  th.visible-lg,
  td.visible-lg {
    display: table-cell !important;
  }
}

.hidden-xs {
  display: block !important;
}

table.hidden-xs {
  display: table;
}

tr.hidden-xs {
  display: table-row !important;
}

th.hidden-xs,
td.hidden-xs {
  display: table-cell !important;
}

@media (max-width: 767px) {
  .hidden-xs,
  tr.hidden-xs,
  th.hidden-xs,
  td.hidden-xs {
    display: none !important;
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .hidden-xs.hidden-sm,
  tr.hidden-xs.hidden-sm,
  th.hidden-xs.hidden-sm,
  td.hidden-xs.hidden-sm {
    display: none !important;
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .hidden-xs.hidden-md,
  tr.hidden-xs.hidden-md,
  th.hidden-xs.hidden-md,
  td.hidden-xs.hidden-md {
    display: none !important;
  }
}

@media (min-width: 1200px) {
  .hidden-xs.hidden-lg,
  tr.hidden-xs.hidden-lg,
  th.hidden-xs.hidden-lg,
  td.hidden-xs.hidden-lg {
    display: none !important;
  }
}

.hidden-sm {
  display: block !important;
}

table.hidden-sm {
  display: table;
}

tr.hidden-sm {
  display: table-row !important;
}

th.hidden-sm,
td.hidden-sm {
  display: table-cell !important;
}

@media (max-width: 767px) {
  .hidden-sm.hidden-xs,
  tr.hidden-sm.hidden-xs,
  th.hidden-sm.hidden-xs,
  td.hidden-sm.hidden-xs {
    display: none !important;
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .hidden-sm,
  tr.hidden-sm,
  th.hidden-sm,
  td.hidden-sm {
    display: none !important;
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .hidden-sm.hidden-md,
  tr.hidden-sm.hidden-md,
  th.hidden-sm.hidden-md,
  td.hidden-sm.hidden-md {
    display: none !important;
  }
}

@media (min-width: 1200px) {
  .hidden-sm.hidden-lg,
  tr.hidden-sm.hidden-lg,
  th.hidden-sm.hidden-lg,
  td.hidden-sm.hidden-lg {
    display: none !important;
  }
}

.hidden-md {
  display: block !important;
}

table.hidden-md {
  display: table;
}

tr.hidden-md {
  display: table-row !important;
}

th.hidden-md,
td.hidden-md {
  display: table-cell !important;
}

@media (max-width: 767px) {
  .hidden-md.hidden-xs,
  tr.hidden-md.hidden-xs,
  th.hidden-md.hidden-xs,
  td.hidden-md.hidden-xs {
    display: none !important;
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .hidden-md.hidden-sm,
  tr.hidden-md.hidden-sm,
  th.hidden-md.hidden-sm,
  td.hidden-md.hidden-sm {
    display: none !important;
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .hidden-md,
  tr.hidden-md,
  th.hidden-md,
  td.hidden-md {
    display: none !important;
  }
}
<%-- some comment --%>
@media (min-width: 1200px) {
  .hidden-md.hidden-lg,
  tr.hidden-md.hidden-lg,
  th.hidden-md.hidden-lg,
  td.hidden-md.hidden-lg {
    display: none !important;
  }
}

.hidden-lg {
  display: block !important;
}

table.hidden-lg {
  display: table;
}

tr.hidden-lg {
  display: table-row !important;
}

th.hidden-lg,
td.hidden-lg {
  display: table-cell !important;
}

@media (max-width: 767px) {
  .hidden-lg.hidden-xs,
  tr.hidden-lg.hidden-xs,
  th.hidden-lg.hidden-xs,
  td.hidden-lg.hidden-xs {
    display: none !important;
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .hidden-lg.hidden-sm,
  tr.hidden-lg.hidden-sm,
  th.hidden-lg.hidden-sm,
  td.hidden-lg.hidden-sm {
    display: none !important;
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .hidden-lg.hidden-md,
  tr.hidden-lg.hidden-md,
  th.hidden-lg.hidden-md,
  td.hidden-lg.hidden-md {
    display: none !important;
  }
}

@media (min-width: 1200px) {
  .hidden-lg,
  tr.hidden-lg,
  th.hidden-lg,
  td.hidden-lg {
    display: none !important;
  }
}

.visible-print,
tr.visible-print,
th.visible-print,
td.visible-print {
  display: none !important;
}

@media print {
  .visible-print {
    display: block !important;
  }
  table.visible-print {
    display: table;
  }
  tr.visible-print {
    display: table-row !important;
  }
  th.visible-print,
  td.visible-print {
    display: table-cell !important;
  }
  .hidden-print,
  tr.hidden-print,
  th.hidden-print,
  td.hidden-print {
    display: none !important;
  }
}

.container-full {
  margin: 0 auto;
  width: 100%;
}

.col-centered{
    float: none;
    margin: 0 auto;
}

.container-full {
  margin: 0 auto;
  width: 100%;
}

.top-buffer { padding-top:10px; }
.bottom-buffer { padding-bottom:10px; }
.caption {text-align:center;}
.margin{
	margin-left: 20px;
}
.margin:before {
  content: "\2023\00A0";
}

.face {
	border: 0;
	width: 30px;
	height: 30px;
}
<!-- TODO rename the face* appropriatelly -->
.face-active-0{
	background: url("${resource(dir:'images', file: 'face-active-3.png', absolute: true)}") 0 0 no-repeat !important;
}
.face-active-1{
	background: url("${resource(dir:'images', file: 'face-active-2.png', absolute: true)}") 0 0 no-repeat !important;
}
.face-active-2{
	background: url("${resource(dir:'images', file: 'face-active-1.png', absolute: true)}") 0 0 no-repeat !important;
}
.face-active-3{
	background: url("${resource(dir:'images', file: 'face-active-0.png', absolute: true)}") 0 0 no-repeat !important;
}
.face-inactive-0{
	background: url("${resource(dir:'images', file: 'face-inactive-3.png', absolute: true)}") 0 0 no-repeat !important;
}
.face-inactive-1{
	background: url("${resource(dir:'images', file: 'face-inactive-2.png', absolute: true)}") 0 0 no-repeat !important;
}
.face-inactive-2{
	background: url("${resource(dir:'images', file: 'face-inactive-1.png', absolute: true)}") 0 0 no-repeat !important;
}
.face-inactive-3{
	background: url("${resource(dir:'images', file: 'face-inactive-0.png', absolute: true)}") 0 0 no-repeat !important;
}

/* angularjs animation */
.slide.ng-move,
.slide.ng-enter,
.slide.ng-leave {
  -webkit-transition:all linear 0.5s;
  transition:all linear 0.5s;
}
 
.slide.ng-leave.ng-leave-active,
.slide.ng-move,
.slide.ng-enter {
  opacity:0;
  max-height:0;
}
 <%-- some comment --%>
.slide.ng-leave,
.slide.ng-move.ng-move-active,
.slide.ng-enter.ng-enter-active {
  opacity:1;
  max-height:40px;
}

.panel-heading a, .panel-heading a:hover{
	color: white;
}

button.navbar-btn.no-collapse{
	margin: 2px 8px 0px 8px !important;
}

button.btn-dropdown-like,button.btn-dropdown-like.open{
	border: 0px;
	background-color: #f8f8f8 !important;
	color: #777777;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
}

@page {  size: A4; }
@page {  margin: 5px; }
		</style>
	</head>
	<body>
		<div style="width: 750px;">
		<div class="row">
			<div class="col-xs-12">
				<h5><%=eev.eevQuestions.title%></h5>
			</div>
			<div class="col-xs-12">
				  <span style="border: 1px; font-size: 8px;">Vendeur:&nbsp;</span>
				  <span style="border: 1px; font-size: 8px;">${eev.interviewee}</span>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<g:each in="${eev.eevQuestions.contents.sort{it.rank}}" var="group" status="index">
				<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class=" panel-title">${group.title}</h3>
				</div>
					<div class="panel-body">
						<div class="list-group col-xs-12 col-xs-12">
						<div class="row">
							<div class="col-xs-12" style="border: 1px; font-size: 8px;">
								Points a ameliorer: ${eev.answers.find{a -> a.question.id == group.weaknessesQuestion?.question?.id}?.answer}
							</div>
							<div class="col-xs-12" style="border: 1px; font-size: 8px;">
								Points forts: ${eev.answers.find{a -> a.question.id == group.strengthsQuestion?.question?.id}?.answer}
							</div>
						</div>
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
            			<div class="list-group">
						<g:each in="${flattenedRows}" var="content" status="jindex">
						<a class="list-group-item">
						 	<g:if test="${ content.hasProperty('contents')}">
						 	<span style="font-size: 10px;">${content.title}</span>
						 	</g:if>
						 	<g:else>
								<span class="${flattenedIds.contains(content.id)?'margin':''}" style="font-size: 8px;">${content.question.question}</span>
								<span class="pull-right">
									<g:each in="${3..0}" var="faceIndex">
									<% def answerIndex = eev.answers.find{a -> a.question.id == content.question.id}?.answer %>
									<img src="${resource(dir:'images')}/face-${answerIndex && new Integer(answerIndex) == faceIndex? 'active': 'inactive'}-${faceIndex}.png" width="15px" height="auto" />
									</g:each>
								</span>
							</g:else>
						 </a>
						</g:each>
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
