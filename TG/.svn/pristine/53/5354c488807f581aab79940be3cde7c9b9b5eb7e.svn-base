
var xhr = null;

function getXMLHttpRequest() {
	if(window.ActiveXObject){
		
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
		
	}else if(window.XMLHttpRequest){
		
		return new XMLHttpRequest();
	}else {
		return null;
	}
}

function sendRequest(url, params, callback, method) {
	xhr = getXMLHttpRequest();
	var httpMethod = method ? method : 'GET';
	xhr.onreadystatechange=callback;
	if(httpMethod != 'GET' && httpMethod != 'POST'){
		httpMethod = 'GET';
	}
	var httpParams = (params==null || params=='') ? null : params;
	
	var httpUrl = url;
	if(httpMethod=='GET' && httpParams != null){
		httpUtl = httpUrl + "?" + httpParams;
	}
	xhr.open(httpMethod, httpUrl, true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send(httpMethod == 'POST' ? httpParams : null);
	
}