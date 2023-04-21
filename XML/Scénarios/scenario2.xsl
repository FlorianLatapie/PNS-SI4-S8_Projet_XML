<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Liste des clients ayant réservé un séjour linguistique</title>
      </head>
      <body>
        <h1>Liste des clients ayant réservé un séjour linguistique</h1>
        <table>
          <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
			<th>Tranche d'age</th>
          </tr>
          <xsl:for-each select="agence/voyages/sejour/clients/client">
            <tr>
              <td><xsl:value-of select="@id"/></td>
              <td><xsl:value-of select="agence/clients/client[@id=current()/@idClient]/nom"/></td>
              <td><xsl:value-of select="agence/clients/client[@id=current()/@idClient]/prenom"/></td>
              <td><xsl:value-of select="agence/clients/client[@id=current()/@idClient]/type"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
