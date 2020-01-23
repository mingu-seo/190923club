<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>    

<% 
	String fileName = request.getParameter("file_name");
	System.out.println(fileName);
	String savePath = "upload";
//	ServletContext context = getServletContext();
//	String sDownloadPath = context.getRealPath(savePath);
	String sFilePath = "/upload/images/"+fileName;
//	System.out.println(sFilePath);
	byte b[] = new byte[4096];
	File f = new File(sFilePath);
	BufferedInputStream in = new BufferedInputStream(new FileInputStream(f));
	BufferedOutputStream out2 = new BufferedOutputStream(response.getOutputStream());
	
	String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMineType>>>" + sMimeType);

	if (sMimeType == null) sMimeType = "application/octet-stream";
	
	response.setContentType(sMimeType);
	String agent = request.getHeader("User-Agent");
	boolean ieBrowser = (agent.indexOf("MSIE") > -1) || 
	(agent.indexOf("Trident") > -1);

	if (ieBrowser) {
		fileName = URLEncoder.encode(fileName, "UTF-8").
		replaceAll("\\+", "%20");
	}else {
		fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
	}
	
	response.setHeader("Content-Disposition", "attachment; filename= " + fileName);
	
	int numRead;
	
	while ((numRead = in.read(b, 0, b.length)) != -1){
		out2.write(b, 0, numRead);
	}
	out2.flush();
	out2.close();
	in.close();
%>
    


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>