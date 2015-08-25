<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/persons">
		<table border = '1' cellpadding='5'>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>직업</th>
			</tr>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<xsl:template match="person">	
		<tr>
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	<xsl:template match="name">
		<td><xsl:value-of select="."></xsl:value-of></td>	
	</xsl:template>
	<xsl:template match="age">
		<td><xsl:value-of select="."></xsl:value-of></td>	
	</xsl:template>
	<xsl:template match="job">
		<td><xsl:value-of select="."></xsl:value-of></td>	
	</xsl:template>
</xsl:stylesheet>