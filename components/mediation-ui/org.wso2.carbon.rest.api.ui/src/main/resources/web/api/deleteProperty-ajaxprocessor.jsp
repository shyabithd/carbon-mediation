<%--
  ~  Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
  ~
  ~  Licensed under the Apache License, Version 2.0 (the "License");
  ~  you may not use this file except in compliance with the License.
  ~  You may obtain a copy of the License at
  ~
  ~  http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~  Unless required by applicable law or agreed to in writing, software
  ~  distributed under the License is distributed on an "AS IS" BASIS,
  ~  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~  See the License for the specific language governing permissions and
  ~  limitations under the License.
  --%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.wso2.carbon.rest.api.stub.types.carbon.HandlerData"%>
<%@page import="java.util.List"%>
<%@ page import="org.apache.commons.lang.ArrayUtils" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://wso2.org/projects/carbon/taglibs/carbontags.jar" prefix="carbon" %>

<%
	int index = Integer.parseInt(request.getParameter("index"));
	String propertyIndex = request.getParameter("propIndex");

	List<HandlerData> handlerList =
			(ArrayList<HandlerData>)session.getAttribute("apiHandlers");
	HandlerData handler = handlerList.get(index);
	String[] properties = handler.getProperties();
	properties = (String[]) ArrayUtils.remove(properties, Integer.parseInt(propertyIndex));
	handler.setProperties(properties);
	session.setAttribute("apiHandlers", handlerList);
%>