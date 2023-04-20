<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
	<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css"/>
	</head>
	<body>
		<h1>Séjours linguistiques pour les familles</h1>
		<table>
		<tr>
			<th>Type de séjour</th>
			<th>Destination</th>
			<th>Description</th>
			<!--Pourrait être amélioré en divisant début & fin-->
			<th>Dates</th>
			<th>Langues</th>
			<th>Prix</th>
			<th> de participants</th>
		</tr>
		<xsl:for-each select="agence/voyages/offre[trancheAge='Enfant']">
			<tr>
			<td><xsl:value-of select="type"/></td>
			<td><xsl:value-of select="destination"/></td>
			<td><xsl:value-of select="description"/></td>
			<td><xsl:value-of select="duree"/></td>
			<td><xsl:value-of select="langue/@nom"/></td>
			<td><xsl:value-of select="concat(prix,' Euros')"/></td>
			<td><xsl:value-of select="nbMaxParticipants"/></td>
			</tr>
		</xsl:for-each>
		</table>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>